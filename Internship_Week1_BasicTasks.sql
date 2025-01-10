
-- TASK NUMBER 01

-- Create the database
CREATE DATABASE Internship_DB;


--Use the database
USE Internship_DB;


--Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100)
);


--Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Position NVARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    HireDate DATE NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);


--Insert records into Departments table
INSERT INTO Departments (DepartmentName, Location) VALUES
('HR', 'New York'),
('Finance Department', 'San Francisco'),
('IT Department', 'Austin'),
('Marketing Department', 'Seattle'),
('Sales Department', 'Chicago');


--Insert records into Employees table
INSERT INTO Employees (FirstName, LastName, Position, Salary, HireDate, DepartmentID) VALUES
('Ali', 'Khan', 'HR Manager', 60000.00, '2023-01-15', 1),
('Sara', 'Bilal', 'Financial Analyst', 75000.00, '2023-02-20', 2),
('Aqsa', 'Jabbar', 'Software Developer', 80000.00, '2023-03-10', 3),
('Saad', 'Afzal', 'Marketing Specialist', 50000.00, '2023-04-25', 4),
('Fahad', 'Sikander', 'Sales Associate', 45000.00, '2023-05-30', 5);

SELECT * FROM Employees
SELECT * FROM Departments


--  TASK NUMBER 02

-- Retrieve employees' names and positions
SELECT FirstName, LastName, Position 
FROM Employees;


-- List departments with locations
SELECT DepartmentName, Location 
FROM Departments;


--  TASK NUMBER 03

-- Query employees earning > $50,000
SELECT FirstName, LastName, Position, Salary
FROM Employees
WHERE Salary > 50000;


-- Sort employees by name
SELECT FirstName, LastName, Position
FROM Employees
ORDER BY FirstName, LastName;


-- List departments in specific cities (e.g., 'San Francisco' and 'Austin')
SELECT DepartmentName, Location
FROM Departments
WHERE Location IN ('Chicago', 'Seattle');



