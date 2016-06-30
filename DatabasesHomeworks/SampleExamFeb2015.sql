USE Ads
GO

SELECT Title FROM Ads
ORDER BY Title

GO

SELECT Title, Date FROM Ads
WHERE Date BETWEEN '26-Dec-2014' AND '02-Jan-2015'
ORDER BY Date

GO

SELECT Title, Date, 
CASE
WHEN ImageDataURL IS NULL THEN 'no'
ELSE 'yes' 
END
as [Has Image] FROM Ads
ORDER BY Id

GO

SELECT * FROM Ads
WHERE (TownId IS NULL OR CategoryId IS NULL OR ImageDataURL IS NULL)

GO

SELECT a.Title, t.Name as Town FROM Ads a
LEFT JOIN Towns t
ON
a.TownId = t.Id
ORDER BY a.Id

GO

SELECT a.Title, c.Name as CategoryName, t.Name as TownName, s.Status FROM Ads a
LEFT JOIN Towns t
ON a.TownId = t.Id
LEFT JOIN Categories c
ON a.CategoryId = c.Id
LEFT JOIN AdStatuses s
ON a.StatusId = s.Id
ORDER BY a.Id

GO

SELECT a.Title, c.Name as CategoryName, t.Name as TownName, s.Status FROM Ads a
LEFT JOIN Towns t
ON a.TownId = t.Id
LEFT JOIN Categories c
ON a.CategoryId = c.Id
LEFT JOIN AdStatuses s
ON a.StatusId = s.Id
WHERE s.Status = 'Published' AND t.Name IN('Sofia', 'Blagoevgrad', 'Stara Zagora')
ORDER BY a.Title

GO

SELECT MIN(Date) as MinDate, MAX(Date) as MaxDate FROM Ads

GO

SELECT top 10 a.Title, a.Date, s.Status FROM Ads a
JOIN AdStatuses s
ON a.StatusId = s.Id
ORDER BY a.Date DESC

GO

DECLARE @FirstAdDate Date =  (SELECT MIN(DATE) FROM Ads)

SELECT a.Id, a.Title, a.Date, s.Status FROM Ads a
JOIN AdStatuses s
ON a.StatusId = s.Id
WHERE YEAR(a.Date) = YEAR(@FirstAdDate) AND MONTH(a.Date) = MONTH(@FirstAdDate)
AND s.Status <> 'Published'
ORDER BY a.Id

GO

SELECT s.Status, COUNT(a.Id) as Count FROM AdStatuses s
JOIN Ads a
ON s.Id = a.StatusId
GROUP BY s.Status
ORDER By s.Status

GO

SELECT t.Name as [Town Name], s.Status, COUNT(a.Id) as Count FROM Towns t
JOIN Ads a
ON t.Id = a.TownId
JOIN AdStatuses s
ON a.StatusId = s.Id
GROUP BY t.Name, s.Status
ORDER BY t.Name, s.Status

GO

DECLARE @Admins TABLE(UserName nvarchar(max))

INSERT INTO @Admins 
SELECT u.UserName FROM AspNetUsers u
JOIN AspNetUserRoles ur
ON u.Id = ur.UserId
JOIN AspNetRoles r
ON ur.RoleId = r.Id
WHERE r.Name = 'Administrator'

SELECT u.UserName, Count(a.Id) as AdsCount,
CASE
WHEN adm.UserName IS NULL THEN 'no'
ELSE 'yes'
END
as IsAdministrator
 FROM AspNetUsers u
LEFT JOIN Ads a
ON u.Id = a.OwnerId
LEFT JOIN @Admins adm 
ON u.UserName = adm.UserName
GROUP BY u.UserName, adm.UserName
ORDER BY u.UserName

GO

SELECT COUNT(a.Id) as AdsCount, 
ISNULL(t.Name, '(no town)')as Town FROM Ads a
LEFT JOIN Towns t
ON a.TownId = t.Id
GROUP BY t.Name
HAVING COUNT(a.Id) BETWEEN 2 AND 3
ORDER BY t.Name

GO

SELECT a1.Date as FirstDate, a2.Date as SecondDate FROM Ads a1, Ads a2
WHERE a1.Date < a2.Date AND
DATEDIFF(HOUR, a1.Date, a2.Date) < 12
ORDER BY a1.Date, a2.Date

GO

CREATE TABLE Countries
(Id int IDENTITY PRIMARY KEY,
Name nvarchar(max) NOT NULL)

GO

ALTER TABLE Towns
ADD CountryId int

ALTER TABLE Towns
ADD CONSTRAINT FK_Towns_Countries FOREIGN KEY(CountryId) REFERENCES Countries(Id)

GO

INSERT INTO Countries(Name) VALUES ('Bulgaria'), ('Germany'), ('France')
UPDATE Towns SET CountryId = (SELECT Id FROM Countries WHERE Name='Bulgaria')
INSERT INTO Towns VALUES
('Munich', (SELECT Id FROM Countries WHERE Name='Germany')),
('Frankfurt', (SELECT Id FROM Countries WHERE Name='Germany')),
('Berlin', (SELECT Id FROM Countries WHERE Name='Germany')),
('Hamburg', (SELECT Id FROM Countries WHERE Name='Germany')),
('Paris', (SELECT Id FROM Countries WHERE Name='France')),
('Lyon', (SELECT Id FROM Countries WHERE Name='France')),
('Nantes', (SELECT Id FROM Countries WHERE Name='France'))

GO

UPDATE Ads
SET TownId =
(SELECT Id FROM Towns
WHERE Name = 'Paris')
WHERE DATENAME(WEEKDAY, Date) = 'Friday'

GO

UPDATE Ads
SET TownId =
(SELECT Id FROM Towns
WHERE Name = 'Hamburg')
WHERE DATENAME(WEEKDAY, Date) = 'Thursday'

GO

BEGIN TRAN

DELETE FROM Ads
WHERE OwnerId IN
(SELECT u.Id FROM AspNetUsers u
JOIN AspNetUserRoles ur
ON u.Id = ur.UserId
JOIN AspNetRoles r
ON ur.RoleId = r.Id
WHERE r.Name = 'Partner')
COMMIT TRAN

GO

DECLARE @Owner varchar(max) = 
(SELECT Id FROM AspNetUsers
WHERE UserName = 'nakov')

DECLARE @Status int =
(SELECT Id FROM AdStatuses
WHERE Status = 'Waiting Approval')

INSERT INTO Ads(Title, Text, Date, OwnerId, StatusId)
VALUES
('Free Book', 'Free C# Book', GETDATE(), @Owner, @Status )

GO

SELECT t.Name as Town, c.Name as Country, COUNT(a.Id) as AdsCount FROM Ads a
FULL JOIN Towns t
ON a.TownId = t.Id
FULL JOIN Countries c
ON t.CountryId = c.Id
GROUP BY t.Name, c.Name
ORDER BY t.Name, c.Name



