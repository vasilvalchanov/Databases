SELECT m.FirstName, m.LastName, COUNT(*) as EmployeesCount from Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID
GROUP BY m.FirstName, m.LastName
HAVING COUNT(*) = 5