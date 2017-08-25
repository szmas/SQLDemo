  --not in/top

  select top 10 * from Products
  where ProductID not in
  (
  select top 20 ProductID from Products
  order by ProductID asc
  )
  order by ProductID asc


  -- max/top

  select top 10 *from Products
  where ProductID>
  (
   select max(ProductID) from 
   (
    select top 20 ProductID from Products
	order by ProductID asc
   ) tb
  )
  order by ProductID asc


  -- row_number() over()


  select * from
  (
  select *,row_number() over(order by ProductID asc) num from Products
  ) tb
  where num between 21 and 30
  --where num>20 and num<=30


  select top 10 *from
  (
  select *,row_number() over(order by ProductID asc) num from Products
  ) tb
  where num>20




  -- not exists
  select top 10 *from Products
  where not exists
  (
  select 1 from
  (
  select top 20 ProductID from Products order by ProductID 
  ) tb
  where tb.ProductID=Products.ProductID
  )
  order by ProductID