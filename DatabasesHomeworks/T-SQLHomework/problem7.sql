USE SoftUni

GO


CREATE FUNCTION ufn_DoesWordContainAllLetters(@word nvarchar(max), @letters nvarchar(max))
RETURNS BIT
AS
BEGIN

DECLARE @wordLenght int, @currentLetter nvarchar(1), @counter int

SET @wordLenght = LEN(@word)
SET @counter = 1

IF (@word IS NULL OR @wordLenght = 0)
BEGIN
	RETURN 0
END

WHILE(@counter <= @wordLenght)
BEGIN
	SET @currentLetter = SUBSTRING(@word, @counter, 1)
	IF(CHARINDEX(@currentLetter, @letters) = 0)
	BEGIN
		RETURN 0
	END

	SET @counter = @counter + 1
END

RETURN 1
END

GO

CREATE FUNCTION ufn_FindNamesAndTownsByGivenTokens(@Tokens nvarchar(50)) RETURNS TABLE
AS
RETURN(
SELECT FirstName + ' ' + MiddleName + ' ' + LastName as Name FROM Employees e 
WHERE 
(dbo.ufn_DoesWordContainAllLetters(e.FirstName, @Tokens) = 1 OR
dbo.ufn_DoesWordContainAllLetters(e.MiddleName, @Tokens) = 1 OR
dbo.ufn_DoesWordContainAllLetters(e.LastName, @Tokens) = 1)
UNION
SELECT Name FROM Towns t
WHERE dbo.ufn_DoesWordContainAllLetters(t.Name, @Tokens) = 1
)

GO

SELECT * FROM dbo.ufn_FindNamesAndTownsByGivenTokens('oistmiahf')


