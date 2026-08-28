-- =========================================================
--             NETFLIX MOVIES AND TV SHOWS DATABASE
--                         Assessment 4
--                     DDL AND DML QUERIES
--                       Questions 11–21
-- =========================================================

-- Q11. Add a language column to the table.
ALTER TABLE netflix_data
ADD COLUMN language VARCHAR(30);

-- Q12. Describe the structure of the table.
DESCRIBE netflix_data;

-- Q13. Display the columns of the table.
SHOW COLUMNS FROM netflix_data;

-- Q14. Display the first 5 records.
SELECT *
FROM netflix_data
LIMIT 5;

-- Q15. Modify the release_year column to SMALLINT.
ALTER TABLE netflix_data
MODIFY COLUMN release_year SMALLINT;

-- Q16. Set the language value of all records to English.
UPDATE netflix_data
SET language = 'English';

-- Q17. Classify titles by rating into English-Adult or English-General.
UPDATE netflix_data
SET language = CASE
    WHEN rating IN ('TV-MA', 'R', 'NC-17') THEN 'English-Adult'
    ELSE 'English-General'
END;

-- Q18. Rename date_added to added_date.
ALTER TABLE netflix_data
RENAME COLUMN date_added TO added_date;

-- Q19. Add a CHECK constraint for release year.
ALTER TABLE netflix_data
ADD CONSTRAINT chk_release_year
CHECK (release_year >= 1900);

-- Q20. Rename the table.
RENAME TABLE netflix_data TO netflix_titles;

-- Q21. Create an index on the title column.
CREATE INDEX idx_title
ON netflix_titles(title);
