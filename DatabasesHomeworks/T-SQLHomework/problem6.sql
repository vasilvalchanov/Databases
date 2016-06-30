USE TransactSQLHomework

GO

CREATE TABLE Logs
(Id int IDENTITY PRIMARY KEY,
AccountId int NOT NULL FOREIGN KEY REFERENCES Accounts(Id),
OldSum money NOT NULL,
NewSum money NOT NULL)

GO

CREATE TRIGGER tr_ChangedSumLogs ON Accounts FOR UPDATE
AS
INSERT INTO Logs
SELECT i.Id, d.Balance, i.Balance FROM INSERTED i, DELETED d

GO

EXEC usp_WithdrawMoney 4, 250
EXEC usp_DepositMoney 3, 250