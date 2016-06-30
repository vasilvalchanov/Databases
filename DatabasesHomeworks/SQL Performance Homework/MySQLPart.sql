CREATE DATABASE PartitioningDB;

USE PartitioningDB;

CREATE TABLE Records
(Id int NOT NULL Auto_Increment,
`Date` datetime NOT NULL,
`Text` varchar(300) NOT NULL,
PRIMARY KEY(Id, `Date`))


DELIMITER $$
 
 CREATE PROCEDURE fill_data()
 BEGIN
 start transaction;
 
 SET @Date = '1980-01-01';
 SET @Counter = 0;
 
 WHILE @Counter < 1000000 DO
 INSERT INTO Records(`Date`, `Text`)
 VALUES (@Date, CONCAT('Record ', @Counter + 1));
 
 SET @Counter = @Counter + 1;
 SET @Date = @Date + INTERVAL 20 MINUTE;
 END WHILE;
 commit;
 END;
 
 DELIMITER ;
 
 CALL fill_data;
 
 SELECT * FROM Records
 WHERE Date BETWEEN '1990-01-01' AND '1998-01-01';
 
 DROP TABLE Records;
 
 CREATE TABLE Records
(Id int NOT NULL Auto_Increment,
`Date` datetime NOT NULL,
`Text` varchar(300) NOT NULL,
PRIMARY KEY(Id, `Date`))
PARTITION BY RANGE (Year(`Date`)) (
PARTITION p0 VALUES LESS THAN (1990),
PARTITION p2 VALUES LESS THAN (2000),
PARTITION p3 VALUES LESS THAN (2010),
PARTITION p4 VALUES LESS THAN MAXVALUE
);

 CALL fill_data;
 
  SELECT * FROM Records
 WHERE Date BETWEEN '1990-01-01' AND '1998-01-01';
 

 

 




