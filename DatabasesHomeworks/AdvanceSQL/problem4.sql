SELECT AVG(e.Salary) as AverageSalary, e.DepartmentID, d.Name as Department FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID = 1
GROUP BY d.Name, e.DepartmentID
