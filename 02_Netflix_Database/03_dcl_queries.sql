-- =========================================================
-- NETFLIX MOVIES AND TV SHOWS DATABASE
-- Assessment 4
-- DCL QUERIES
-- Questions 22–32
-- =========================================================

-- Q22. Create a MySQL user for Netflix analysis.
CREATE USER 'netflix_analyst'@'localhost'
IDENTIFIED BY '123456';

-- Q23. Grant SELECT permission on the Netflix titles table.
GRANT SELECT
ON netflix_db.netflix_titles
TO 'netflix_analyst'@'localhost';

-- Q24. Grant SELECT and INSERT permissions.
GRANT SELECT, INSERT
ON netflix_db.netflix_titles
TO 'netflix_analyst'@'localhost';

-- Q25. Grant SELECT, INSERT and UPDATE permissions.
GRANT SELECT, INSERT, UPDATE
ON netflix_db.netflix_titles
TO 'netflix_analyst'@'localhost';

-- Q26. Grant all privileges on the Netflix titles table.
GRANT ALL PRIVILEGES
ON netflix_db.netflix_titles
TO 'netflix_analyst'@'localhost';

-- Q27. Grant all privileges on the Netflix database.
GRANT ALL PRIVILEGES
ON netflix_db.*
TO 'netflix_analyst'@'localhost';

-- Q28. Apply privilege changes.
FLUSH PRIVILEGES;

-- Q29. Display the privileges assigned to the user.
SHOW GRANTS FOR 'netflix_analyst'@'localhost';

-- Q30. Revoke UPDATE and DELETE privileges on the table.
REVOKE UPDATE, DELETE
ON netflix_db.netflix_titles
FROM 'netflix_analyst'@'localhost';

-- Q31. Revoke all privileges on the Netflix titles table.
REVOKE ALL PRIVILEGES
ON netflix_db.netflix_titles
FROM 'netflix_analyst'@'localhost';

-- Q32. Remove the Netflix analyst user.
DROP USER 'netflix_analyst'@'localhost';
