-- Select distinct block numbers and their matching patterns
SELECT DISTINCT h.block, p.pattern
FROM patterns p
-- Join the 'patterns' table with the 'hashes' table
JOIN hashes h 
-- Match each pattern to a hash where the pattern appears as a substring within the hash
ON h.hash LIKE '%' || p.pattern || '%'
-- Filter for only those patterns that are meant to be matched horizontally
WHERE p.direction = 'h';