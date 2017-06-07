/*使用CTE递归循环插入 运用CTE递归插入，速度较快*/  
with Seq(N,Name, Reamrk, IsDel, Money, AddTime, Height)
as
(
select 1,'mas','remark',0,10.02,getdate(),11.2
union all
select n+1,Name,Reamrk,IsDel,Money,AddTime,Height from seq
where N<5000000
/*CTE批量递归500万数据量 用时一般大概3分钟 因个人电脑而已*/
)
insert into InsertTab
select Name,Reamrk,IsDel,Money,AddTime,Height from Seq option(MAXRECURSION 0)