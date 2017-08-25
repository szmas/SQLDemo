select * ,
(select count(*) from [dbo].[T_newscomment]
where newsId=id) ����,
(select count(*) from [dbo].[T_newshare]
where newsId=id) ����,
(select count(*) from [dbo].[T_newssupport]
where id=T_news.id) ����
from [dbo].[T_news]



select t.id,
count(distinct c.commentId),
count(distinct s.shareid),
count(distinct ss.id)
from [dbo].[T_news] t
left join [dbo].[T_newscomment] c on t.id=c.newsId
left join [dbo].[T_newshare] s on t.id=s.newsId
left join [dbo].[T_newssupport] ss on t.id=ss.newsId
group by t.id


DBCC DROPCLEANBUFFERS  --���������
DBCC FREEPROCCACHE  --ɾ���ƻ����ٻ����е�Ԫ��
DBCC FREESYSTEMCACHE ('ALL');