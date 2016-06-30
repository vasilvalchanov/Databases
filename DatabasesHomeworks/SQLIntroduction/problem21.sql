SELECT
	e.FirstName + ' ' + e.LastName AS Employee
	,a.AddressText AS EmployeeAddress
	,m.FirstName + ' ' + m.LastName AS Manager
	,am.AddressText AS ManagerAddress
FROM Employees e
JOIN Employees m
	ON e.ManagerId = m.EmployeeId
JOIN Addresses a
	ON e.AddressId = a.AddressId
	JOIN Addresses am
	ON m.AddressId = am.AddressId

