/*

锁的类型：

RID = 表中单个行的锁，由行标识符 (RID) 标识。
KEY = 索引内保护可串行事务中一系列键的锁。
PAG = 数据页或索引页的锁。
EXT = 对某区的锁。
TAB = 整个表（包括所有数据和索引）的锁。
DB = 数据库的锁。
FIL = 数据库文件的锁。
APP = 指定的应用程序资源的锁。
MD = 元数据或目录信息的锁。
HBT = 堆或 B 树索引的锁。在 SQL Server 中此信息不完整。
AU = 分配单元的锁。在 SQL Server 中此信息不完整。


资源类型：

Type 值：Resource 值
RID：格式为 fileid:pagenumber:rid 的标识符，其中 fileid 标识包含页的文件，pagenumber 标识包含行的页，rid 标识页上的特定行。fileid 与 sys.database_files 目录视图中的 file_id 列相匹配。
KEY：数据库引擎内部使用的十六进制数。
PAG：格式为 fileid:pagenumber 的数字，其中 fileid 标识包含页的文件，pagenumber 标识页。
EXT：标识区中的第一页的数字。该数字的格式为 fileid:pagenumber。
TAB：没有提供信息，因为已在 ObjId 列中标识了表。
DB：没有提供信息，因为已在 dbid 列中标识了数据库。
FIL：文件的标识符，与 sys.database_files 目录视图中的 file_id 列相匹配。
APP：被锁定的应用程序资源的唯一标识符。格式为 DbPrincipleId:<资源字符串的前 2 个到 16 个字符><哈希运算值>。
MD：随资源类型而变化。有关详细信息，请参阅 sys.dm_tran_locks (Transact-SQL) 中 resource_description 列的说明。
HBT：没有提供任何信息。请改用 sys.dm_tran_locks 动态管理视图。
AU：没有提供任何信息。请改用 sys.dm_tran_locks 动态管理视图。


锁模式：

NULL = 不授予对资源的访问权限。用作占位符。
Sch-S = 架构稳定性。确保在任何会话持有对架构元素（例如表或索引）的架构稳定性锁时，不删除该架构元素。
Sch-M = 架构修改。必须由要更改指定资源架构的任何会话持有。确保没有其他会话正在引用所指示的对象。
S = 共享。授予持有锁的会话对资源的共享访问权限。
U = 更新。指示对最终可能更新的资源获取的更新锁。用于防止一种常见的死锁，这种死锁在多个会话锁定资源以便稍后对资源进行更新时发生。
X = 排他。授予持有锁的会话对资源的独占访问权限。
IS = 意向共享。指示有意将 S 锁放置在锁层次结构中的某个从属资源上。
IU = 意向更新。指示有意将 U 锁放置在锁层次结构中的某个从属资源上。
IX = 意向排他。指示有意将 X 锁放置在锁层次结构中的某个从属资源上。
SIU = 共享意向更新。指示对有意在锁层次结构中的从属资源上获取更新锁的资源进行共享访问。
SIX = 共享意向排他。指示对有意在锁层次结构中的从属资源上获取排他锁的资源进行共享访问。
UIX = 更新意向排他。指示对有意在锁层次结构中的从属资源上获取排他锁的资源持有的更新锁。
BU = 大容量更新。用于大容量操作。
RangeS_S = 共享键范围和共享资源锁。指示可串行范围扫描。
RangeS_U = 共享键范围和更新资源锁。指示可串行更新扫描。
RangeI_N = 插入键范围和 Null 资源锁。用于在将新键插入索引前测试范围。
RangeI_S = 键范围转换锁。由 RangeI_N 和 S 锁的重叠创建。
RangeI_U = 由 RangeI_N 和 U 锁的重叠创建的键范围转换锁。
RangeI_X = 由 RangeI_N 和 X 锁的重叠创建的键范围转换锁。
RangeX_S = 由 RangeI_N 和 RangeS_S 锁的重叠创建的键范围转换锁。
RangeX_U = 由 RangeI_N 和 RangeS_U 锁的重叠创建的键范围转换锁。
RangeX_X = 排他键范围和排他资源锁。这是在更新范围中的键时使用的转换锁。

*/

