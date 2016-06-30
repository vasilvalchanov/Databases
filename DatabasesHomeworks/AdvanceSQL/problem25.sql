SELECT d.Name as Department, e.JobTitle, AVG(e.Salary) as [Average Salary] FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY
d.Name, e.JobTitle