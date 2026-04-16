-- ================================================
-- NETFLIX DATA ANALYSIS
-- Analysis Views
-- Author: Prudence Chebet
-- ================================================

USE netflix_data_analysis;

-- 1. CONTENT TYPE SPLIT
-- ----------------------
CREATE OR REPLACE VIEW content_type AS
SELECT 
    type,
    YEAR(date_added) AS year,
    COUNT(*) AS Total
FROM data_dictionary
WHERE type IS NOT NULL
GROUP BY type, year;

-- 2. TOP PRODUCING COUNTRIES
-- ---------------------------
CREATE OR REPLACE VIEW top_countries AS
SELECT
    country,
    type,
    YEAR(date_added) AS year,
    COUNT(*) AS Total
FROM data_dictionary
WHERE country IS NOT NULL
GROUP BY country, type, year
ORDER BY Total DESC;

-- 3. YEARLY GROWTH TREND
-- -----------------------
CREATE OR REPLACE VIEW yearly_titles_added AS
SELECT
    YEAR(date_added) AS year,
    type,
    COUNT(*) AS titles_added
FROM data_dictionary
WHERE date_added IS NOT NULL
GROUP BY year, type
ORDER BY year;

-- 4. MOST COMMON RATINGS
-- -----------------------
CREATE OR REPLACE VIEW common_ratings AS
SELECT
    rating,
    COUNT(*) AS Count
FROM data_dictionary
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY Count DESC;

-- 5. AVERAGE MOVIE DURATION BY YEAR
-- -----------------------------------
CREATE OR REPLACE VIEW average_movie_duration AS
SELECT
    release_year,
    ROUND(AVG(duration_min), 1) AS avg_duration
FROM data_dictionary
WHERE type = 'Movie'
AND release_year IS NOT NULL
AND duration_min IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

-- 6. TOP GENRES
-- --------------
CREATE OR REPLACE VIEW top_genres AS
SELECT
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(listed_in, ',', n.n), ',', -1)) AS genre,
    COUNT(*) AS total
FROM data_dictionary
JOIN (SELECT 1 n UNION SELECT 2 UNION SELECT 3) n
    ON CHAR_LENGTH(listed_in) - CHAR_LENGTH(REPLACE(listed_in, ',', '')) >= n.n - 1
GROUP BY genre
HAVING genre NOT IN ('Movies', 'TV Shows')
ORDER BY total DESC;