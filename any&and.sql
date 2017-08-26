--any 匹配任何一条  or的区别

select *
from product
where TID = ANY (select ID from productType where ID in (1,2));-- TID与任意返回的数据   与 in 等效



--All 匹配所有  and的区别

select *
from product
where TID = all (select ID from productType where ID in(1,2)); --TID与所有返回的数据相等



--其中Some和Any等价

select *    
from product
where TID = some (select ID from productType where ID in(1,2)); --TID与所有返回的数据相等