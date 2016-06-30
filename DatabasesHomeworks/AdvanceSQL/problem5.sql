Select AVG(e.Salary) as AverageSalary, d.Name as Department FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name like 'Sales'
GROUP BY d.Name