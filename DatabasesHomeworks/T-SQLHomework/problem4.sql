USE TransactSQLHomework

GO

CREATE PROC usp_CalculatePersonMonthlyInterest(@AccountId int, @InterestRate float)
AS
DECLARE @CurrentBalance money
SET @CurrentBalance = (SELECT Balance FROM Accounts WHERE Id = @AccountId);
DECLARE @NewBalance money
SET @NewBalance = (SELECT dbo.ufn_CalculateInterest(@CurrentBalance, @InterestRate, 1))

UPDATE Accounts
SET Balance = @NewBalance

GO

SELECT * FROM Accounts WHERE Id = 2
EXEC usp_CalculatePersonMonthlyInterest 2, 10
SELECT * FROM Accounts WHERE Id = 2