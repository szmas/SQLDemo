
/*


select select_list
[ into new_table ]
from table_source
[ where search_condition ]
[ group by broup_by_expression ]
[ having search_condition ]
[order by order_by_expression [ asc | desc ] 


select_list:��ѯ���л��߱��ʽ���б��ö��Ž��зָ���
new_table:�µı�����
table_source:Ҫ��ѯ�ı�����Ƕ�����ö��Ž��зָ���
search_condition:��ѯ������
group_by_expression:������ʽ��
order_by_expression:������ʽ��
asc:��������
desc����������



*/



--distinct  ȥ���ظ����ݣ�

--distinct�ǶԵ�ǰ��ѯ�����������ã�Ҳ����˵�������ж���ͬ�����ظ����ݡ�

--distinct *�Ա�������ȥ��
--distinct name ��name��ȥ��

select  distinct Name from [ABC].[dbo].[Product]





--into��ѯ

--into�Ӿ佫��ѯ��������±��±�Ľṹ�ɲ�ѯ�ֶ��б���ɡ�
--Ҳ���Խ���ѯ�Ľ������tempdb���ݿ����ʱ���У������رշ�����֮����ʱ����Զ�ɾ����

/*

SELECT <�ֶ����б�>
����[ into �µ����ݱ��� ]
����FROM�����ݿ����
����[ where <�������ʽ> ]

*/

select * into #product from [ABC].[dbo].[Product] 