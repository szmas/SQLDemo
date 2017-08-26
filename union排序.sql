--union all еепР

select Name from(
select Name ,'0'+Name n from product 
union
select Name,'1'+Name n from productType
) t
order by  n