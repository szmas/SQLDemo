--any ƥ���κ�һ��  or������

select *
from product
where TID = ANY (select ID from productType where ID in (1,2));-- TID�����ⷵ�ص�����   �� in ��Ч



--All ƥ������  and������

select *
from product
where TID = all (select ID from productType where ID in(1,2)); --TID�����з��ص��������



--����Some��Any�ȼ�

select *    
from product
where TID = some (select ID from productType where ID in(1,2)); --TID�����з��ص��������