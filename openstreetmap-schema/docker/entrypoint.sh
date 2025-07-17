#!/bin/bash
set -e

echo "🔧 Starting OpenStreetMap Schema Setup..."

# 1. Wait until the database is reachable
echo "⏳ Waiting for the database to be ready..."
until pg_isready -h db -p 54321 -U postgres > /dev/null 2>&1; do
  echo "⏳ Database not ready yet – waiting..."
  sleep 1
done

# 2. Create openstreetmap_schema in database if not exists
SCHEMA_EXISTS=$(psql -h db -U postgres -d openstreetmap_test_environment -tAc \
  "SELECT 1 FROM pg_namespace WHERE nspname = 'openstreetmap_schema'")

if [ "$SCHEMA_EXISTS" != "1" ]; then
  echo "📁 Schema 'openstreetmap_schema' does not exist – creating..."
  psql -h db -U postgres -d openstreetmap_test_environment -f /app/db/create-schema.sql
else
  echo "✅ Schema 'openstreetmap_schema' already exists – skipping creation."
fi

# 3. Start OpenStreetMap Schema Service
echo "🚀 Starting OpenStreetMap Schema Service..."
exec java -jar /app/openstreetmap-schema.jar