
/*


SQL索引有两种，聚集索引和非聚集索引，索引主要目的是提高了SQL Server系统的性能，加快数据的查询速度与减少系统的响应时间 

下面举两个简单的例子：

图书馆的例子：一个图书馆那么多书，怎么管理呢？建立一个字母开头的目录，例如：a开头的书，在第一排，b开头的在第二排，这样在找什么书就好说了，这个就是一个聚集索引，可是很多人借书找某某作者的，不知道书名怎么办？图书管理员在写一个目录，某某作者的书分别在第几排，第几排，这就是一个非聚集索引

字典的例子：字典前面的目录，可以按照拼音和部首去查询，我们想查询一个字，只需要根据拼音或者部首去查询，就可以快速的定位到这个汉字了，这个就是索引的好处，拼音查询法就是聚集索引，部首查询就是一个非聚集索引.

看了上面的例子，下面的一句话大家就很容易理解了：聚集索引存储记录是物理上连续存在，而非聚集索引是逻辑上的连续，物理存储并不连续。就像字段，聚集索引是连续的，a后面肯定是b，非聚集索引就不连续了，就像图书馆的某个作者的书，有可能在第1个货架上和第10个货架上。还有一个小知识点就是：聚集索引一个表只能有一个，而非聚集索引一个表可以存在多个。









*/

  
  
CREATE TABLE [dbo].[BackupTest](
	[Tid] [int] IDENTITY(1,1) NOT NULL,
	[Title01] [nvarchar](100) NULL,
	[Title02] [nvarchar](100) NULL,
	[Title03] [nvarchar](100) NULL,
	[DataStatus] [tinyint] NULL
) ON [PRIMARY]

GO

  
  --39秒   创建聚集索引
  create unique clustered index index_1 on BackupTest(Tid)

    --6秒   创建聚集索引
  create  nonclustered  index index_2 on BackupTest(Title01)
  
  -- 效果一样,非聚集索引
  create  index index_3 on BackupTest(Tid)
  -- 唯一索引
  create unique index index_4 on BackupTest(Tid)

  -- 查看表的索引
  sp_helpIndex BackupTest 

  -- 0秒  删除索引
  drop index index_2 on BackupTest

 

DBCC DROPCLEANBUFFERS  --清除缓冲区
DBCC FREEPROCCACHE  --删除计划高速缓存中的元素
SET STATISTICS TIME ON --执行时间
SET STATISTICS IO ON --IO读取

  --Table Scan  全表扫描
  --Clustered Index San 聚集索引扫描 (有聚集索引)
  select top 1000 * from BackupTest

  --Index Seek  非聚集索引查找 (有非聚集索引:Title01)
  select top 1000 * from BackupTest
  where Title01='标题01'

  --Clustered Index Seek 聚集索引查找 (有聚集索引:TID)
  select top 1000 * from BackupTest
  where [Tid]=10000


  --Clustered Index San 聚集索引扫描
  select top 1000 * from BackupTest
  where Title02='标题01'


 --「索引查找 (index seek)」代表 SQL Server 以「垂直」的方式使用索引，会从 root 以高效率的「二分搜寻法」算法，来查找它要的记录；
 --「索引扫描 (index scan)」代表 SQL Server 以「水平」的方式使用索引，会逐条扫描整个索引的层级。