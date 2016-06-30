ALTER TABLE Users
DROP FK_Users_Groups

ALTER TABLE Users
ALTER COLUMN
GroupId int null

ALTER TABLE Users
DROP CONSTRAINT CK_Users_PasswordLenght

ALTER TABLE Users
DROP CONSTRAINT UK_Users_Username


INSERT INTO Users (FullName, Username, Password)
	SELECT
		FirstName + ' ' + LastName
		,LOWER(LEFT(FirstName, 1) + LastName)
		,LOWER(LEFT(FirstName, 1) + LastName)
	FROM Employees