--完整备份
Backup DATABASE BigValues
To disk='D:\GPOSDB_backup_201207160152.bak'

--还原
restore database 数据库 from disk='D:\GPOSDB_backup_201207160152.bak' WITH replace