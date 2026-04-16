SET SQL_SAFE_UPDATES = 0;
-- SELECT
-- 	director,
--     cast
-- FROM
-- 	data_dictionary
-- WHERE
-- 	director = cast
-- AND 
-- 	director IS NOT NULL
-- AND
--     cast IS NOT NULL;

-- UPDATE
-- 	data_dictionary
-- SET
-- 	rating = 'Unknown',
--     duration = '74 min'
-- WHERE
-- 	show_id = 's5542';

-- UPDATE
-- 	data_dictionary
-- SET
-- 	rating = 'Unknown',
--     duration = '84 min'
-- WHERE
--     show_id = 's5795';

-- UPDATE
-- 	data_dictionary
-- SET
-- 	rating = 'Unknown',
--     duration = '66 min'
-- WHERE
--     show_id = 's5814';
    
-- UPDATE
-- 	data_dictionary
-- SET
-- 	rating = NULLIF(rating, 'Unknown');

-- UPDATE
-- 	data_dictionary
-- SET
-- 	rating = NULLIF(rating, '');

-- UPDATE
-- 	data_dictionary
-- SET
-- 	rating = 'Not Rated'
-- WHERE
-- 	rating = 'Not Specified'
-- OR
-- 	rating IS NULL;

-- UPDATE 
-- 	data_dictionary
-- SET
-- 	duration = CONCAT(duration, ' min')
-- WHERE
-- 	type = 'Movie'
-- AND
-- 	duration NOT LIKE '%min%';

-- ALTER TABLE data_dictionary
-- ADD COLUMN duration_min INT;

UPDATE
	data_dictionary
SET
	duration_min = CAST(REPLACE(duration, 'min', '') AS UNSIGNED)
WHERE
	type = 'Movie'
AND
	duration LIKE '%min%'
AND
	duration != 'Unknown'
AND
	duration IS NOT NULL;