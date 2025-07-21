-- 1. Create role for the schema owner
CREATE ROLE openstreetmap_schema_owner NOLOGIN;

-- 2. Create schema
CREATE SCHEMA openstreetmap_schema AUTHORIZATION openstreetmap_schema_owner;

-- 3. Create role for service
CREATE ROLE svc_openstreetmap_schema LOGIN PASSWORD 'password';

-- 4. Grant explicit privileges
GRANT USAGE ON openstreetmap_schema TO svc_openstreetmap_schema;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA openstreetmap_schema TO svc_openstreetmap_schema;

