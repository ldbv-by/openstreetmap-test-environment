CREATE ROLE openstreetmap_schema_owner LOGIN PASSWORD 'password';
CREATE SCHEMA openstreetmap_schema AUTHORIZATION openstreetmap_schema_owner;
