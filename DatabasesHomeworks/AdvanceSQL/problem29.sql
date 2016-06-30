CREATE TABLE WorkHours(
Id int IDENTITY,
EmployeeId int NOT NULL,
[Date] DATE,
Task nvarchar(max) NULL,
Hours int NOT NULL,
Comments nvarchar(max) NULL,
CONSTRAINT PK_WorkHours PRIMARY KEY(Id),
CONSTRAINT FK_WorkHours_Employees FOREIGN KEY(EmployeeId) REFERENCES Employees)

