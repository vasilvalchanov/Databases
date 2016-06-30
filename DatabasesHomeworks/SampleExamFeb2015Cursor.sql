USE Ads
GO

CREATE VIEW AllAds
AS
SELECT a.Id, a.Title, u.UserName as Author, a.Date, t.Name as Town, c.Name as Category, s.Status FROM Ads a
LEFT JOIN Towns t
ON a.TownId = t.Id
JOIN AdStatuses s
ON a.StatusId = s.Id
JOIN AspNetUsers u 
ON a.OwnerId = u.Id
LEFT JOIN Categories c
ON a.CategoryId = c.Id

GO

CREATE FUNCTION ufn_ListUsersAds() 
RETURNS @UsersDates TABLE(UserName nvarchar(50), AdDates nvarchar(max))
AS
BEGIN

DECLARE listUsersCursor CURSOR FOR
SELECT UserName FROM AspNetUsers ORDER BY UserName DESC

OPEN listUsersCursor
DECLARE @Author NVARCHAR(MAX)
FETCH NEXT FROM listUsersCursor INTO @Author

WHILE @@fetch_status = 0
BEGIN

DECLARE @Dates NVARCHAR(MAX) = NULL

SELECT @Dates =
CASE
WHEN @Dates IS NULL THEN FORMAT(Date, 'yyyyMMdd')
WHEN @Dates IS NOT NULL THEN @Dates + '; ' + FORMAT(Date, 'yyyyMMdd')
END
From AllAds WHERE @Author = Author
ORDER BY Date;

INSERT INTO @UsersDates
VALUES
(@Author, @Dates)

FETCH NEXT FROM listUsersCursor INTO @Author
END

CLOSE listUsersCursor
DEALLOCATE listUsersCursor
RETURN
END

GO

SELECT * FROM dbo.ufn_ListUsersAds()

