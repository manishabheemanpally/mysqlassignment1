1. SQL Query to fetch records that are present in one table but not in another table:

SELECT * FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary)
   OR EmpId NOT IN (SELECT EmpId FROM EmployeeDetails WHERE ManagerId IS NOT NULL);


2. SQL query to fetch all the employees who are not working on any project:

SELECT * FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary);


3. SQL query to fetch all the employees from EmployeeDetails who joined in the Year 2020:

SELECT * FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;


4. Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary:

SELECT ed.*
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


5. Write an SQL query to fetch a project-wise count of employees:

SELECT Project, COUNT(EmpId) AS EmployeeCount
FROM EmployeeSalary
GROUP BY Project;


6. Fetch employee names and salaries even if the salary value is not present for the employee:

SELECT ed.FullName, COALESCE(es.Salary, 0) AS Salary
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


7. Write an SQL query to fetch all the Employees who are also managers:

SELECT ed.*
FROM EmployeeDetails ed
WHERE ed.EmpId IN (SELECT DISTINCT ManagerId FROM EmployeeDetails WHERE ManagerId IS NOT NULL);


8. Write an SQL query to fetch duplicate records from EmployeeDetails:

SELECT EmpId, FullName, COUNT(*)
FROM EmployeeDetails
GROUP BY EmpId, FullName
HAVING COUNT(*) > 1;


9. Write an SQL query to fetch only odd rows from the table:


SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY EmpId) AS RowNum
    FROM EmployeeDetails
) AS EmployeeWithRowNum
WHERE RowNum % 2 <> 0;


10. Write a query to find the 3rd highest salary from a table without top or limit keyword:

SELECT DISTINCT Salary
FROM EmployeeSalary es1
WHERE 3 = (
    SELECT COUNT(DISTINCT Salary)
    FROM EmployeeSalary es2
    WHERE es1.Salary <= es2.Salary
);
