
/*


select select_list
[ into new_table ]
from table_source
[ where search_condition ]
[ group by broup_by_expression ]
[ having search_condition ]
[order by order_by_expression [ asc | desc ] 


select_list:查询的列或者表达式的列表，用逗号进行分隔。
new_table:新的表名。
table_source:要查询的表。如果是多个表，用逗号进行分隔。
search_condition:查询条件。
group_by_expression:分组表达式。
order_by_expression:排序表达式。
asc:升序排序。
desc：降序排序。



*/



--distinct  去除重复数据：

--distinct是对当前查询的所有列作用，也就是说，所有列都相同才算重复数据。

--distinct *对表所有列去重
--distinct name 对name列去重

select  distinct Name from [ABC].[dbo].[Product]





--into查询

--into子句将查询结果生成新表，新表的结构由查询字段列表组成。
--也可以将查询的结果送入tempdb数据库的临时表中，这样关闭服务器之后临时表会自动删除。

/*

SELECT <字段名列表>
　　[ into 新的数据表名 ]
　　FROM　数据库表名
　　[ where <条件表达式> ]

*/

select * into #product from [ABC].[dbo].[Product] 