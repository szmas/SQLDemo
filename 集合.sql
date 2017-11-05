
/*


Union可以对两个或多个结果集进行连接，形成“并集”。
子结果集所有的记录组合在一起形成新的结果集。

*/


--并集


--去重
select Name from [ABC].[dbo].[Product]
union 
select Name from [ABC].[dbo].[Type]

--不去重
select Name from [ABC].[dbo].[Product]
union all
select Name from [ABC].[dbo].[Type]



/*

Except可以对两个或多个结果集进行连接，形成“差集”。
返回左边结果集合中已经有的记录，而右边结果集中没有的记录。


*/

--差集
select Name from [ABC].[dbo].[Product]
except 
select Name from [ABC].[dbo].[Type]





/*


InterSect可以对两个或多个结果集进行连接，形成“交集”。
返回左边结果集和右边结果集中都有的记录。


*/


--交集
select Name from [ABC].[dbo].[Product]
intersect
select Name from [ABC].[dbo].[Type]