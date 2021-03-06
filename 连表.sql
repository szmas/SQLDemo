
create table productType
(
ID int identity(1,1) primary key,
Name nvarchar(50)
)

create table product
(
ID int identity(1,1) primary key,
Name nvarchar(50),
TID int references productType(ID) 
)



insert into productType
select '饮料' union all
select '水果' union all
select '蔬菜' union all
select '肉禽'


insert into product
select '可乐',1 union all
select '雪碧',1 union all
select '啤酒',1 union all
select '苹果',2 union all
select '梨子',2 union all
select '橘子',2 union all
select '菠菜',3



--在A，B表中存在至少一个匹配时，INNER JOIN 关键字返回行。
 --如果 "A" 中的行在 "B" 中没有匹配， 。

SELECT *
  FROM [ABC].[dbo].[Product] a
  inner join [ABC].[dbo].[Type] b
  on a.Type=b.ID


--即使右表中没有匹配，也从左表返回所有的行

SELECT *
  FROM [ABC].[dbo].[Product] a
  left outer join [ABC].[dbo].[Type] b
  on a.Type=b.ID


  --返回B表没有匹配的数据
  SELECT *
  FROM [ABC].[dbo].[Product] a
  left outer join [ABC].[dbo].[Type] b
  on a.Type=b.ID
  where b.ID is null




--即使左表中没有匹配，也从右表返回所有的行

SELECT *
  FROM [ABC].[dbo].[Product] a
  right outer join [ABC].[dbo].[Type] b
  on a.Type=b.ID


  --返回A表没有匹配的数据
SELECT *
  FROM [ABC].[dbo].[Product] a
  right outer join [ABC].[dbo].[Type] b
  on a.Type=b.ID
  where a.ID is null



--只要其中一个表中存在匹配，就返回行

  SELECT *
  FROM [ABC].[dbo].[Product] a
  full outer join [ABC].[dbo].[Type] b
  on a.Type=b.ID


-- 返回A的记录*B的记录

  SELECT *
  FROM [ABC].[dbo].[Product] a
   cross join [ABC].[dbo].[Type] b




