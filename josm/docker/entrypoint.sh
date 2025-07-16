#!/bin/bash
set -e

# Wait for web service API endpoint to be ready
echo "⏳ Waiting for web API endpoint /api/capabilities on port 3000..."
until curl -s --fail http://localhost:3000/api/capabilities > /dev/null; do
  echo "🔄 Still waiting for /api/capabilities..."
  sleep 2
done

echo "✅ All services are up. Starting JOSM..."
exec java \
  --add-exports=java.base/sun.security.action=ALL-UNNAMED \
  --add-exports=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED \
  --add-exports=java.desktop/com.sun.imageio.spi=ALL-UNNAMED \
  -jar /app/josm.jar