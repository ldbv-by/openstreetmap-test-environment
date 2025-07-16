-- Change coordinate columns from INTEGER to BIGINT to support larger range

-- CURRENT_NODES
ALTER TABLE current_nodes
    ALTER COLUMN latitude TYPE BIGINT,
    ALTER COLUMN longitude TYPE BIGINT;

-- NODES
ALTER TABLE nodes
    ALTER COLUMN latitude TYPE BIGINT,
    ALTER COLUMN longitude TYPE BIGINT;

-- NOTES
ALTER TABLE notes
    ALTER COLUMN latitude TYPE BIGINT,
    ALTER COLUMN longitude TYPE BIGINT;

-- CHANGESETS
ALTER TABLE changesets
    ALTER COLUMN min_lat TYPE BIGINT,
    ALTER COLUMN max_lat TYPE BIGINT,
    ALTER COLUMN min_lon TYPE BIGINT,
    ALTER COLUMN max_lon TYPE BIGINT;
