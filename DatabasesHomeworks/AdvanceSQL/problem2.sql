SELECT FirstName, LastName, Salary  from Employees
WHERE Salary <
(SELECT MIN(Salary) FROM Employees) * 1.1
