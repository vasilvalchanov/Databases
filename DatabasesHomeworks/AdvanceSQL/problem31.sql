CREATE TABLE WorkHoursLogs
(Id int Identity,
EmployeeId int FOREIGN KEY REFERENCES Employees(EmployeeId),
[Date Old Value] DateTime,
[Date New Value] DateTime,
[Task Old Value] nvarchar(50),
[Task New Value] nvarchar(50),
[Hours Old Value] int,
[Hours New Value] int,
[Comment Old Value] nvarchar(max),
[Comment New Value] nvarchar(max),
Command nvarchar(50) NOT NULL,
CONSTRAINT PK_WorkHoursLogs PRIMARY KEY(Id))

GO

CREATE TRIGGER tr_WorkHoursUpdate ON WorkHours FOR UPDATE
AS
INSERT INTO WorkHoursLogs
SELECT d.EmployeeId, d.Date, i.Date, d.Task, i.Task, d.Hours, i.Hours, d.Comments, i.Comments, 'UPDATE'
FROM DELETED d, INSERTED i

GO

CREATE TRIGGER tr_WorkHoursInsert ON WorkHours FOR INSERT
AS
INSERT INTO WorkHoursLogs
SELECT i.EmployeeId, NULL, i.Date, NULL, i.Task, NULL, i.Hours, NULL, i.Comments, 'INSERT'
FROM INSERTED i

GO

CREATE TRIGGER tr_WorkHoursDelete ON WorkHours FOR DELETE
AS
INSERT INTO WorkHoursLogs
SELECT d.EmployeeId, d.Date, NULL, d.Task, NULL, d.Hours, NULL, d.Comments, NULL, 'DELETE'
FROM DELETED d

GO

INSERT INTO WorkHours
VALUES
(3, GETDATE(), 'VeryStupidTask', 3, 'Bla Bla Bla'),
(7, '12-12-12', 'Task13', 5, 'Drun Drun Drun'),
(22, GETDATE(), 'TaskForIdiots', 11, NULL)

UPDATE WorkHours
SET Task = 'Extremely Stupid Task'
WHERE Task = 'VeryStupidTask'

DELETE FROM WorkHours
WHERE Task = 'TaskForIdiots'

GO








