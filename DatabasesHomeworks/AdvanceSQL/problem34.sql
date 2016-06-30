BEGIN TRAN

CREATE TABLE #TempTable
(EmployeeId int NOT NULL,
ProjectId int NOT NULL)

INSERT INTO #TempTable
SELECT  * FROM EmployeesProjects

DROP TABLE EmployeesProjects

CREATE TABLE EmployeesProjects
(EmployeeId int NOT NULL,
ProjectId int NOT NULL)

INSERT INTO EmployeesProjects
SELECT * FROM #TempTable

DROP TABLE #TempTable

ROLLBACK TRAN