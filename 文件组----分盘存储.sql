--�������ݿ�
create database BigValues
on primary                    --���ݿ��ļ������ļ���
(
    name='BigValues_Data', --�߼���
    size=10mb,                --��ʼ��С
    filegrowth=10%,            --�ļ�����
    maxsize=1024mb,            --���ֵ
    filename=N'E:\db\BigValues_Data.mdf'--���·���������ļ���׺����
),
(
    name='BigValues_Data1',
    size=10mb,
    filegrowth=10%,
    maxsize=1024mb,
    filename=N'E:\db\BigValues_Data1.mdf'
),
filegroup TestData --TestData�ļ��飨��������ͬ���ļ���������Էֵ�ѹ����
(
    name='BigValues_Data_Num1',
    size=10mb,
    filegrowth=10%,
    maxsize=1024mb,
    filename=N'E:\db\BigValues_Data_Num1.ndf'
),
(
    name='BigValues_Data_Num2',
    size=10mb,
    filegrowth=10%,
    maxsize=1024mb,
    filename=N'E:\db\BigValues_Data_Num2.ndf'
)
log on --�ռ�
(
    name='BigValues_Log1',
    size=5mb,
    filegrowth=5%,
    filename=N'E:\db\BigValues_log1.ldf'
),
(
    name='BigValues_Log2',
    size=5mb,
    filegrowth=5%,
    filename=N'E:\db\BigValues_log2.ldf'
)
go


exec sp_helpfilegroup --�鿴�ļ���



--��ָ���ļ����д����ļ�
create table Test
(
    Tid int primary key identity,
    Title01 nvarchar(100) default('����01'),    
    Title02 nvarchar(100) default('����02'),    
    Title03 nvarchar(100) default('����03'),    
    DataStatus tinyint default(0) --0~255 size:1�ֽ�
) on TestData


--��������
declare @i int=0
while(@i<1000000)
begin
insert into Test(DataStatus) values (1),(2),(2)
set @i+=1
end

select * from Test