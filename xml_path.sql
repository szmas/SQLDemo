
--ƴ���ַ���
--���ݿ�������ö���ƴ������
--�ϲ���������
 select stuff(
 (select ','+convert(nvarchar,Id) from dt_Channel for xml path('')),
 1,1,'')
