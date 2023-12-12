
create database ExerciseDb1

use ExerciseDb1

create table Products
(PId int primary key identity(1000,1),
PName nvarchar(50) not null,
PPrice float,
PTax as PPrice*.10 persisted,
PCompany nvarchar(50) check(PCompany in('Samsung','Apple','Redmi','HTC','RealMe')),
PQty int check(PQty>=1) default 1)

insert into Products values('Samsung-M31',23000,'Samsung',2)
insert into Products values('Iphone 15',130000,'Apple',1)
insert into Products values('Realme narzo 50',23000,'Realme',2)
insert into Products values('Redmi 12 pro',19000,'Redmi',5)
insert into Products values('HTC-1',14000,'HTC',1)
insert into Products values('Samsung s22 ultra',78000,'Samsung',1)
insert into Products values('Redmi 13c 5g',7900,'Redmi',4)
insert into Products values('Iphone 14 pro',73000,'Apple',1)
insert into Products values('HTC Phone-2',27000,'HTC',1)
insert into Products values('Realme 10 pro',17000,'Realme',1)


select * from Products

create proc usp_Products
As
select PId ,PName , PPrice+PTax as 'PPricewithTax' , PCompany , PQty*(PPrice+PTax) as 'TotalPrice' from Products

exec usp_Products

