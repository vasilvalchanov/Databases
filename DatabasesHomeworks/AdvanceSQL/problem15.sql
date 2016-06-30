CREATE TABLE Users(
Id int IDENTITY,
Username nvarchar(50) not null,
Password nvarchar(20) not null,
FullName nvarchar(max) not null,
[Last Login Time] datetime not null,
Constraint PK_Users Primary Key(Id),
Constraint UK_Users_Username UNIQUE(Username),
Constraint CK_Users_PasswordLenght CHECK(Len(Password) >= 5))
GO
