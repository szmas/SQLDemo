

-- Ĭ����
insert into BackupTest values
('mas134','remark134','remark',1)


--ָ����
insert into BackupTest(Title01, Title02, Title03, DataStatus) values
('mas134','remark134','remark',1)



--����
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



--SELECT INTO��佫���ݴ�һ�����Ƶ�һ���±���
-- ������,û��������Լ��
select * into back from BackupTest


--ֻ�б�ṹ
select * into back from BackupTest where 1=0




   