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
PBF_FILE="/app/config/basis-dlm-by.pbf"
if [ -f "$PBF_FILE" ]; then
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
else
  echo "⚠️ PBF file not found at $PBF_FILE – skipping import."
fi

# 5. Start the Rails server
echo "🚀 Starting Rails server..."
exec bundle exec rails s -p 3000 -b '0.0.0.0'
