BEGIN TRAN

ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Departments
ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Addresses
ALTER TABLE Departments
DROP CONSTRAINT FK_Departments_Employees


DELETE FROM Employees
WHERE DepartmentID =
(SELECT DepartmentId  FROM Departments 
WHERE
Name = 'Sales')

ROLLBACK TRAN

