SELECT t.Name as Town, d.Name as Department, COUNT(*) as [Employees Count] FROM Employees e
JOIN Addresses a
ON e.AddressID = a.AddressID
JOIN Towns t
ON a.TownID = t.TownID
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY t.Name, d.Name
ORDER BY d.Name