#!/bin/bash
set -e

# Wait for web service API endpoint to be ready
echo "⏳ Waiting for web API endpoint /api/capabilities on port 3000..."
until curl -s --fail http://web:3000/api/capabilities > /dev/null; do
  echo "🔄 Still waiting for /api/capabilities..."
  sleep 2
done

echo "✅ All services are up. Starting Server. JOSM is ready..."
exec /usr/bin/tini -- /dockerstartup/startup.sh