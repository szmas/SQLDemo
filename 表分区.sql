/*======================水平分区======================*/


--第一步：建立我们要使用的数据库，最重要的是建立多个文件组。

CREATE DATABASE PartDemo ON PRIMARY 
(    
  NAME = N'PartDemo',    
  FILENAME = N'E:\db\Part\PartDemo.mdf',    
  SIZE = 5MB, 
  MAXSIZE = 100MB,    
  FILEGROWTH = 10%    
),    
FILEGROUP Part1    
(    
  NAME = N'Part1',    
  FILENAME = N'E:\db\Part\Part1.ndf',    
  SIZE = 5MB,    
  MAXSIZE = 100MB,    
  FILEGROWTH = 10%    
),    
FILEGROUP Part2    
(    
  NAME = N'Part2',    
  FILENAME = N'E:\db\Part\Part2.ndf',    
  SIZE = 5MB,    
  MAXSIZE = 100MB, 
  FILEGROWTH = 10%    
), 
FILEGROUP Part3    
(    
  NAME = N'Part3',    
  FILENAME = N'E:\db\Part\Part3.ndf',    
  SIZE = 5MB,    
  MAXSIZE = 100MB,    
  FILEGROWTH = 10%    
)    
LOG ON    
(    
  NAME = N'PartDemo_Log',    
  FILENAME = N'E:\db\Part\PartDemo_Log.ldf',    
  SIZE = 5MB,    
  MAXSIZE = 100MB,    
  FILEGROWTH = 10% 
) 
GO


--第二步：建立分区函数，这里我们建立三个分区。 how（如何对数据进行分区）

USE PartDemo    
GO 
CREATE PARTITION FUNCTION pf_OrderDate (datetime)    
AS RANGE RIGHT    
FOR VALUES ('2003/01/01', '2004/01/01') --n不能超过 999，创建的分区数等于 n + 1 
GO
 

 --第三步：创建分区方案，关联到分区函数 。 where（在哪里对数据进行分区）

USE PartDemo    
GO    
CREATE PARTITION SCHEME ps_OrderDate    
AS PARTITION pf_OrderDate    
TO (Part1, Part2, Part3)    
GO



--第四步：创建分区表。创建表并将其绑定到分区方案。这里我们建立2个表，表的结构一样。其中OrdersHistory表用于保存归档数据。

USE PartDemo    
GO    
CREATE TABLE dbo.Orders    
(    
  OrderID int identity(10000,1),    
  OrderDate datetime NOT NULL,    
  CustomerID int NOT NULL,    
  CONSTRAINT PK_Orders PRIMARY KEY (OrderID, OrderDate)    
)    
ON ps_OrderDate (OrderDate)--注意这里使用[ps_OrderDate]架构，根据OrderDate 分区  
GO   
 
CREATE TABLE dbo.OrdersHistory    
(    
  OrderID int identity(10000,1),    
  OrderDate datetime NOT NULL,    
  CustomerID int NOT NULL,    
  CONSTRAINT PK_OrdersHistory PRIMARY KEY (OrderID, OrderDate)    
)    
ON ps_OrderDate (OrderDate)    
GO


--向数据表中写入2002年的范例数据
USE PartDemo    
GO    
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2002/6/25', 1000)    
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2002/8/13', 1000)    
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2002/8/25', 1000)    
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2002/9/23', 1000) 
GO
 
--向数据表中写入2003年的范例数据
USE PartDemo    
GO 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2003/6/25', 1000) 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2003/8/13', 1000) 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2003/8/25', 1000) 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2003/9/23', 1000)    
GO

--向数据表中写入2004年的范例数据
USE PartDemo    
GO 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2004/6/25', 1000) 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2004/8/13', 1000) 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2004/8/25', 1000) 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2004/9/23', 1000)    
GO



SELECT * FROM dbo.Orders    
SELECT * FROM dbo.OrdersHistory


SELECT * 
FROM dbo.Orders 
WHERE $PARTITION.pf_OrderDate(OrderDate) = 1


SELECT * 
FROM dbo.Orders 
WHERE $PARTITION.pf_OrderDate(OrderDate) = 2


SELECT * 
FROM dbo.Orders 
WHERE $PARTITION.pf_OrderDate(OrderDate) = 3


SELECT $PARTITION.pf_OrderDate(OrderDate) AS Partition, 
COUNT(*) AS [COUNT]    
FROM dbo.Orders    
GROUP BY $PARTITION.pf_OrderDate(OrderDate)    
ORDER BY Partition ;