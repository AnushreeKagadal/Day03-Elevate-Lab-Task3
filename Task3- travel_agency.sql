CREATE DATABASE travel_agency;
USE travel_agency;
CREATE TABLE travellers (
    traveller_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    city VARCHAR(50),
    country VARCHAR(50),
    email VARCHAR(100),
    destination VARCHAR(50),
    budget_usd DECIMAL(10,2),
    days_of_trip INT
);
ALTER TABLE travellers
CHANGE COLUMN budget_usd budget_inr DECIMAL(10,2);
INSERT INTO travellers (name, age, gender, city, country, email, destination, budget_inr, days_of_trip)
VALUES
('Arjun Kabadi', 28, 'M', 'Mumbai', 'India', 'arjun.kabadi@gmail.com', 'Bali', 85000, 5),
('Anushree K', 25, 'F', 'Bengaluru', 'India', 'kagadalanu@yahoo.com', 'Istanbul', 95000, 7),
('Aishwarya Kmath', 24, 'F', 'Bengaluru', 'India', 'aishwarya.kmath@gmail.com', 'Maldives', 125000, 6),
('Raj Ghosalkar', 40, 'M', 'Pune', 'India', 'rajghosalkar@yahoo.com', 'Bali', 92000, 5),
('Vaishnav R', 29, 'M', 'Kochi', 'India', 'vaishnav.r@gmail.com', 'Switzerland', 220000, 10),
('Ananya Choudhary', 26, 'F', 'Kolkata', 'India', 'ananyachoudhary@hotmail.com', 'Dubai', 88000, 4),
('Mohit Sharma', 35, 'M', 'Jaipur', 'India', 'mohitsharma@gmail.com', 'Singapore', 110000, 8),
('Nisha Reddy', 30, 'F', 'Hyderabad', 'India', 'nishareddy@gmail.com', 'Paris', 180000, 9),
('Kabir Rao', 27, 'M', 'Chennai', 'India', 'kabir_rao@yahoo.com', 'Bali', 87000, 5),
('Priya Nair', 33, 'F', 'Kochi', 'India', 'priyanair@gmail.com', 'Maldives', 120000, 6);

-- using Select * to display all data i.e columns from table
Select * from travellers;

-- Displaying specific columns from table
Select name, destination, budget_inr FROM travellers;
SELECT name, city, days_of_trip
FROM travellers;
Select name AS Traveller_Name, city AS Traveller_City, destination AS Traveller_Destination From travellers;

-- Basic Where condition on travellers table
-- 1.Filtering travellers with Bali as destination
SELECT name, destination, budget_inr
FROM travellers
WHERE destination = 'Bali';

-- 2.Where condition with AND operator
SELECT name, city, budget_inr, destination
FROM travellers
WHERE city = 'Bengaluru' AND budget_inr > 90000;

-- 3. Where condition with OR operator
SELECT name, destination, budget_inr
FROM travellers
WHERE destination = 'Bali' OR destination = 'Maldives';

-- 4.Where with both And & OR operators
SELECT name, city, destination, budget_inr
FROM travellers
WHERE (destination = 'Bali' OR destination = 'Maldives')
  AND budget_inr > 85000;

-- Like for matching pattern
-- 1. fetching travellers whose name starts with A
SELECT name, email, destination
FROM travellers
WHERE name LIKE 'A%';

-- 2.fetching travellers details who has gmail as their email
SELECT name, email
FROM travellers
WHERE email LIKE '%@gmail.com';

-- Using Between to filter on range
-- Travellers aged between 25 and 30
SELECT name, age, city, destination
FROM travellers
WHERE age BETWEEN 25 AND 30;

-- Travellers whose budget is between 85000 to 120000 and are from bengaluru or mumbai and going to destination containing 'a' in its name
SELECT name, age, city, destination, budget_inr
FROM travellers
WHERE budget_inr BETWEEN 85000 AND 120000 
 AND city IN ('Bengaluru','Mumbai')
 AND destination Like '%a%';

-- Order By Clause
-- 1.Sorting travellers by budget (low to high)
SELECT name, destination, budget_inr
FROM travellers
ORDER BY budget_inr ASC;


-- 2.Sorting two columns first by name in ascending then by budget in descending order
SELECT name,destination,budget_inr
FROM travellers
ORDER BY name ASC,budget_inr DESC;

-- Limit for restricting results
-- Youngest four travellers
SELECT name,age,city,destination
FROM travellers
ORDER BY age ASC
LIMIT 4;

-- Top two travellers going to Bali with highest budget
SELECT name,city,destination,budget_inr 
FROM travellers
WHERE destination = 'Bali'
ORDER BY budget_inr DESC
LIMIT 2;