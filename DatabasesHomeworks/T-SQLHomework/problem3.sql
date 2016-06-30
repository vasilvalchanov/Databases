USE TransactSQLHomework

GO

CREATE FUNCTION ufn_CalculateInterest(@Sum money, @yearlyInterestRate float, @Months int) RETURNS money
AS
BEGIN
DECLARE @CalculatedSum money
SET @CalculatedSum = @Sum * POWER((1 + @yearlyInterestRate / 12 / 100 ), @Months);
RETURN @CalculatedSum
END

GO

SELECT dbo.ufn_CalculateInterest(1000, 4.5, 12)