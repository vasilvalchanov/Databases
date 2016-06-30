SELECT e.FirstName, e.LastName, e.AddressId, a.AddressText, t.Name as TownName From Employees e, Addresses a, Towns t
WHERE e.AddressId = a.AddressId AND a.TownId = t.TownId

