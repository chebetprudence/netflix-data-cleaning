-- ================================================
-- NETFLIX DATA ANALYSIS
-- Data Cleaning Queries
-- Author: Prudence Chebet
-- ================================================

SET SQL_SAFE_UPDATES = 0;

-- 1. FIX MISALIGNED RATING AND DURATION ROWS
-- -------------------------------------------
UPDATE data_dictionary
SET rating = 'Unknown', duration = '74 min'
WHERE show_id = 's5542';

UPDATE data_dictionary
SET rating = 'Unknown', duration = '84 min'
WHERE show_id = 's5795';

UPDATE data_dictionary
SET rating = 'Unknown', duration = '66 min'
WHERE show_id = 's5814';

-- 2. STANDARDIZE MISSING RATINGS
-- --------------------------------
UPDATE data_dictionary
SET rating = 'Not Rated'
WHERE rating = 'Not Specified'
OR rating IS NULL;

-- 3. ADD NUMERIC DURATION COLUMN FOR MOVIES
-- ------------------------------------------
ALTER TABLE data_dictionary
ADD COLUMN duration_min INT;

UPDATE data_dictionary
SET duration_min = CAST(TRIM(REPLACE(duration, 'min', '')) AS UNSIGNED)
WHERE type = 'Movie'
AND duration LIKE '%min%'
AND TRIM(duration) != 'Unknown min'
AND duration IS NOT NULL;