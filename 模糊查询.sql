select *from dt_Article where title like '%½ì%'
select *from dt_Article where charindex('½ì',title)>0
select *from dt_Article where patindex('%½ì%',title)>0