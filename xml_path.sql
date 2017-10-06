
--拼接字符串
--数据库的数据用逗号拼接起来
--合并分组内容
 select stuff(
 (select ','+convert(nvarchar,Id) from dt_Channel for xml path('')),
 1,1,'')
