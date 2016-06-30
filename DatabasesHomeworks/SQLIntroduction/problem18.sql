SELECT e.FirstName, e.LastName, e.AddressId, a.AddressText, t.Name as TownName From Employees e
JOIN Addresses a
ON e.AddressId = a.AddressId
JOIN Towns t
ON a.TownId = t.TownId