-- =========================================================
--                   Blood Donation Camp DB
--                       Insert Queries
-- =========================================================

USE BloodDonationCamp;

-- Q18. Insert event details
INSERT INTO EVENT
VALUES (
    101,
    'VIT Blood Donation Camp',
    '2026-03-15',
    'Anna Auditorium',
    'Red Cross Society',
    '10:00:00',
    '16:00:00',
    'Scheduled'
);

-- Q19. Insert donor details
INSERT INTO DONOR
(
    Donor_ID,
    Donor_Name,
    Age,
    Gender,
    Blood_Group,
    Phone_No,
    Email,
    Address,
    Weight_kg
)
VALUES
(
    201,
    'Rahul Sharma',
    22,
    'Male',
    'B+',
    '9876543210',
    'rahul@gmail.com',
    'Chennai',
    68.50
);

-- Q20. Insert another donor
INSERT INTO DONOR
(
    Donor_ID,
    Donor_Name,
    Age,
    Gender,
    Blood_Group,
    Phone_No,
    Email,
    Address,
    Weight_kg
)
VALUES
(
    202,
    'Priya Nair',
    20,
    'Female',
    'O+',
    '9876501234',
    'priya@gmail.com',
    'Hyderabad',
    57.00
);

-- Q21. Insert staff details
INSERT INTO STAFF
VALUES (
    301,
    'Dr. Anil Kumar',
    'Medical Officer',
    '9123456789',
    'anil@vit.ac.in',
    101
);

-- Q22. Insert donation details
INSERT INTO DONATION
VALUES (
    401,
    '2026-03-15',
    '10:30:00',
    450,
    '120/80',
    14.2,
    'Eligible',
    'Negative',
    201,
    101
);
