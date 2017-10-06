
--返回指定表或视图生成的最后一个标识值

select IDENT_CURRENT('[Users]')




--查看当前表的自增列的标识值，即使有错也不视图更正
DBCC CHECKIDENT ([Users],NORESEED)


--查看且如有必要更正当前标识值，如果小于当前的数据，则更正
DBCC CHECKIDENT ([Users],reseed)  
  

--重置自增列的标识值  
DBCC CHECKIDENT ([Users],reseed,1)




-- 设置允许显式插入自增列
SET IDENTITY_INSERT tablename  ON


-- 当然插入完毕记得要设置不允许显式插入自增列
SET IDENTITY_INSERT tablename  Off


--- 删除原表数据,并重置自增列
truncate table tablename  --truncate方式也可以重置自增字段