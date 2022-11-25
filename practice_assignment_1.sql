create database practice_assignment;
use practice_assignment;

create table if not exists orders(
    id int,
    ord_no int,
    purch_amt float,
    ord_date date,
    customer_id int,
    salesman_id int
);
insert into orders values(1,70001, 150.5, '2012-10-05', 3005,5002);
insert into orders values(2,70009, 270.65, '2012-10-06', 3006,5003);
insert into orders values(3,70004, 65.26, '2012-10-07', 3007,5004);
insert into orders values(4,70007, 110.5, '2012-10-08', 3008,5005);

select ord_date,salesman_id,ord_no,purch_amt from orders;

# 2. From the following table, write a SQL query to locate salespeople who live in the city
# of 'Paris'. Return salesperson's name, city 

-- 5. From the following table, write a SQL query to find details of all orders excluding
-- those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or
-- purch_amt greater than 1000.Return ord_no, purch_amt and ord_date and customer_id and
-- salesman_id.

select ord_no, purch_amt, ord_date, customer_id,salesman_id from orders where ord_date != '2012-10-05' and (salesman_id >5004 or purch_amt>50 );

create table if not exists sales_data
(
    id int,
    salesman_id int,
    salesman_name varchar(30),
    city varchar(30),
    comission float
);
insert into sales_data values(1,5001,'James' ,'New York', 0.15);
insert into sales_data values(2,5002,'Neil', 'Paris', 0.12);
insert into sales_data values(3,5003,'Pit', 'London', 0.41);
insert into sales_data values(4,5004,'Layon', 'Rome', 0.15);

select salesman_name,city from sales_data where city='Paris';

-- 3. From the following table, write a SQL query to select a range of products whose
-- price is in the range Rs.200 to Rs.600. Begin and end values are included. Return
-- pro_id, pro_name, pro_price, and pro_com.

create table if not exists products
(
    id int,
    pro_id int,
    pro_name varchar(30),
    pro_price float,
    pro_com int
);
insert into products values(1,101,'Motherboard' ,3200.00, 15);
insert into products values(2,102,'Keyboard', 450.00, 12);
insert into products values(3,103,'Zip drive',250.00, 41);
insert into products values(4,104,'Speaker',550.00, 15);
insert into products values(5,105,'Monitor',5000.00, 12);
insert into products values(6,10,'DVD drive',900.00, 11);
insert into products values(7,107,'Monitor',200.00, 12);
insert into products values(8,108,'DVD drive',600.00, 11);

select * from products where pro_price >= 200 and pro_price <= 600;

-- 4. From the following table, write a SQL query to find the items whose prices are
-- higher than or equal to $550. Order the result by product price in descending, then
-- product name in ascending.
-- Return pro_name and pro_price.

select pro_name, pro_price from products where pro_price>=550 order by pro_price desc, pro_name asc;

create table if not exists population(
    id int,
    name varchar(100),
    continent varchar(100),
    area varchar(100),
    population int,
    gdp int8
);
drop table population;
insert into population values(1,'Afganistan','Asia', 652230, 30059997,20343000000);
insert into population values(2,'Albania','Europe', 28748, 9085000,20223000000);
insert into population values(3,'Algeria','Africa', 2831718, 4567,19343000000);
insert into population values(4,'Andorra','Europe', 468, 9089999,2034370000);
insert into population values(5,'Angola','Africa', 1246700, 305405,2033000000);
insert into population values(6,'D Republic','Caribben', 48671, 30035,293400);
insert into population values(7,'China','Asia', 9596961,3003599,2055);
insert into population values(8,'Colombia','South America', 1141748,3003500, 203430);
insert into population values(9,'Comros','Africa', 343005,3009999, 743798);
insert into population values(10,'Denmark','Europe', 1862,70035, 88000);
insert into population values(11,'Dominica','Caribben',  43074,30101035,71293);

-- 1. Write a query to fetch which country has the highest population?
select * from population order by population desc;
select name from population order by population desc limit 1;

-- 2.write a query to fetch the name of the country which has the least gdp?
select name from population order by gdp asc limit 1;

-- 3. Write a query to fetch the name of the country which ends with letter C?
select name from population where name like '%c'; 

-- 4.write a query to fetch the name of the country which starts with letter D?
select name from population where name like 'D%';

-- 5.write query to fetch which continent has highest gdp?
select continent from population group by continent order by sum(gdp) desc limit 1; 

-- 6.Give the total GDP of Africa?
select continent, sum(gdp) from population where continent = 'Africa';

-- 7.write a query to fetch the total population for each continent?
select continent, sum(population) from population group by continent;


-- 8. For each relevant continent show the number of countries that has a population of at least
-- 200000000?
-- Hint: Can be solved using aggregate function
select continent,
	count(name)
from population where population>2000000 group by continent ; 

-- 7. Problem statement: Suppose we have two table students and course
create table students(student_id int,
student_name varchar(60) not null,
city varchar(60) not null,
primary key(student_id));
create table course(student_id int,
course_name varchar(60) not null,
Marks int not null,
primary key(student_id),
foreign key(student_id) references students(student_id));

insert into students values(200,'John Doe','Delhi'),
(210,'John Doe','Delhi'),
(220,'Moon ethan','Rajasthan'),
(230,'Jessie','Bangalore'),
(240,'Benbrook','Bihar'),
(250,'Ethan','Bihar'),
(260,'Johnnie','Bangalore'),
(270,'Goh','Delhi'),(380,'John Doe','Delhi'),
(280,'Pavi','Delhi'),
(290,'Sanvi','Rajasthan'),
(300,'Navyaa','Bangalore'),
(310,'Ankul','Bihar'),
(311,'Hitanshi','Bihar'),
(312,'Aayush','Bangalore'),
(313,'Rian','Delhi');

insert into course values(200,'Datascience',75),
(210,'Datascience',75),
(220,'Dataanalyst',80),
(230,'Dataanalyst',80),
(240,'Dataanalyst',84),
(250,'Dataanalyst',50),
(260,'Datascience',80),
(270,'Datascience',99),
(380,'Datascience',45),
(280,'Datascience',78),
(290,'Dataanalyst',78),
(300,'Computer vision',90),
(310,'Computer vision',90),
(311,'Computer vision',75),
(312,'Computer vision',39);

select* from students limit 2;
select * from course limit 2;
-- q1. write a query to fetch the names of the students having maximum marks in each
-- course?

select s.*,c.* from students s inner join course c on s.student_id=c.student_id group by course_name;
-- q2. write a query to fetch the names of the students having 3th highest marks from each
-- course?
-- q3. write a query to fetch the names of the students having minimum marks in each course?
-- q4. write a query to fetch the names of the students having 4th least marks from each
-- course?
-- q5. write a query to fetch the city name of the students who have 2nd highest marks?
-- q6. write a query to fetch the count of each city?
-- q7. write a query to fetch the names of the students who are from the same city?
-- q8.write a query to fetch the names of students starting with 'A'?
-- q9.write a query to fetch the count of students' names having the same marks in each
-- course?
-- q10.write a query to fetch the count of students from each city?
-- Hint : You must use Joins, Windows functions and CTE


