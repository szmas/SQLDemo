--完整备份
Backup DATABASE BigValues
To disk='D:\GPOSDB_backup_201207160152.bak'



--差异备份
Backup database BigValues 
to disk = 'D:\GPOSDB_backup_201207160152.bak' with differential


--事务日志备份
Backup log BigValues to disk = 'D:\GPOSDB_backup_201207160152.bak'


--还原  replace:覆盖现有的数据库
restore database BigValues from disk='D:\GPOSDB_backup_201207160152.bak' WITH replace


RESTORE DATABASE BigValues FROM DISK = 'D:\GPOSDB_backup_201207160152.bak' WITH 
MOVE 'BigValues' TO 'E:\db\BigValues.mdf', MOVE 'BigValues_Log' TO 'E:\db\BigValues_Log.ldf'