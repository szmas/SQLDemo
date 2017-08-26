create table _product
(
ID int identity(1,1) primary key,--主键
Name nvarchar(50) unique,
TID int foreign key references productType(ID) --外键
)

create table __product
(
ID int identity(1,1) ,--自增列
Name nvarchar(50) default('Mas'),--默认值
TID int,
primary key(ID),--主键
constraint FK_ProductType foreign key (TID)
references productType(ID),--外键

CONSTRAINT CHK_Name CHECK (Name<>'Mas')--默认检查
)




--主键

ALTER TABLE __product
ADD primary KEY (ID)



ALTER TABLE __product
ADD CONSTRAINT PK_product
primary KEY (ID)





--外键

ALTER TABLE __product
ADD FOREIGN KEY (TID) REFERENCES productType(ID);



ALTER TABLE __product
ADD CONSTRAINT FK_ProductType
FOREIGN KEY (TID) REFERENCES productType(ID);





--唯一  允许包含NULL值，

ALTER TABLE __product
ADD unique(Name)



ALTER TABLE __product
ADD CONSTRAINT UQ_product
unique (Name)






--check检查

ALTER TABLE __product
Add check (Name<>'Mas')



ALTER TABLE __product
ADD CONSTRAINT CK_Name CHECK (Name<>'Mas');





--默认值

ALTER TABLE __product
Add Default 'Mas' for Name



Alter table __product
add constraint DF_product
default 'Mas' for Name





-- not null

ALTER TABLE __product
alter column Age int not null






--删除约束
ALTER TABLE __product
DROP CONSTRAINT FK_ProductType;




--添加字段

ALTER TABLE __product
ADD Age int


--修改字段
ALTER TABLE __product
alter column Age int 



--删除字段
ALTER TABLE __product
drop column Age