--查询锁的信息
exec sp_lock




--用户连接数
exec sp_who
--查询数据库
select * from [master].[dbo].sysdatabases where dbid=19
--查询表
select * from sysobjects where id=1639728944

--
DBCC INPUTBUFFER(52) 

--动态管理视图
select * from sys.dm_tran_locks

select * from sys.syslockinfo

--执行结果默认为 -1，意即欲访问的对象或记录被锁定时，会无限期等待。
--若欲更改当前会话的此值，可用下列命令：
--SET LOCK_TIMEOUT 3000
SELECT @@LOCK_TIMEOUT

exec sp_lock
--查看发生阻塞的进程
SELECT blocking_session_id '堵塞ID', wait_duration_ms '堵塞时间', session_id '被堵塞ID' FROM sys.dm_os_waiting_tasks


--杀掉进程
KILL 51


--NOLOCK  不加锁  等同于 READUNCOMMITTED
--此选项被选中时，SQL Server 在读取或修改数据时不加任何锁。 
--在这种情况下，用户有可能读取到未完成事务（Uncommited Transaction）或回滚(Roll Back)中的数据, 
--即所谓的“脏数据”。

SELECT * FROM [物料资料] WITH (NOLOCK)






--HOLDLOCK  共享锁  等同于 SERIALIZABLE
--锁定数据库的一个表   其他事务可以读取表，但不能更新删除
--SQL Server 会将此共享锁保持至整个事务结束，而不会在途中释放。

SELECT * FROM [物料资料] WITH (HOLDLOCK)


--ROWLOCK
--指定通常采用页锁或表锁时，采用行锁。在从 SNAPSHOT 隔离级别操作的事务中指定时，
--除非将 ROWLOCK 与需要锁的其他表提示（例如，UPDLOCK 和 HOLDLOCK）组合，否则不会取得行锁。
SELECT * FROM [物料资料] WITH (ROWLOCK,HOLDLOCK)




--PAGLOCK
--在通常行或键采用单个锁的地方，或者通常采用单个表锁的地方，请采用页锁。
--默认情况下，请使用与操作相对应的锁模式。
--在从 SNAPSHOT 隔离级别操作的事务中指定时，除非将 PAGLOCK 与需要锁的其他表提示
--（例如，UPDLOCK 和 HOLDLOCK）组合，否则不会取得页锁。
SELECT * FROM [物料资料] WITH (PAGLOCK)



--TABLOCK
--指定在表级别应用获取的锁。获取的锁类型取决于正在执行的语句。
--例如，SELECT 语句可能获取一个共享锁。
--通过指定 TABLOCK，将该共享锁应用到整个表而非在行或页级别应用。
--如果同时指定了 HOLDLOCK，则会一直持有表锁，直至事务结束。

SELECT * FROM [物料资料] WITH (TABLOCK)





--TABLOCKX  指定对表采用排他锁。
-- 强制使用独占表级锁，这个锁在事务期间阻止任何其他事务使用这个表 
select * FROM [物料资料] WITH (TABLOCKX)



--UPDLOCK
--指定采用更新锁并持有到事务完成。UPDLOCK 仅对行级别或页级别的读操作采用更新锁。
--如果将 UPDLOCK 与 TABLOCK 组合使用或出于一些其他原因采用表级锁，将采用排他 (X) 锁。

select * FROM [物料资料] WITH (UPDLOCK)



--XLOCK  排他锁
--指定采用排他锁并持有到事务完成。如果同时指定了 ROWLOCK, PAGLOCK 或 TABLOCK，
--则排他锁将应用于相应的粒度级别。

select *from [物料资料] WITH (XLOCK)




--NOWAIT
--指示数据库引擎在遇到表的锁时，立即返回一条消息。
--NOWAIT 等同于将特定表的 SET LOCK_TIMEOUT 值指定为 0。
select * FROM [物料资料] WITH (NOWAIT)



