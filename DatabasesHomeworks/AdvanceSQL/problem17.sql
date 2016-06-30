CREATE TABLE Groups(
Id int IDENTITY,
Name nvarchar(50) not null,
CONSTRAINT PK_Groups PRIMARY KEY(Id),
CONSTRAINT UK_GroupsName UNIQUE(Name))