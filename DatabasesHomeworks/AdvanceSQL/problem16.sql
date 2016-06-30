CREATE VIEW TodaysUsers as
SELECT * FROM Users
WHERE CAST(GETDATE() as DATE) = CAST([Last Login Time] as DATE)

-- Another way to do this
CREATE VIEW TodaysUsers as
SELECT * FROM Users
WHERE CONVERT(DATE, GETDATE()) = CONVERT(DATE, [Last Login Time])