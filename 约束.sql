create table _product
(
ID int identity(1,1) primary key,--����
Name nvarchar(50) unique,
TID int foreign key references productType(ID) --���
)

create table __product
(
ID int identity(1,1) ,--������
Name nvarchar(50) default('Mas'),--Ĭ��ֵ
TID int,
primary key(ID),--����
constraint FK_ProductType foreign key (TID)
references productType(ID),--���

CONSTRAINT CHK_Name CHECK (Name<>'Mas')--Ĭ�ϼ��
)




--����

ALTER TABLE __product
ADD primary KEY (ID)



ALTER TABLE __product
ADD CONSTRAINT PK_product
primary KEY (ID)





--���

ALTER TABLE __product
ADD FOREIGN KEY (TID) REFERENCES productType(ID);



ALTER TABLE __product
ADD CONSTRAINT FK_ProductType
FOREIGN KEY (TID) REFERENCES productType(ID);





--Ψһ  �������NULLֵ��

ALTER TABLE __product
ADD unique(Name)



ALTER TABLE __product
ADD CONSTRAINT UQ_product
unique (Name)






--check���

ALTER TABLE __product
Add check (Name<>'Mas')



ALTER TABLE __product
ADD CONSTRAINT CK_Name CHECK (Name<>'Mas');





--Ĭ��ֵ

ALTER TABLE __product
Add Default 'Mas' for Name



Alter table __product
add constraint DF_product
default 'Mas' for Name





-- not null

ALTER TABLE __product
alter column Age int not null






--ɾ��Լ��
ALTER TABLE __product
DROP CONSTRAINT FK_ProductType;




--����ֶ�

ALTER TABLE __product
ADD Age int


--�޸��ֶ�
ALTER TABLE __product
alter column Age int 



--ɾ���ֶ�
ALTER TABLE __product
drop column Age