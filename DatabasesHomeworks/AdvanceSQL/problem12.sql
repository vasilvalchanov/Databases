SELECT e.FirstName + ' ' + e.LastName as Employee, ISNULL(m.FirstName + ' ' + m.LastName, '(no manager)') as Manager FROM Employees e
LEFT OUTER JOIN Employees m
ON e.ManagerID = m.EmployeeID
