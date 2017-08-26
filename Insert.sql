

-- 默认列
insert into BackupTest values
('mas134','remark134','remark',1)


--指定列
insert into BackupTest(Title01, Title02, Title03, DataStatus) values
('mas134','remark134','remark',1)



--批量
insert into BackupTest(Title01, Title02, Title03, DataStatus) values
('mas134','remark134','remark',1),('mas134','remark134','remark',1),
('mas134','remark134','remark',1),('mas134','remark134','remark',1)


--select
insert into BackupTest
select 'mas134','remark134','remark',1
union all
select 'mas134','remark134','remark',1


---
insert into BackupTest
select * from BackupTest



--SELECT INTO语句将数据从一个表复制到一个新表中
-- 表数据,没有主键和约束
select * into back from BackupTest


--只有表结构
select * into back from BackupTest where 1=0




   