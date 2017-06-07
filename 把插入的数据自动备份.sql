/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Tid]
      ,[Title01]
      ,[Title02]
      ,[Title03]
      ,[DataStatus]
  FROM [BigValues].[dbo].[Test]



--只复制表结构
select * into BackupTest from Test where 1=2



/*

逆天最近在弄一个本地和服务器自动同步的东西，每天都会添加很多新数据，本地和服务器同样的ShopMenu表，
我总不能每次都把服务器的清掉然后再把本地的导入进去吧~

*/
if exists(select * from sysobjects where name='tr_Test')
　　drop trigger tr_Test
go

create trigger tr_Test
on Test after insert
as
　　insert into BackupTest select * from inserted
go


--测试插入
insert into Test(DataStatus) values (5)




