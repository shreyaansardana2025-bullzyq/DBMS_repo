-- =========================================================
--             Netflix Movies and TV Shows DB
--                    Basic Queries
-- =========================================================

-- Q1. Display all available databases.
SHOW DATABASES;

-- Q2. Create the Netflix database.
CREATE DATABASE netflix_db;

-- Q3. Select the Netflix database.
USE netflix_db;

-- Q4. Create the Netflix data table.
CREATE TABLE netflix_data (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(20),
    title VARCHAR(255),
    date_added VARCHAR(30),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(30)
);

-- Q5. Check the local_infile setting.
SHOW VARIABLES LIKE 'local_infile';

-- Q6. Enable local file loading.
SET GLOBAL local_infile = 1;

-- Q7. Load the Netflix CSV dataset.
-- Replace the placeholder path with the location of your CSV file.
LOAD DATA LOCAL INFILE 'path/to/netflix_data.csv'
INTO TABLE netflix_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Q8. Count the total number of titles.
SELECT COUNT(*) AS total_titles
FROM netflix_data;

-- Q9. Display the first 10 records.
SELECT *
FROM netflix_data
LIMIT 10;

-- Q10. Count titles by type and display the highest count first.
SELECT type, COUNT(*) AS total_titles
FROM netflix_data
GROUP BY type
ORDER BY total_titles DESC;
