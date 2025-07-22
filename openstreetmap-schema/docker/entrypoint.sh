#!/bin/sh
set -e

echo "🔧 Starting OpenStreetMap Schema Setup..."

# 1. Wait until the database is reachable
echo "⏳ Waiting for the database to be ready..."
until pg_isready -h db -p 5432 -U postgres > /dev/null 2>&1; do
  echo "⏳ Database not ready yet – waiting..."
  sleep 1
done

# 2. Wait for web service API endpoint to be ready
echo "⏳ Waiting for web API endpoint /api/capabilities on port 3000..."
until curl -s --fail http://web:3000/api/capabilities > /dev/null; do
  echo "🔄 Still waiting for /api/capabilities..."
  sleep 2
done

# 3. Create openstreetmap_schema in database if not exists
echo "📁 Prüfe ob openstreetmap_schema existiert..."
SCHEMA_EXISTS=$(psql -h db -U postgres -d openstreetmap -tAc \
  "SELECT 1 FROM pg_namespace WHERE nspname = 'openstreetmap_schema'")
echo "📁 Ergebnis..." + SCHEMA_EXISTS

if [ "$SCHEMA_EXISTS" != "1" ]; then
  echo "📁 Schema 'openstreetmap_schema' does not exist – creating..."
  psql -h db -U postgres -d openstreetmap -f /app/db/create-schema.sql
else
  echo "✅ Schema 'openstreetmap_schema' already exists – skipping creation."
fi

# 4. Start OpenStreetMap Schema Service
echo "🚀 Starting OpenStreetMap Schema Service..."
exec java -jar /app/openstreetmap-schema.jar