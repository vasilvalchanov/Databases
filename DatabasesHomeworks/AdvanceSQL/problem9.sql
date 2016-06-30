SELECT d.Name as Department, AVG(e.Salary) as [Average Salary]  FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name
