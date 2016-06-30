SELECT e.FirstName, e.LastName, e.HireDate, e.DepartmentId, d.Name as DepartmentName FROM Employees e
JOIN Departments d
ON (e.DepartmentId = d.DepartmentID
AND d.Name IN('Sales', 'Finance') AND e.HireDate BETWEEN '01-JAN-1995' AND '31-DEC-2005')

SELECT e.FirstName, e.LastName, e.HireDate, e.DepartmentId, d.Name as DepartmentName FROM Employees e
JOIN Departments d
ON e.DepartmentId = d.DepartmentID
WHERE d.Name IN('Sales', 'Finance') AND e.HireDate BETWEEN '01-JAN-1995' AND '31-DEC-2005'
ORDER BY HireDate



