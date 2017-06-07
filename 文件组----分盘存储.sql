--创建数据库
create database BigValues
on primary                    --数据库文件，主文件组
(
    name='BigValues_Data', --逻辑名
    size=10mb,                --初始大小
    filegrowth=10%,            --文件增长
    maxsize=1024mb,            --最大值
    filename=N'E:\db\BigValues_Data.mdf'--存放路径（包含文件后缀名）
),
(
    name='BigValues_Data1',
    size=10mb,
    filegrowth=10%,
    maxsize=1024mb,
    filename=N'E:\db\BigValues_Data1.mdf'
),
filegroup TestData --TestData文件组（表创建到不同的文件组里面可以分担压力）
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
log on --日记
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


exec sp_helpfilegroup --查看文件组



--在指定文件组中创建文件
create table Test
(
    Tid int primary key identity,
    Title01 nvarchar(100) default('标题01'),    
    Title02 nvarchar(100) default('标题02'),    
    Title03 nvarchar(100) default('标题03'),    
    DataStatus tinyint default(0) --0~255 size:1字节
) on TestData


--测试数据
declare @i int=0
while(@i<1000000)
begin
insert into Test(DataStatus) values (1),(2),(2)
set @i+=1
end

select * from Test