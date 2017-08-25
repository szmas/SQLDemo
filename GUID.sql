/*


UniqueIdentifier �����������ڴ洢GUID��ֵ��ռ��16Byte�� SQL Server��UniqueIdentifier�洢Ϊ16�ֽڵĶ�������ֵ��Binary(16)�������ض��ĸ�ʽ��ʾ����ʾ�ĸ�ʽ�ǣ�xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx�����У�x��16�������֣���ֵ��Χ�Ǵ�0-9��A-F������ÿ���ֽڴ洢2��16�������ݣ���ˣ����մ洢�ֽڣ�UniqueIdentifier�ĸ�ʽ��дΪ��4B-2B-2B-2B-6B��ʹ��GUID�ĺô��ǣ��ڲ�ͬ��Server�ϣ�ʵ��GUID��ֵ�ġ�Ψһ����SQL Server��֤GUID��ֵ����Ψһ�ģ�ֻ�ڼ���������¿��ܻ��ظ���

��SQL Server�У�UniqueIdentifier �е����ԣ�

ϵͳ�����Զ�ΪUniqueIdentifier�и�ֵ��������ʽ��ֵ��
ʹ��GUID�������� NewID()��ֵ�����������GUID��
NewSequentialID() ����ֻ�����ڱ��е�DefaultԼ���У�����˳���GUID��
ʹ���ַ���������ֵ���ַ��������ĸ�ʽ�ǣ�'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'��x��16�������֣���ֵ��Χ�Ǵ�0-9��A-F��
UniqueIdentifier ֵ�ܹ��Ƚϴ�С���ܹ�ʹ��is null �� is not null �������ж��Ƿ�ΪNULL��
�ܹ���RowGUIDCol���Ա�ǣ�ʹ��$ROWGUID ���þ���RowGUIDCol���Ե�UniqueIdentifier�У�




*/



--������ṹ
Create table GID(

ID int primary key identity(1,1),
GUID uniqueidentifier default newid() ROWGUIDCOL,--����
GUID2 uniqueidentifier default NewSequentialID() --����

)


--����

insert into GID(GUID)
select newid()

insert into GID values(default,default)



--��ѯ

select * from GID
where GUID='0B74B0E9-3484-492F-8F5F-7922978B637C'



--�޸�

update GID
set GUID='0B74B0E9-3484-492F-8F5F-7922978B637D'
where GUID='0B74B0E9-3484-492F-8F5F-7922978B637C'


--ɾ��

delete from GID
where GUID='0B74B0E9-3484-492F-8F5F-7922978B637C'


--ROWGUIDCOL �������ڱ��һ�������� UniqueIdentifier �У����һ�����б����ΪRowGUIDCol��
--��ô����ʹ�� $ROWGUID �����ø��� ��һ����ֻ����һ�о���RowGUIDCol����

select $ROWGUID from GID
