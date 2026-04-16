SET SQL_SAFE_UPDATES = 0;
-- CONTENT SPLIT
-- ------------------------
USE netflix_data_analysis;
CREATE OR REPLACE VIEW content_type AS
	SELECT 
		type,
        YEAR(date_added) AS year,
		COUNT(*) AS Total
	FROM data_dictionary
	WHERE
		type IS NOT NULL
	GROUP BY
		type,
        year;

-- TOP 10 PRODUCING COUNTRIES
-- --------------------------
-- DROP VIEW top_countries;
-- CREATE VIEW top_countries AS
-- 	SELECT
-- 		country,
--         type,
--         YEAR(date_added) AS Year,
-- 		COUNT(*) AS Total
-- 	FROM
-- 		data_dictionary
-- 	WHERE
-- 		country IS NOT NULL
-- 	GROUP BY
-- 		country,
--         type,
--         Year
-- 	ORDER BY
-- 		Total DESC;

-- V_YEARS
-- ---------
-- CREATE OR REPLACE VIEW v_years AS
-- 	SELECT DISTINCT 
-- 		YEAR(date_added) AS year
-- 	FROM
-- 		data_dictionary
-- 	WHERE
-- 		date_added IS NOT NULL
-- 	ORDER BY
-- 		year;
	
-- YEARLY GROWTH TREND
-- --------------------
-- DROP VIEW yearly_titles_added;
-- CREATE VIEW yearly_titles_added AS
--  	SELECT
--  		YEAR(date_added) AS Year,
--         type,
--  		COUNT(*) AS Titles_added
--  	FROM 
--  		data_dictionary
--  	WHERE
--  		date_added IS NOT NULL
--  	GROUP BY
--  		year,
--         type
--  	ORDER BY
--  		Year;

-- SELECT
-- 	*
-- FROM
-- 	yearly_titles_added
-- ORDER BY
-- 	Titles_added DESC;

-- MOST COMMON RATINGS
-- --------------------

-- CREATE VIEW common_ratings AS
-- 	SELECT
-- 		rating,
-- 		COUNT(*) AS Count
-- 	FROM
-- 		data_dictionary
-- 	WHERE
-- 		rating IS NOT NULL
-- 	GROUP BY
-- 		rating
-- 	ORDER BY
-- 		Count DESC;

-- AVERAGE MOVIE DURATION PER YEAR
-- --------------------------------
-- CREATE VIEW average_movie_duration AS
-- 	SELECT
-- 		release_year,
-- 		AVG(CAST(REPLACE(duration, 'min', '') AS UNSIGNED)) AS AVG_duration
-- 	FROM
-- 		data_dictionary
-- 	WHERE
-- 		type = 'Movie'
-- 	AND
-- 		release_year IS NOT NULL
-- 	GROUP BY
-- 		release_year
-- 	ORDER BY
-- 		release_year;

-- MOST DOMINANT GENRE
-- --------------------
-- CREATE VIEW top_genres AS
-- 	SELECT
-- 		TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(listed_in, ',', n.n), ',', -1)) AS genre,
-- 		COUNT(*) AS total
-- 	FROM
-- 		data_dictionary
-- 	JOIN
-- 		(SELECT 1 n UNION SELECT 2 UNION SELECT 3) n
-- 	ON
-- 		CHAR_LENGTH(listed_in) - CHAR_LENGTH(REPLACE(listed_in, ',', '')) >= n.n - 1
-- 	GROUP BY
-- 		genre
-- 	HAVING
-- 		genre NOT IN ('Movies', 'TV Shows')
-- 	ORDER BY
-- 		total DESC;
    




	