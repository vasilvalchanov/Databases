ALTER TABLE Users
ALTER COLUMN
Password nvarchar(20) NULL

UPDATE Users
SET Password = NULL
WHERE CAST([Last Login Time] as DATE) < '10-March-2010'