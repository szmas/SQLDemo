--�﷨
/*
EXISTS��������ڲ����Ӳ�ѯ���κμ�¼�Ĵ��ڡ�

����Ӳ�ѯ����һ��������¼����EXISTS���������true��


SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);


*/



select * from product
where exists 
(select 0)--�м�¼


select *from product
where exists
(select Name from product where ID>3) --�м�¼


select *from product
where exists 
(select ID from product where 1=2)--�޼�¼


select *from product t
where exists 
(select ID from productType where t.id in(1,2,3,4,5))--������¼



