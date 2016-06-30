CREATE DATABASE TransactSQLHomework

GO

USE TransactSQLHomework

GO

CREATE TABLE Persons
(Id int IDENTITY PRIMARY KEY,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
SSN nvarchar(50) NULL)

CREATE TABLE Accounts
(Id int IDENTITY PRIMARY KEY,
PersonId int FOREIGN KEY REFERENCES Persons(Id),
Balance money NOT NULL)

GO

INSERT INTO Persons(FirstName, LastName, SSN)
VALUES
('Ivan', 'Ivanov', '123456789'),
('Todor', 'Todorov', NULL),
('Pena', 'Gagushka', '787878787'),
('Evlogi', 'Chonkov', NULL)

INSERT INTO Accounts
VALUES
(2, 550.99),
(3, 99.12),
(1, 10000),
(4, 240.50)

GO

CREATE PROC usp_SelectFullNamesOfPersons
AS
SELECT FirstName + ' ' + LastName as FullName FROM Persons

GO

EXEC usp_SelectFullNamesOfPersons

