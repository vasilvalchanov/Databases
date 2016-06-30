INSERT INTO WorkHours(EmployeeId, Date, Task, Hours, Comments)
VALUES
(5, GETDATE(), 'FirstTask', 2, NULL),
(11, GETDATE(), 'SecondTask', 9, 'Difficult Task'),
(1, '05-June-2016', 'ThirdTask', 3, NULL)

UPDATE WorkHours
SET Comments = 'Some stupid comment'
WHERE Task = 'FirstTask'

UPDATE WorkHours
SET Task = 'Updated Task Name'
WHERE Task = 'ThirdTask'

DELETE FROM WorkHours
WHERE Hours = 2