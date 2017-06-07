declare @str nvarchar(50)
declare @n int

set @str='123'
set @n=456

--select @n+','

--用cast进行类型转换
select cast(@n as nvarchar(50))+','

--convert进行类型转换
select convert(nvarchar(50),@n)+','