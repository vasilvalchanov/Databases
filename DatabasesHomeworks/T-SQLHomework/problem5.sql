USE TransactSQLHomework

GO

CREATE PROC usp_WithdrawMoney (@AccountId int, @Money money)
AS
BEGIN TRAN
	DECLARE @CurrentBallance money
	SET @CurrentBallance = (SELECT Balance FROM Accounts WHERE Id = @AccountId)

	IF (@Money > @CurrentBallance)
	BEGIN
		ROLLBACK TRAN
	END
	ELSE
	BEGIN

		DECLARE @BalanceAfterWithdrawing money
		SET @BalanceAfterWithdrawing = @CurrentBallance - @Money

		UPDATE Accounts
		SET Balance = @BalanceAfterWithdrawing
		WHERE Id = @AccountId

	COMMIT TRAN
	END

GO

CREATE PROC usp_DepositMoney(@AccountId int, @Money money)
AS
BEGIN TRAN
	DECLARE @CurrentBalance money
	SET @CurrentBalance = (SELECT Balance FROM Accounts WHERE Id = @AccountId)
	DECLARE @BalanceAfterDepositing MONEY
	SET @BalanceAfterDepositing = @CurrentBalance + @Money

	UPDATE Accounts
	SET Balance = @BalanceAfterDepositing
	WHERE Id = @AccountId

COMMIT TRAN

GO

EXEC usp_DepositMoney 3, 50
SELECT * FROM Accounts
EXEC usp_WithdrawMoney 3, 30
SELECT * FROM Accounts
EXEC usp_WithdrawMoney 2, 120
SELECT * FROM Accounts
