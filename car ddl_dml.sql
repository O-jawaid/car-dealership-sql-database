

--ddl
create table category(
	category_id int primary key,
	name varchar(50) not null
)

create table customer(
	customer_id int primary key,
	first_name varchar(50) not null,
	last_name varchar(50),
	address varchar(50),
	city varchar(50),
	phone_no  varchar(20)
)

create table car(
	VIN varchar(15) primary key,
	make varchar(20) not null,
	model varchar(20) not null,
	color varchar(20),
	year int not null,
	mileage int,
	type varchar(20) not null,
	for_sale_status int not null,
	customer_id int,
	category_id int not null,
	foreign key (customer_id) references customer(customer_id),
	foreign key (category_id) references category(category_id)
)

create table history(
	history_id int primary key,
	Stolen int,
	Accident int,
	Description varchar(50),
	date date,
	VIN varchar(15),
	foreign key (VIN) references car(VIN)
)

create table feature(
	feature_id int primary key,
	name varchar(50) not null,
	VIN varchar(15) not null,
	foreign key (VIN) references car(VIN)
)

create table inventory(
	inventory_id int primary key,
	type varchar(50) not null,
	enter_date date not null,
	VIN varchar(15) not null,
	foreign key (VIN) references car(VIN)
)

create table Maintenance(
	Maintenance_id int primary key,
	Description varchar(50) not null,
	VIN varchar(15) not null,
	Maintenance_Date date not null,
	Cost int not null,
	Returned_DateTime datetime not null,
	foreign key (VIN) references car(VIN)
)

create table Service(
	Service_id int primary key,
	Service_Type varchar(50) not null,
	Time_Required varchar(20),
	VIN varchar(15) not null,
	Service_Date date not null,
	Hourly_Rate int not null,
	Returned_DateTime datetime not null,
	foreign key (VIN) references car(VIN)
)

--dml
insert into category values (1,'Sedan')
insert into category values (2,'SUV')
insert into category values (3,'FWD')
insert into category values (4,'AWD')

insert into customer values (10,'Ahmed','Ali','24 Avenue barkley', 'Dubai','934353404')
insert into customer values (11,'Haris','Ali','street 4 standford', 'Abu Dabi','93987404')
insert into customer values (12,'John','Wick','14 Avenue barkley', 'Dubai','9753404')
insert into customer values (13,'Leo','Messi','2 Avenue barkley', 'Dubai','934123404')
insert into customer values (14,'David','Johnson','3 Avenue barkley', 'Dubai','93408604')

insert into car values ('AAA342J1','Honda','City Aspire','Black',2023,14,'Used',1,10,1)
insert into car values ('FDS342J2','Toyota','Corolla GLI','White',2020,12,'Used',1,11,1)
insert into car values ('VSD342J3','Audi','A6','Red',2023,14,'New',1,12,1)
insert into car values ('ASXA342J','Mercedez','Benz','Silver',2023,14,'New',1,13,1)
insert into car values ('VDF342J4','Toyota','Fortuner Sigma','Black',2022,9,'Used',1,14,4)

insert into feature values (1,'Apple Car Play','VDF342J4')
insert into feature values (2,'Android Auto','VDF342J4')
insert into feature values (3,'GPS','VDF342J4')
insert into feature values (4,'Bluetooth','VDF342J4')
insert into feature values (5,'GPS','ASXA342J')

insert into history values (1,1,0,'car stolen from road','4-3-2023','AAA342J1')
insert into history values (2,0,1,'car accident on road','12-2-2023','FDS342J2')

insert into Maintenance values (20,'mirror replaced','AAA342J1','1-4-2023',100,'3-4-2023')
insert into Maintenance values (21,'alloy rim change','FDS342J2','4-22-2023',500,'4-26-2023')

insert into inventory values (11,'Not Sold','12-3-2023','AAA342J1')
insert into inventory values (12,'Not Sold','12-3-2023','FDS342J2')
insert into inventory values (13,'Not Sold','12-3-2023','AAA342J1')
insert into inventory values (14,'Not Sold','12-3-2023','AAA342J1')
insert into inventory values (15,'Not Sold','12-3-2023','AAA342J1')

insert into service values (30,'Car Wash','1 hour','FDS342J2','4-22-2023',10,'4-22-2023 15:23:11')
insert into service values (31,'Car vacuum','1 hour','AAA342J1','4-4-2023',12,'4-4-2023 11:23:11')
insert into service values (32,'Car Wash','1 hour','FDS342J2','3-4-2023',10,'3-4-2023 15:23:11')
insert into service values (33,'Car Wash','1 hour','FDS342J2','2-4-2023',10,'2-4-2023 19:23:11')

--CUSTOMER THAT are in dubai
select * from customer where city='Dubai'

--car that have GPS features
select * from feature where name='GPS'

--list of sedan car that are ready for sale 
select c.VIN,c.make,c.model,c.color,c.year,c.mileage,c.type,ct.name from car c 
inner join category ct on (c.category_id=ct.category_id)
where ct.name='Sedan' and c.for_sale_status=1

-- total revenue genreated from car Maintenance
select sum(cost) as total_revenue,count(*) as no_of_Maintenance from Maintenance

--list of car that use car wash service
select * from service where service_type='Car Wash'