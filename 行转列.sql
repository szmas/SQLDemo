use tempdb
go

--1���л���
--> --> (Roy)���ɜyԇ����
  
if not object_id('Class') is null
    drop table Class
Go
Create table Class([Student] nvarchar(2),[Course] nvarchar(2),[Score] int)
Insert Class
select N'����',N'����',78 union all
select N'����',N'��ѧ',87 union all
select N'����',N'Ӣ��',82 union all
select N'����',N'����',90 union all
select N'����',N'����',65 union all
select N'����',N'��ѧ',77 union all
select N'����',N'Ӣ��',65 union all
select N'����',N'����',85 
Go

select * from Class


--���ɸ�ʽ:
/*
Student ��ѧ          ����          Ӣ��          ����
------- ----------- ----------- ----------- -----------
����      77          85          65          65
����      87          90          82          78
 
(2 ����Ӱ��)
*/


--ʹ�ô�ͳSelect��CASE����ѯ


select Student,
max(case Course when '��ѧ' then Score else 0 end) as '��ѧ',
max(case Course when '����' then Score else 0 end) as '����',
max(case Course when 'Ӣ��' then Score else 0 end) as 'Ӣ��',
max(case Course when '����' then Score else 0 end) as '����'
from Class
group by Student


--��ת�е�ԭ��

select Student,
case Course when '��ѧ' then Score end as '��ѧ',
case Course when '����' then Score else 0 end as '����',
case Course when 'Ӣ��' then Score else 0 end as 'Ӣ��',
case Course when '����' then Score else 0 end as '����'
from Class




select * from Class
pivot (sum(Score) for Course in (��ѧ,����,Ӣ��,����)) as tab



--ԭ��

SELECT ��ѧ,����,Ӣ��,����
--������PIVOT��������ѡ����ת�к�Ľ�������У���������á�*����ʾѡ�������У�Ҳ����ֻѡ��ĳЩ��(Ҳ����ĳЩ��)
FROM Class 
--������PIVOT�ڶ�����(׼��ԭʼ�Ĳ�ѯ�������ΪPIVOT�Ƕ�һ��ԭʼ�Ĳ�ѯ���������ת��������
--�����Ȳ�ѯһ�����������)���������һ��select�Ӳ�ѯ����Ϊ�Ӳ�ѯʱ��Ҫָ�������������﷨����
PIVOT
(
    max(Score) for Course in(��ѧ,����,Ӣ��,����)
	--������PIVOT��һ���裬Ҳ�Ǻ��ĵĵط���������ת�в������ۺϺ���SUM��ʾ����Ҫ��������ת������е�ֵ��
	--���ܺ�(sum)������ƽ��(avg)����min,max�ȵȡ�
	--�������week_income�������������ݲ�����week���ǡ�����һ����
	--����һ����income��1000,��һ��income��500����ô������ʹ��sum��
	--��ת�к�����һ������е�ֵ��Ȼ��1500�ˡ�
	--�����for [Course] in(��ѧ,����,Ӣ��,����)�� for [Course]����˵��Course�е�ֵ�ֱ�ת����һ�����У�
	--Ҳ���ǡ���ֵ���С���������Ҫת�����е�ֵ�п����кܶ࣬����ֻ��ȡ���м���ֵת�����У�
	--��ô����ȡ�أ�������in�����ˣ������Ҵ˿�ֻ�뿴�����յ����룬
	--��in�����ֻд������һ�����������塱��ע�⣬in������ԭ��week�е�ֵ,"��ֵ����"����
	--�ܵ���˵��SUM(Score) for [Course] in(��ѧ,����,Ӣ��,����)
	--������˼���ֱ�����������˵������[Course]ֵΪ��ѧ,����,Ӣ��,���ķֱ�ת�����У�
	--��Щ�е�ֵȡScore���ܺ͡�
)TBL--����һ��Ҫд