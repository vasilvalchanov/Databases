SELECT t.Name as Town, COUNT(DISTINCT m.ManagerId) as [Number of Managers] FROM Employees m
JOIN Addresses a
ON m.AddressID = a.AddressID
JOIN Towns t
ON a.TownID = t.TownID
GROUP BY t.Name