SELECT d.Name as Department, e.JobTitle, MIN(e.FirstName) as FirstName, MIN(e.Salary) as [Min Salary] FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY
d.Name, e.JobTitle
ORDER BY d.Name