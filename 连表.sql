
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



--返回两个表中具有匹配值的记录
select *from product p inner join productType t
on p.TID=t.ID


--从左表中返回所有记录，并从右表中返回匹配的记录
select *from product p left join productType t
on p.TID=t.ID


--从右表中返回所有记录，并从左表中返回匹配的记录
select *from product p right join productType t
on p.TID=t.ID


--当左或右表中有匹配时返回所有记录
select *from product p full join productType t
on p.TID=t.ID

-- 交叉连接   左表数据*右表数据  7*4=28
select *from product p cross join productType t



------------------------


select *from productType t inner join product p
on p.TID=t.ID



select *from productType t left join product p
on p.TID=t.ID



select *from productType t right join product p
on p.TID=t.ID

select *from productType t full join product p
on p.TID=t.ID



-- 交叉连接   左表数据*右表数据  7*4=28
select *from productType t cross join product p



