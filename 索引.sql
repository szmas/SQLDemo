
/*


SQL���������֣��ۼ������ͷǾۼ�������������ҪĿ���������SQL Serverϵͳ�����ܣ��ӿ����ݵĲ�ѯ�ٶ������ϵͳ����Ӧʱ�� 

����������򵥵����ӣ�

ͼ��ݵ����ӣ�һ��ͼ�����ô���飬��ô�����أ�����һ����ĸ��ͷ��Ŀ¼�����磺a��ͷ���飬�ڵ�һ�ţ�b��ͷ���ڵڶ��ţ���������ʲô��ͺ�˵�ˣ��������һ���ۼ����������Ǻܶ��˽�����ĳĳ���ߵģ���֪��������ô�죿ͼ�����Ա��дһ��Ŀ¼��ĳĳ���ߵ���ֱ��ڵڼ��ţ��ڼ��ţ������һ���Ǿۼ�����

�ֵ�����ӣ��ֵ�ǰ���Ŀ¼�����԰���ƴ���Ͳ���ȥ��ѯ���������ѯһ���֣�ֻ��Ҫ����ƴ�����߲���ȥ��ѯ���Ϳ��Կ��ٵĶ�λ����������ˣ�������������ĺô���ƴ����ѯ�����Ǿۼ����������ײ�ѯ����һ���Ǿۼ�����.

������������ӣ������һ�仰��Ҿͺ���������ˣ��ۼ������洢��¼���������������ڣ����Ǿۼ��������߼��ϵ�����������洢���������������ֶΣ��ۼ������������ģ�a����϶���b���Ǿۼ������Ͳ������ˣ�����ͼ��ݵ�ĳ�����ߵ��飬�п����ڵ�1�������Ϻ͵�10�������ϡ�����һ��С֪ʶ����ǣ��ۼ�����һ����ֻ����һ�������Ǿۼ�����һ������Դ��ڶ����









*/

  
  
CREATE TABLE [dbo].[BackupTest](
	[Tid] [int] IDENTITY(1,1) NOT NULL,
	[Title01] [nvarchar](100) NULL,
	[Title02] [nvarchar](100) NULL,
	[Title03] [nvarchar](100) NULL,
	[DataStatus] [tinyint] NULL
) ON [PRIMARY]

GO

  
  --39��   �����ۼ�����
  create unique clustered index index_1 on BackupTest(Tid)

    --6��   �����ۼ�����
  create  nonclustered  index index_2 on BackupTest(Title01)
  
  -- Ч��һ��,�Ǿۼ�����
  create  index index_3 on BackupTest(Tid)
  -- Ψһ����
  create unique index index_4 on BackupTest(Tid)

  -- �鿴�������
  sp_helpIndex BackupTest 

  -- 0��  ɾ������
  drop index index_2 on BackupTest

 

DBCC DROPCLEANBUFFERS  --���������
DBCC FREEPROCCACHE  --ɾ���ƻ����ٻ����е�Ԫ��
SET STATISTICS TIME ON --ִ��ʱ��
SET STATISTICS IO ON --IO��ȡ

  --Table Scan  ȫ��ɨ��
  --Clustered Index San �ۼ�����ɨ�� (�оۼ�����)
  select top 1000 * from BackupTest

  --Index Seek  �Ǿۼ��������� (�зǾۼ�����:Title01)
  select top 1000 * from BackupTest
  where Title01='����01'

  --Clustered Index Seek �ۼ��������� (�оۼ�����:TID)
  select top 1000 * from BackupTest
  where [Tid]=10000


  --Clustered Index San �ۼ�����ɨ��
  select top 1000 * from BackupTest
  where Title02='����01'


 --���������� (index seek)������ SQL Server �ԡ���ֱ���ķ�ʽʹ����������� root �Ը�Ч�ʵġ�������Ѱ�����㷨����������Ҫ�ļ�¼��
 --������ɨ�� (index scan)������ SQL Server �ԡ�ˮƽ���ķ�ʽʹ��������������ɨ�����������Ĳ㼶��