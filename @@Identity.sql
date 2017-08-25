--返回受上一语句影响的行数。如果行数大于 20 亿，请使用 ROWCOUNT_BIG。

  set ROWCOUNT 10
  select * from [Bill]
  where ParentItem='0'
  
  select @@ROWCOUNT



  --返回在当前会话中的任何表内所生成的最后一个标识值


  --所谓作用域(scope)是一个模块：存储过程、触发器、函数或批处理。
  --因此，如果两个语句处于同一个存储过程、函数或批处理中，则它们位于相同的作用域中


  --不受限作用域和会话
  select IDENT_CURRENT('Bill')



  --不受限于特定的作用域
  select @@IDENTITY
  

  --但是，SCOPE_IDENTITY 只返回插入到当前作用域中的值
  select SCOPE_IDENTITY() 


  /*
  
  
1. 如果插入语句未影响任何包含标识列的表，则 @@IDENTITY和SCOPE_IDENTITY都 返回 NULL。
2. 如果插入了多个行，生成了多个标识值，则 @@IDENTITY和SCOPE_IDENTITY将返回最后生成的标识值。
3. 如果是非插入语句，@@IDENTITY和SCOPE_IDENTITY值不变。
4. 如果语句插入表T1触发了一个或多个触发器（是AFTER触发器，4同。），该触发器又执行了生成标识值的插入操作，
那么，在语句执行后立即调用 @@IDENTITY 将返回触发器生成的最后一个标识值。
而SCOPE_IDENTITY（）却只返回T1表的插入后标识值，即使T1表是嵌套触发，也只返回直接插入T1后的标识值。
  



如果想获取跨任何会话或作用域的某个表的最新标识值，请使用IDENT_CURRENT，它像个“老母鸡”。

如果想获取当前会话和当前作用域的任何表的最新标识值，请使用SCOPE_IDENTITY，它像个“专项城管”。

如果想获取当前会话中任何作用域的任何表的最新标识值，请使用@@IDENTITY，它像个“万能城管”。


  */