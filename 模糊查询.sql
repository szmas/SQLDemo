select *from dt_Article where title like '%��%'
select *from dt_Article where charindex('��',title)>0
select *from dt_Article where patindex('%��%',title)>0