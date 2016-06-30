USE TransactSQLHomework

GO

CREATE PROC usp_SelectPersonsWithMoreMoneyThan(@Money money)
AS
SELECT p.FirstName, p.LastName, a.Balance FROM Persons p
JOIN Accounts a
ON p.Id = a.PersonId
WHERE a.Balance > @money

GO

EXEC usp_SelectPersonsWithMoreMoneyThan 2.5

GO
