--1.Create a table persons with first_name, last_name,city and age and add a constraint where age < 21 
use ecommerce
create table persons(
	first_name varchar(30),
	last_name varchar(30),
	city varchar(20), 
	age int,
	check (age<21)
	);
--1. Insert the  4 records with age less than 21 and atleast one record should have city value as “Mumbai 
insert into persons (first_name, last_name, city, age) values
    ('Lakshmi', 'Gaddam', 'Mumbai', 18),
    ('Chandu', 'kalluri', 'bangalore', 19),
    ('Gayathri', 'Mallela', 'sweden', 20),
    ('Rani', 'thugu', 'Hydrebad', 17);
--2.Insert one more record which is greater than 21 and give the result 
insert into persons values('Krishna','kadali','Godavari',22)
--error The INSERT statement conflicted with the CHECK constraint "CK__persons__age__3B75D760". The conflict occurred in database "ecommerce",
--table "dbo.persons", column 'age'.
--3. Add one more constraint in the same table where city = “Mumbai”
alter table persons add constraint check_city check(city='Mumbai');
--error The ALTER TABLE statement conflicted with the CHECK constraint "check_mumbai_city". The conflict occurred in database "master", table "dbo.persons", column 'city'. --
--4. Insert one more record where city = “jaipur” and give the result
insert into persons values('Anandi','kadali','jaipur',20);
--5. Drop both the Constraints.
alter table persons drop constraint CK__persons__age__3B75D760;
--6.Create view where city = ‘Mumbai’ 
create view mumbai_view as
select * from persons
where city = 'Mumbai'
