-- =========================================================
--                 Blood Donation Camp DB
--              Database Setup, DDL Queries
-- =========================================================

-- Q1. Create the database
CREATE DATABASE BloodDonationCamp;

-- Q2. Select the database
USE BloodDonationCamp;

-- Q3. Create EVENT table
CREATE TABLE EVENT (
    Event_ID INT PRIMARY KEY,
    Event_Name VARCHAR(100) NOT NULL,
    Event_Date DATE NOT NULL,
    Venue VARCHAR(100) NOT NULL,
    Organizer VARCHAR(100) NOT NULL,
    Start_Time TIME,
    End_Time TIME,
    Status VARCHAR(20) DEFAULT 'Scheduled'
);

-- Q4. Create DONOR table
CREATE TABLE DONOR (
    Donor_ID INT PRIMARY KEY,
    Donor_Name VARCHAR(100) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    Blood_Group VARCHAR(5),
    Phone_No VARCHAR(15) UNIQUE,
    Email VARCHAR(100),
    Address VARCHAR(100),
    Weight DECIMAL(5,2)
);

-- Q5. Create STAFF table
CREATE TABLE STAFF (
    Staff_ID INT PRIMARY KEY,
    Staff_Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Phone_No VARCHAR(15),
    Email VARCHAR(100),
    Event_ID INT
);

-- Q6. Create DONATION table
CREATE TABLE DONATION (
    Donation_ID INT PRIMARY KEY,
    Donation_Date DATE,
    Donation_Time TIME,
    Quantity INT,
    Blood_Pressure VARCHAR(15),
    Hemoglobin DECIMAL(4,2),
    Eligibility_Status VARCHAR(20) DEFAULT 'Pending',
    HIV_Result VARCHAR(20),
    Donor_ID INT,
    Event_ID INT
);

-- Q7. Add foreign key from STAFF to EVENT
ALTER TABLE STAFF
ADD CONSTRAINT FK_Staff_Event
FOREIGN KEY (Event_ID)
REFERENCES EVENT(Event_ID);

-- Q8. Add foreign key from DONATION to DONOR
ALTER TABLE DONATION
ADD CONSTRAINT FK_Donation_Donor
FOREIGN KEY (Donor_ID)
REFERENCES DONOR(Donor_ID);

-- Q9. Add foreign key from DONATION to EVENT
ALTER TABLE DONATION
ADD CONSTRAINT FK_Donation_Event
FOREIGN KEY (Event_ID)
REFERENCES EVENT(Event_ID);

-- Q10. Add Emergency_Contact column to DONOR
ALTER TABLE DONOR
ADD COLUMN Emergency_Contact VARCHAR(15);

-- Q11. Modify the Address column
ALTER TABLE DONOR
MODIFY COLUMN Address VARCHAR(200);

-- Q12. Rename Weight to Weight_kg
ALTER TABLE DONOR
RENAME COLUMN Weight TO Weight_kg;

-- Q13. Drop Emergency_Contact column
ALTER TABLE DONOR
DROP COLUMN Emergency_Contact;

-- Q14. Add age validation constraint
ALTER TABLE DONOR
ADD CONSTRAINT CHK_Age CHECK (Age >= 18);

-- Q15. Set default value for Eligibility_Status
ALTER TABLE DONATION
MODIFY COLUMN Eligibility_Status VARCHAR(20) DEFAULT 'Pending';

-- Q16. Create an index on donor name
CREATE INDEX IX_Donor_Name
ON DONOR(Donor_Name);

-- Q17. Drop the STAFF-EVENT foreign key
ALTER TABLE STAFF
DROP FOREIGN KEY FK_Staff_Event;
