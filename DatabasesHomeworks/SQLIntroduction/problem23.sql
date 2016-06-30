SELECT e.FirstName, e.LastName, m.FirstName + ' ' + m.LastName as Manager FROM Employees e
RIGHT OUTER JOIN Employees m
ON e.ManagerId = m.EmployeeId

SELECT e.FirstName, e.LastName, m.FirstName + ' ' + m.LastName as Manager FROM Employees e
LEFT OUTER JOIN Employees m
ON e.ManagerId = m.EmployeeId