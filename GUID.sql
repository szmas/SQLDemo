/*


UniqueIdentifier 数据类型用于存储GUID的值，占用16Byte。 SQL Server将UniqueIdentifier存储为16字节的二进制数值，Binary(16)，按照特定的格式显示，显示的格式是：xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx，其中，x是16进制数字，数值范围是从0-9，A-F。由于每个字节存储2个16进制数据，因此，按照存储字节，UniqueIdentifier的格式简写为：4B-2B-2B-2B-6B。使用GUID的好处是：在不同的Server上，实现GUID数值的“唯一”，SQL Server保证GUID的值总是唯一的，只在极少数情况下可能会重复。

在SQL Server中，UniqueIdentifier 列的特性：

系统不会自动为UniqueIdentifier列赋值，必须显式赋值；
使用GUID产生函数 NewID()赋值，产生随机的GUID；
NewSequentialID() 函数只能用于表列的Default约束中，产生顺序的GUID；
使用字符串常量赋值，字符串常量的格式是：'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'，x是16进制数字，数值范围是从0-9，A-F；
UniqueIdentifier 值能够比较大小，能够使用is null 或 is not null 操作符判断是否为NULL；
能够被RowGUIDCol属性标记，使用$ROWGUID 引用具有RowGUIDCol属性的UniqueIdentifier列；




*/



--创建表结构
Create table GID(

ID int primary key identity(1,1),
GUID uniqueidentifier default newid() ROWGUIDCOL,--无序
GUID2 uniqueidentifier default NewSequentialID() --有序

)


--新增

insert into GID(GUID)
select newid()

insert into GID values(default,default)



--查询

select * from GID
where GUID='0B74B0E9-3484-492F-8F5F-7922978B637C'



--修改

update GID
set GUID='0B74B0E9-3484-492F-8F5F-7922978B637D'
where GUID='0B74B0E9-3484-492F-8F5F-7922978B637C'


--删除

delete from GID
where GUID='0B74B0E9-3484-492F-8F5F-7922978B637C'


--ROWGUIDCOL 属性用于标记一个表列是 UniqueIdentifier 列，如果一个表列被标记为RowGUIDCol，
--那么可以使用 $ROWGUID 来引用该列 ，一个表只能有一列具有RowGUIDCol属性

select $ROWGUID from GID
