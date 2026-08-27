-- =========================================================
-- BLOOD DONATION CAMP DATABASE
-- ASSIGNMENT QUERIES
-- Assessment 2
-- =========================================================

USE BloodDonationCamp;

-- Q23. Display all donors
SELECT *
FROM DONOR
LIMIT 0, 1000;

-- Q24. Display donor names and their corresponding event names
SELECT
    D.Donor_Name,
    E.Event_Name
FROM DONOR D
JOIN DONATION DN
    ON D.Donor_ID = DN.Donor_ID
JOIN EVENT E
    ON DN.Event_ID = E.Event_ID;

-- Q25. Display donors whose address is Hyderabad
SELECT *
FROM DONOR
WHERE Address = 'Hyderabad';

-- Q26. Display events conducted in the year 2026
SELECT *
FROM EVENT
WHERE YEAR(Event_Date) = 2026
LIMIT 0, 1000;

-- Q27. Display the first two donor records
SELECT *
FROM DONOR
LIMIT 2;

-- Q28. Update Rahul Sharma's blood group and verify the updated record
UPDATE DONOR
SET Blood_Group = 'A+'
WHERE Donor_ID = 201;

SELECT *
FROM DONOR
WHERE Donor_ID = 201;
