CREATE DATABASE SQLPerformanceHomework
ALTER DATABASE SQLPerformanceHomework
MODIFY FILE
(Name = N'SQLPerformanceHomework', Size = 1GB, MAXSIZE = UNLIMITED, FILEGROWTH = 1000MB)
GO

USE SQLPerformanceHomework

GO

CREATE TABLE Records
(Id int IDENTITY PRIMARY KEY,
[Text] text NOT NULL,
Date DATETIME NOT NULL)

GO

SET NOCOUNT ON
DECLARE @Counter int = 0
DECLARE @Record nvarchar(50)
DECLARE @DateOfRecord DATETIME = GETDATE()


WHILE(@Counter <= 10000000)
BEGIN
	SET @Record = 'Record ' + CAST(@Counter + 1 as nvarchar(50)) 
	
	INSERT INTO Records
	VALUES(@Record, @DateOfRecord)

	SET @DateOfRecord = DATEADD(MINUTE, 1, @DateOfRecord)

	SET @Counter = @Counter + 1
END
SET NOCOUNT OFF

GO

SELECT * FROM Records
WHERE Date BETWEEN '2017-01-01' AND '2018-12-31'

GO

CREATE INDEX IDX_Records_Date ON Records(Date)

GO

DBCC FREEPROCCACHE
DBCC DROPCLEANBUFFERS

GO

