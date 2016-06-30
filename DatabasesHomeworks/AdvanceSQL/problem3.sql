SELECT e.FirstName + ' ' + e.LastName as FullName, e.Salary, d.Name as DepartmentName FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary =
(SELECT MIN(Salary) FROM Employees
WHERE e.DepartmentID = DepartmentID)

