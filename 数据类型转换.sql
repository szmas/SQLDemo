declare @str nvarchar(50)
declare @n int

set @str='123'
set @n=456

--select @n+','

--��cast��������ת��
select cast(@n as nvarchar(50))+','

--convert��������ת��
select convert(nvarchar(50),@n)+','