#!/bin/bash
set -e

echo "🔧 Starting OpenStreetMap Website setup..."

# 1. Copy configuration files
echo "📁 Copying example configuration files..."
cp -r /app/host/config/* /app/config
touch /app/config/settings.local.yml

# 2. Wait until the database is reachable
echo "⏳ Waiting for the database to be ready..."
until pg_isready -h db -p 5432 -U postgres > /dev/null 2>&1; do
  echo "⏳ Database not ready yet – waiting..."
  sleep 1
done

# 3. Prepare the database (create, load schema, or migrate depending on state)
echo "🗃️ Running database setup..."
bundle exec rails db:prepare

# 4. Import initial data with Osmosis (if .pbf file exists)
PBF_FILE="/app/host/db/data.osm.pbf"
if [ -f "$PBF_FILE" ]; then

  NODE_COUNT=$(psql -h db -U openstreetmap -d openstreetmap -t -c "SELECT COUNT(*) FROM current_nodes;" | xargs)
  WAY_COUNT=$(psql -h db -U openstreetmap -d openstreetmap -t -c "SELECT COUNT(*) FROM current_ways;" | xargs)
  RELATION_COUNT=$(psql -h db -U openstreetmap -d openstreetmap -t -c "SELECT COUNT(*) FROM current_relations;" | xargs)

  if [ "$NODE_COUNT" -eq 0 ] && [ "$WAY_COUNT" -eq 0 ] && [ "$RELATION_COUNT" -eq 0 ]; then
    echo "🗺️ Importing OSM data from $PBF_FILE ..."
    osmosis \
      -verbose \
      --read-pbf "$PBF_FILE" \
      --log-progress \
      --write-apidb \
        host="db" \
        database="openstreetmap" \
        user="openstreetmap" \
        validateSchemaVersion="no"

    echo "🔁 Insert Test User..."
    psql -h db -U openstreetmap -d openstreetmap -f /app/host/db/add-users.sql

    echo "🔁 Resetting Postgres sequences..."
    psql -h db -U openstreetmap -d openstreetmap -f /app/host/db/reset-sequences.sql

    echo "📝 Registering OAuth app for iD-user (safe to re-run)..."
    rm -f /app/config/settings.local.yml
    bundle exec rails "oauth:register_apps[iD-user]"
  else
    echo "⚠️ Database is not empty – skipping import."
  fi
else
  echo "⚠️ PBF file not found at $PBF_FILE – skipping import."
fi

# 5) Rails-Server starten (PID 1)
echo "🚀 Starting Rails server..."
exec bundle exec rails s -p 3000 -b 0.0.0.0