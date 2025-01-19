

USE Internship_DB;

--TASK NUMBER 01: JOIN OPERATION

--Use INNER JOIN to list employees and their departments:

SELECT 
    E.EmployeeID, 
    CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName, 
    E.Position, 
    D.DepartmentName, 
    D.Location
FROM 
    Employees E
INNER JOIN 
    Departments D
ON 
    E.DepartmentID = D.DepartmentID;


-- Use LEFT JOIN to list all employees, including those without departments:

SELECT 
    E.EmployeeID, 
    CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName, 
    E.Position, 
    D.DepartmentName, 
    D.Location
FROM 
    Employees E
LEFT JOIN 
    Departments D
ON 
    E.DepartmentID = D.DepartmentID;


-- Adding more employees to calculate aggregate functions

INSERT INTO Employees (FirstName, LastName, Position, Salary, HireDate, DepartmentID) VALUES
-- Human Resources Department
('Sophia', 'Evans', 'HR Intern', 32000.00, '2023-06-15', 1),
('James', 'Harris', 'HR Specialist', 58000.00, '2023-07-10', 1),

-- Finance Department
('Benjamin', 'Clark', 'Junior Accountant', 52000.00, '2023-06-20', 2),

-- IT Department
('Emily', 'Garcia', 'Frontend Developer', 74000.00, '2023-08-05', 3),
('Daniel', 'Martinez', 'Backend Developer', 81000.00, '2023-09-01', 3),
('Sophia', 'Nguyen', 'Data Scientist', 92000.00, '2023-10-15', 3),

-- Marketing Department
('Lily', 'Hall', 'Graphic Designer', 56000.00, '2023-12-01', 4),
('Jackson', 'King', 'Content Strategist', 63000.00, '2024-01-20', 4),
('Charlotte', 'Perez', 'Digital Marketer', 54000.00, '2024-02-10', 4),

-- Sales Department
('Harper', 'Thompson', 'Regional Manager', 75000.00, '2023-11-15', 5),
('Ella', 'Walker', 'Sales Intern', 38000.00, '2023-12-25', 5),
('Mason', 'White', 'Account Executive', 61000.00, '2024-01-05', 5);

-- TASK NUMBER 02: AGGREGATE FUNCTIONS

--Calculate the average salary of employees:

SELECT 
    AVG(Salary) AS AverageSalary
FROM 
    Employees;


--Count the total employees per department:

SELECT 
    D.DepartmentName, 
    COUNT(E.EmployeeID) AS TotalEmployees
FROM 
    Departments D
LEFT JOIN 
    Employees E
ON 
    D.DepartmentID = E.DepartmentID
GROUP BY 
    D.DepartmentName;

-- Find the highest salary in each department:

SELECT 
    D.DepartmentName, 
    MAX(E.Salary) AS HighestSalary
FROM 
    Departments D
LEFT JOIN 
    Employees E
ON 
    D.DepartmentID = E.DepartmentID
GROUP BY 
    D.DepartmentName;


-- TASK NUMBER 03: SUBQUERIES

-- Find employees earning more than their department's average salary:

SELECT 
    E.EmployeeID, 
    CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName, 
    E.Salary, 
    D.DepartmentName
FROM 
    Employees E
INNER JOIN 
    Departments D
ON 
    E.DepartmentID = D.DepartmentID
WHERE 
    E.Salary > (
        SELECT 
            AVG(Salary)
        FROM 
            Employees AS SubE
        WHERE 
            SubE.DepartmentID = E.DepartmentID
    );


-- List departments with more than 3 employees:

SELECT 
    D.DepartmentID, 
    D.DepartmentName
FROM 
    Departments D
WHERE 
    D.DepartmentID IN (
        SELECT 
            E.DepartmentID
        FROM 
            Employees E
        GROUP BY 
            E.DepartmentID
        HAVING 
            COUNT(E.EmployeeID) > 3
    );




