/*ʹ��CTE�ݹ�ѭ������ ����CTE�ݹ���룬�ٶȽϿ�*/  
with Seq(N,Name, Reamrk, IsDel, Money, AddTime, Height)
as
(
select 1,'mas','remark',0,10.02,getdate(),11.2
union all
select n+1,Name,Reamrk,IsDel,Money,AddTime,Height from seq
where N<5000000
/*CTE�����ݹ�500�������� ��ʱһ����3���� ����˵��Զ���*/
)
insert into InsertTab
select Name,Reamrk,IsDel,Money,AddTime,Height from Seq option(MAXRECURSION 0)