use Internship_DB



-- Task Number 01: Complex JOINs
-- Complex JOIN: List Employees with Department and Manager Details

SELECT 
    E.EmployeeID,
    E.FirstName + ' ' + E.LastName AS EmployeeName,
    E.Position AS EmployeePosition,
    D.DepartmentName,
    D.Location,
    M.FirstName + ' ' + M.LastName AS ManagerName,
    M.Position AS ManagerPosition
FROM 
    Employees E
JOIN 
    Departments D ON E.DepartmentID = D.DepartmentID
LEFT JOIN 
    Employees M ON E.DepartmentID = M.DepartmentID AND M.Position LIKE '%Manager%'
WHERE 
    E.Position NOT LIKE '%Manager%'; -- Exclude managers from being listed as employees


-- Task Number 02: Window Functions
-- Rank Employees by Salary within Departments

SELECT 
    E.EmployeeID,
    E.FirstName + ' ' + E.LastName AS EmployeeName,
    D.DepartmentName,
    E.Salary,
    ROW_NUMBER() OVER (PARTITION BY E.DepartmentID ORDER BY E.Salary DESC) AS RankWithinDepartment
FROM 
    Employees E
JOIN 
    Departments D ON E.DepartmentID = D.DepartmentID;


-- Rank Employees by Salary Across the Company
SELECT 
    E.EmployeeID,
    E.FirstName + ' ' + E.LastName AS EmployeeName,
    E.Salary,
    RANK() OVER (ORDER BY E.Salary DESC) AS CompanyWideRank
FROM 
    Employees E;


--Task Number 03: Data Modification & Transactions

-- Update Employee Salaries by 10%
UPDATE Employees
SET Salary = Salary * 1.10;

SELECT 
    EmployeeID,
    FirstName + ' ' + LastName AS EmployeeName,
    Position,
    Salary AS UpdatedSalary,
    HireDate,
    DepartmentID
FROM 
    Employees;


-- Use transactions to commit or roll back updates

-- Begin Transaction
BEGIN TRANSACTION;

-- Update Employee Salaries by 10%
UPDATE Employees
SET Salary = Salary * 1.10;

SELECT 
    EmployeeID,
    FirstName + ' ' + LastName AS EmployeeName,
    Position,
    Salary AS UpdatedSalary,
    HireDate,
    DepartmentID
FROM 
    Employees;






