/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Tid]
      ,[Title01]
      ,[Title02]
      ,[Title03]
      ,[DataStatus]
  FROM [BigValues].[dbo].[Test]




  --不能防止sql注入
  alter procedure proc_test
  @v nvarchar(50)
  as
  
  begin

	   declare @str nvarchar(500)
	   set @str='select * from Test where DataStatus in ('+@v+')'
	   print @str
	   execute(@str)

  end

exec proc_test '1,2,4'



-- 表变量
alter procedure proc_test
  @str nvarchar(50)
  as
  begin
	
	declare @tab table(id int)

	while(@str<>'')
	 begin

	      declare @i int=charindex(',',@str)

		  --先判断字符串是否需要分割
		  if(@i=0)
			  begin
					 insert into @tab 
					 select @str
					 break
			  end

		  --第一个','之前的字符串
		  insert into @tab 
		  select substring(@str,1,@i-1)

		  --将第一个','后面的字符串重新赋给@ids
		  set @str=stuff(@str,1,@i,'')

	 end

    select * from Test where DataStatus in (select *from @tab)

  end

 exec proc_test '1'






  