-- 1. Create role for the schema owner
DO $$
BEGIN
    RAISE NOTICE '📣 Create role: openstreetmap_schema_owner';
END
$$;

CREATE ROLE openstreetmap_schema_owner NOLOGIN;

-- 2. Create schema
DO $$
BEGIN
    RAISE NOTICE '📣 Create schema: openstreetmap_schema';
END
$$;

CREATE SCHEMA openstreetmap_schema AUTHORIZATION openstreetmap_schema_owner;

-- 3. Create role for service
DO $$
BEGIN
    RAISE NOTICE '📣 Create role: svc_openstreetmap_schema';
END
$$;

CREATE ROLE svc_openstreetmap_schema LOGIN PASSWORD 'password';

SET ROLE openstreetmap_schema_owner;
GRANT USAGE ON SCHEMA openstreetmap_schema TO svc_openstreetmap_schema;
GRANT CREATE ON SCHEMA openstreetmap_schema TO svc_openstreetmap_schema;
RESET ROLE;