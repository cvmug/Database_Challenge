-- This is a conceptual example and not directly executable SQL. The logic outlines an approach to concatenate hashes vertically by block and search for patterns.

-- CTE to aggregate hashes vertically by position. This part is conceptual and illustrates the intended logic, not direct PostgreSQL syntax.
WITH vertical_hashes AS (
  -- Aggregate characters from each hash's specific position, ordered by ID to ensure vertical alignment.
  SELECT
    block,
    -- Aggregate characters vertically. This operation is conceptual and assumes a function that could perform such aggregation, which is not natively available in SQL.
    string_agg(substring(hash, pos, 1), '' ORDER BY id) AS vertical_concat
  FROM
    hashes,
    -- Generate a series to iterate over hash positions. Assumes all hashes are of equal length.
    generate_series(1, length(hash)) AS pos
  GROUP BY
    block, pos
)
-- Main query to find matching vertical patterns.
SELECT
    p.id AS pattern_id,
    p.pattern,
    vh.block
FROM
    patterns p
    -- Join with our conceptual vertical concatenation of hashes.
    JOIN vertical_hashes vh ON vh.vertical_concat LIKE '%' || p.pattern || '%'
WHERE
    -- Filtering for patterns that are supposed to match vertically.
    p.direction = 'v';