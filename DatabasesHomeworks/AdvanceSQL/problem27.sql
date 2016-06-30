SELECT top 1 t.Name, COUNT(*) as [Number of Employees] FROM Employees e
JOIN Addresses a
ON
e.AddressID = a.AddressID
JOIN Towns t
ON a.TownID = t.TownID
GROUP BY t.Name
ORDER BY COUNT(*) DESC