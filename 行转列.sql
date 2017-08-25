use tempdb
go

--1、行互列
--> --> (Roy)生成測試數據
  
if not object_id('Class') is null
    drop table Class
Go
Create table Class([Student] nvarchar(2),[Course] nvarchar(2),[Score] int)
Insert Class
select N'张三',N'语文',78 union all
select N'张三',N'数学',87 union all
select N'张三',N'英语',82 union all
select N'张三',N'物理',90 union all
select N'李四',N'语文',65 union all
select N'李四',N'数学',77 union all
select N'李四',N'英语',65 union all
select N'李四',N'物理',85 
Go

select * from Class


--生成格式:
/*
Student 数学          物理          英语          语文
------- ----------- ----------- ----------- -----------
李四      77          85          65          65
张三      87          90          82          78
 
(2 行受影响)
*/


--使用传统Select的CASE语句查询


select Student,
max(case Course when '数学' then Score else 0 end) as '数学',
max(case Course when '物理' then Score else 0 end) as '物理',
max(case Course when '英语' then Score else 0 end) as '英语',
max(case Course when '语文' then Score else 0 end) as '语文'
from Class
group by Student


--行转列的原理

select Student,
case Course when '数学' then Score end as '数学',
case Course when '物理' then Score else 0 end as '物理',
case Course when '英语' then Score else 0 end as '英语',
case Course when '语文' then Score else 0 end as '语文'
from Class




select * from Class
pivot (sum(Score) for Course in (数学,物理,英语,语文)) as tab



--原理

SELECT 数学,物理,英语,语文
--这里是PIVOT第三步（选择行转列后的结果集的列）这里可以用“*”表示选择所有列，也可以只选择某些列(也就是某些天)
FROM Class 
--这里是PIVOT第二步骤(准备原始的查询结果，因为PIVOT是对一个原始的查询结果集进行转换操作，
--所以先查询一个结果集出来)这里可以是一个select子查询，但为子查询时候要指定别名，否则语法错误
PIVOT
(
    max(Score) for Course in(数学,物理,英语,语文)
	--这里是PIVOT第一步骤，也是核心的地方，进行行转列操作。聚合函数SUM表示你需要怎样处理转换后的列的值，
	--是总和(sum)，还是平均(avg)还是min,max等等。
	--例如如果week_income表中有两条数据并且其week都是“星期一”，
	--其中一条的income是1000,另一条income是500，那么在这里使用sum，
	--行转列后“星期一”这个列的值当然是1500了。
	--后面的for [Course] in(数学,物理,英语,语文)中 for [Course]就是说将Course列的值分别转换成一个个列，
	--也就是“以值变列”。但是需要转换成列的值有可能有很多，我们只想取其中几个值转换成列，
	--那么怎样取呢？就是在in里面了，比如我此刻只想看工作日的收入，
	--在in里面就只写“星期一”至“星期五”（注意，in里面是原来week列的值,"以值变列"）。
	--总的来说，SUM(Score) for [Course] in(数学,物理,英语,语文)
	--这句的意思如果直译出来，就是说：将列[Course]值为数学,物理,英语,语文分别转换成列，
	--这些列的值取Score的总和。
)TBL--别名一定要写