--语法
/*
EXISTS运算符用于测试子查询中任何记录的存在。

如果子查询返回一个或多个记录，则EXISTS运算符返回true。


SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);


*/



select * from product
where exists 
(select 0)--有记录


select *from product
where exists
(select Name from product where ID>3) --有记录


select *from product
where exists 
(select ID from product where 1=2)--无记录


select *from product t
where exists 
(select ID from productType where t.id in(1,2,3,4,5))--关联记录



