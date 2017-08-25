select * ,
(select count(*) from [dbo].[T_newscomment]
where newsId=id) 评论,
(select count(*) from [dbo].[T_newshare]
where newsId=id) 分享,
(select count(*) from [dbo].[T_newssupport]
where id=T_news.id) 点赞
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


DBCC DROPCLEANBUFFERS  --清除缓冲区
DBCC FREEPROCCACHE  --删除计划高速缓存中的元素
DBCC FREESYSTEMCACHE ('ALL');