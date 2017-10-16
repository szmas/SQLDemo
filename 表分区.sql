/*======================ˮƽ����======================*/


--��һ������������Ҫʹ�õ����ݿ⣬����Ҫ���ǽ�������ļ��顣

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


--�ڶ��������������������������ǽ������������� how����ζ����ݽ��з�����

USE PartDemo    
GO 
CREATE PARTITION FUNCTION pf_OrderDate (datetime)    
AS RANGE RIGHT    
FOR VALUES ('2003/01/01', '2004/01/01') --n���ܳ��� 999�������ķ��������� n + 1 
GO
 

 --������������������������������������ �� where������������ݽ��з�����

USE PartDemo    
GO    
CREATE PARTITION SCHEME ps_OrderDate    
AS PARTITION pf_OrderDate    
TO (Part1, Part2, Part3)    
GO



--���Ĳ�����������������������󶨵������������������ǽ���2������Ľṹһ��������OrdersHistory�����ڱ���鵵���ݡ�

USE PartDemo    
GO    
CREATE TABLE dbo.Orders    
(    
  OrderID int identity(10000,1),    
  OrderDate datetime NOT NULL,    
  CustomerID int NOT NULL,    
  CONSTRAINT PK_Orders PRIMARY KEY (OrderID, OrderDate)    
)    
ON ps_OrderDate (OrderDate)--ע������ʹ��[ps_OrderDate]�ܹ�������OrderDate ����  
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


--�����ݱ���д��2002��ķ�������
USE PartDemo    
GO    
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2002/6/25', 1000)    
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2002/8/13', 1000)    
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2002/8/25', 1000)    
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2002/9/23', 1000) 
GO
 
--�����ݱ���д��2003��ķ�������
USE PartDemo    
GO 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2003/6/25', 1000) 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2003/8/13', 1000) 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2003/8/25', 1000) 
INSERT INTO dbo.Orders (OrderDate, CustomerID) VALUES ('2003/9/23', 1000)    
GO

--�����ݱ���д��2004��ķ�������
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