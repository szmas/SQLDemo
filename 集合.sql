
/*


Union���Զ���������������������ӣ��γɡ���������
�ӽ�������еļ�¼�����һ���γ��µĽ������

*/


--����


--ȥ��
select Name from [ABC].[dbo].[Product]
union 
select Name from [ABC].[dbo].[Type]

--��ȥ��
select Name from [ABC].[dbo].[Product]
union all
select Name from [ABC].[dbo].[Type]



/*

Except���Զ���������������������ӣ��γɡ������
������߽���������Ѿ��еļ�¼�����ұ߽������û�еļ�¼��


*/

--�
select Name from [ABC].[dbo].[Product]
except 
select Name from [ABC].[dbo].[Type]





/*


InterSect���Զ���������������������ӣ��γɡ���������
������߽�������ұ߽�����ж��еļ�¼��


*/


--����
select Name from [ABC].[dbo].[Product]
intersect
select Name from [ABC].[dbo].[Type]