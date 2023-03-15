use mysql_test;
 
create table if not exists city
(
    id int,
    name varchar(17),
    countrycode varchar(3),
    district varchar(20),
    population int
);
insert into city values(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321);
insert into city values(3878, 'Scottsdale', 'USA', 'Arizona', 202705);
insert into city values(3965, 'Corona', 'USA', 'California', 124966);
insert into city values(3973, 'Concord', 'USA', 'California', 121780);
insert into city values(3977, 'Cedar Rapids', 'USA', 'Iowa', 120758);
insert into city values(3982, 'Coral Springs', 'USA', 'Florida', 117549);
insert into city values(4054, 'Fairfield', 'USA', 'California', 92256);
insert into city values(4058, 'Boulder', 'USA', 'Colorado', 91238);
insert into city values(4061, 'Fall River', 'USA', 'Massachusetts', 90555);

-- Q1. Query all columns for all American cities in the CITY table with populations larger than 100000.
-- The CountryCode for America is USA. The CITY table is described as follows
select * from city where countrycode = 'USA' and population>100000;

-- Q2. Query the NAME field for all American cities in the CITY table with populations larger than 120000.
-- The CountryCode for America is USA. The CITY table is described as follows:
select * from city where countrycode = 'USA' and population>120000;

-- Q3. Query all columns (attributes) for every row in the CITY table.
-- The CITY table is described as follows:
select * from city;

-- Q4. Query all columns for a city in CITY with the ID 1661.
-- The CITY table is described as follows
select * from city where id = 1661;

-- Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is
-- JPN. The CITY table is described as follows:
select * from city where countrycode = 'JPN';

-- Q6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is
-- JPN. The CITY table is described as follows
select name from city where countrycode = 'JPN';

-- -----------------------------------------------
create table if not exists station
(
    id int,
    city varchar(21),
    state varchar(2),
    lat_n int,
    lang_w int
);
insert into station values(794, 'Kissee Mills', 'MO', 139, 73);
insert into station values(824, 'Loma Mar', 'CA', 48, 130);
insert into station values(603, 'Sandy Hook', 'CT', 72, 148);
insert into station values(478, 'Tipton', 'IN', 33, 97);
insert into station values(619, 'Arlington', 'CO', 75, 92);
insert into station values(711, 'Turner', 'AR', 50, 101);
insert into station values(839, 'Slidell', 'LA', 85, 151);
insert into station values(588, 'Glencoe', 'KY', 46, 136);
insert into station values(665, 'Chelsea', 'IA', 98, 5);
insert into station values(342, 'Chignik Lagoon', 'AK', 103, 153);
insert into station values(733, 'Pelahatchie', 'MS', 38, 28);
insert into station values(441, 'Hanna City', 'IL', 50, 136);
insert into station values(811, 'Dorrance', 'KS', 102, 121);
insert into station values(698, 'Albany', 'CA', 49, 80);
insert into station values(325, 'Monument', 'KS', 70, 141);
insert into station values(414, 'Manchester', 'MD', 73, 37);
insert into station values(113, 'Prescott', 'IA', 39, 65);
insert into station values(971, 'Graettinger', 'IA', 94, 150);
insert into station values(266, 'Cahone', 'CO', 116, 127);

-- Q7. Query a list of CITY and STATE from the STATION table.The STATION table is described as follows
select city, state from station;

-- Q8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results
-- in any order, but exclude duplicates from the answer. The STATION table is described as follows:
select distinct(city) from station where id % 2 = 0;

-- Q9. Find the difference between the total number of CITY entries in the table and the number of
-- distinct CITY entries in the table. The STATION table is described as follows
select (count(city)-count(distinct(city))) as city_diff from station;

-- Q10. Query the two cities in STATION with the shortest and longest CITY names, as well as their
-- respective lengths (i.e.: number of characters in the name). If there is more than one smallest or
-- largest city, choose the one that comes first when ordered alphabetically. The STATION table is described as follows:

SELECT city, char_length(city) FROM STATION WHERE char_length(city) =(SELECT MIN(CHAR_LENGTH(city)) FROM STATION) order by city asc;
SELECT city, CHAR_LENGTH(city) FROM STATION WHERE char_length(city) =(SELECT Max(CHAR_LENGTH(city)) FROM STATION) order by city asc;

-- Q11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result
-- cannot contain duplicates. Input Format The STATION table is described as follows

select city from station where REGEXP_LIKE(city,'^[a,e,i,o,u]');

-- Q12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot
-- contain duplicates. Input Format The STATION table is described as follows:
select distinct(city)from station where regexp_like (city,"[a,e,i,o,u]$");

-- Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot
-- contain duplicates.Input Format The STATION table is described as follows
select distinct(city)from station where not regexp_like (city, '^[a,e,i,o,u]');

-- Q14. Query the list of CITY names from STATION that do not end with vowels. Your result cannot
-- contain duplicates.Input Format The STATION table is described as follows
select distinct(city) from station where not regexp_like(city,'[a,e,i,o,u]$');

-- Q15. Query the list of CITY names from STATION that either do not start with vowels or do not end
-- with vowels. Your result cannot contain duplicates.Input FormatThe STATION table is described as follows
select distinct(city) from station where not regexp_like (city,'^[a,e,i,o,u]') or not regexp_like (city,'[a,e,i,o,u]$');

-- Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with
-- vowels. Your result cannot contain duplicates.
select distinct(city) from station where not regexp_like (city,'^[a,e,i,o,u]') and not regexp_like (city,'[a,e,i,o,u]$');

create table if not exists product
(
product_id int,
product_name varchar(20),
unit_price int
);

create table if not exists sales
(
seller_id int,
product_id int,
buyer_id int,
sale_date date,
quantity int,
price int
);

insert into product values (1,'SB',100);
insert into product values(2,'G4',800);
insert into product values(3,'iPhone',1400);

insert into sales values(1,1,1,'2019-01-21',2,2000);
insert into sales values(2,2,2,'2019-02-17',2,800);
insert into sales values(3,2,3,'2019-06-02',2,800);
insert into sales values(4,3,4,'2019-03-13',2,2800);

-- Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,
-- between 2019-01-01 and 2019-03-31 inclusive.Return the result table in any order.
select distinct(product_name), product_id from product p  
where product_id in (
select product_id from sales where sale_date between '2019-01-01' and '2019-03-31');

create table if not exists views
(
article_id int,
author_id int,
viewer_id int,
viwer_date date);

insert into views values (1, 3, 5, '2019-08-01');
insert into views values (1, 3, 6, '2019-08-02');
insert into views values (2, 7, 7, '2019-08-01');
insert into views values (2, 7, 6, '2019-08-02');
insert into views values (4,7, 1, '2019-07-22');
insert into views values (3, 4, 4, '2019-07-2');
insert into views values (3, 4, 4, '2019-07-2');

-- Q.18 Write an SQL query to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.
select distinct(author_id) as id from views where viewer_id = author_id and viewer_id >=1 order by article_id desc;

create table if not exists delivery
(delivery_id int,
customer_id int,
order_date date,
customer_pref_delivery_date date);

-- Q.19 If the customer's preferred delivery date is the same as the order date, then the order is called
-- immediately; otherwise, it is called scheduled. Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal
-- places.
insert into delivery values(1,1,'2019-08-01','2019-08-02');
insert into delivery values(2,5,'2019-08-02','2019-08-02');
insert into delivery values(3,1,'2019-08-11','2019-08-11');
insert into delivery values(4,3,'2019-08-24','2019-08-26');
insert into delivery values(5,4,'2019-08-21','2019-08-22');
insert into delivery values(6,2,'2019-08-11','2019-08-13');

select round(d_count.order_count *100 / count(d.delivery_id), 2) as immediate_percentage 
from delivery d,
(select count(order_date) as order_count from delivery where order_date = customer_pref_delivery_date) d_count;

create table if not exists ads
(
ad_id int,
user_id int,
action_ enum('Clicked', 'Viewed', 'Ignored'),
primary key(ad_id, user_id)
);
insert into ads values(1,1,'Clicked');
insert into ads values(2,2,'Clicked');
insert into ads values(3,3,'Viewed');
insert into ads values(5,5,'Ignored');
insert into ads values(1,7,'Ignored');
insert into ads values(2,7,'Viewed');
insert into ads values(3,5,'Clicked');
insert into ads values(1,4,'Viewed');
insert into ads values(2,11,'Viewed');
insert into ads values(1,2,'Clicked');

-- Q.20 Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
-- Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a
-- tie.

SELECT  ad_id,
    round(ifnull(
    sum(case when action_ = 'Clicked' then 1 else 0 end ) *100/
    (sum(case when action_ = 'Clicked' then 1 else 0 end) + sum(case when action_ = 'Viewed' then 1 else 0 end)),
    0),2 )as ctr
from ads
group by ad_id
order by ctr desc, ad_id asc;

-- Q.22

create table if not exists countries
(
country_id int,
country_name varchar(20)
);
create table if not exists wether
(
country_id int,
weather_state int,
day date
);

insert into countries values(2,'USA');
insert into countries values(3,'Australia');
insert into countries values(7,'Peru');
insert into countries values(5,'China');
insert into countries values(8,'Morocco');
insert into countries values(9,'Spain');


insert into wether values(2,15,'2019-11-01');
insert into wether values(2,12,'2019-10-28');
insert into wether values(2,12,'2019-10-27');
insert into wether values(3,-2,'2019-11-10');
insert into wether values(3,0,'2019-11-11');
insert into wether values(3,3,'2019-11-12');
insert into wether values(5,16,'2019-11-07');
insert into wether values(5,18,'2019-11-09');
insert into wether values(5,21,'2019-11-23');
insert into wether values(7,25,'2019-11-28');
insert into wether values(7,22,'2019-12-01');
insert into wether values(7,20,'2019-12-02');
insert into wether values(8,25,'2019-11-05');
insert into wether values(8,27,'2019-11-15');
insert into wether values(8,31,'2019-11-25');
insert into wether values(9,7,'2019-10-23');
insert into wether values(9,3,'2019-12-23');

-- Q.22 Write an SQL query to find the type of weather in each country for November 2019.
-- The type of weather is:
-- ● Cold if the average weather_state is less than or equal 15,
-- ● Hot if the average weather_state is greater than or equal to 25, and
-- ● Warm otherwise.
-- Return result table in any order.

select distinct(c.country_name),
case 
	when w.weather_state <=15 then 'Cold'
    when w.weather_state >= 25 then 'Hot'
    else 'Warm'
end as weather_type
from wether as w join countries c on w.country_id = c.country_id
where w.day between '2019-11-01' and '2019-11-30';

-- Q.23
create table if not exists prices
(
product_id int,
start_date date,
end_date date,
price int
);

create table if not exists unitsold
(
product_id int,
purchase_date date,
units int
);

insert into prices values(1,'2019-02-17','2019-02-28', 5);
insert into prices values(1,'2019-03-01','2019-03-22',20);
insert into prices values(2,'2019-02-01','2019-02-20',15);
insert into prices values(2,'2019-02-21','2019-03-31',30);

insert into unitsold values(1,'2019-02-25',100);
insert into unitsold values(1,'2019-03-01',15);
insert into unitsold values(2,'2019-02-10',200);
insert into unitsold values(2,'2019-03-22',30);


-- Q.23 Write an SQL query to find the average selling price for each product. average_price should be
-- rounded to 2 decimal places.Return the result table in any order.

select unitsold.product_id, round(sum(units*price)/sum(units), 2) as average_price
from unitsold inner join prices
on unitsold.product_id = prices.product_id
and unitSold.purchase_date between prices.start_date and prices.end_date
group by unitsold.product_id;

-- Q24
create table if not exists activity
(
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id, event_date) 
);

insert into activity values(1,2,'2016-03-01',5);
insert into activity values(1,2,'2016-05-02',6);
insert into activity values(2,3,'2017-06-25',1);
insert into activity values(3,1,'2016-03-02',0);
insert into activity values(3,4,'2018-07-03',5);

-- Q.24 Write an SQL query to report the first login date for each player.
-- Return the result table in any order
select player_id, min(event_date) from activity group by player_id;

-- Q.25 Write an SQL query to report the device that is first logged in for each player.
-- Return the result table in any order.
select player_id, device_id from activity group by player_id;

-- Q.26
create table if not exists products
(
product_id int,
product_name varchar(20),
product_category varchar(20),
primary key(product_id)
);

create table if not exists orders
(
product_id INT,
order_date date,
unit int
);
insert into products values(1,'Leetcode Solutions','Book');
insert into products values(2,'Jewels of Sty','Book');
insert into products values(3,'HP','Laptop');
insert into products values(4,'Lenovo','Laptop');
insert into products values(5,'Leetcode Kit','T-shirt');
select * from products;

insert into orders values(1,'2020-02-05',60);
insert into orders values(1,'2020-02-05',60);
insert into orders values(1,'2020-02-10',70);
insert into orders values(2,'2020-01-18',30);
insert into orders values(2,'2020-02-11',80);
insert into orders values(3,'2020-02-17 ',2);
insert into orders values(3,'2020-02-24',3);
insert into orders values(4,'2020-03-01',20);
insert into orders values(4,'2020-03-04',60);
insert into orders values(5,'2020-02-25',50);
insert into orders values(5,'2020-02-27',50);
insert into orders values(5,'2020-03-01',50);

-- Q.26 SQL query to get the names of products that have at least 100 units ordered in February 2020
-- and their amount.
select p.product_name, sum(o.unit)from products p inner join orders o on p.product_id = o.product_id where order_date
between '2020-02-02' and '2020-02-28'group by product_name having sum(unit)>=100;

-- Q.27
create table if not exists users
(
user_id int,
name varchar(30),
mail varchar(40),
primary key (user_id)
);
insert into users values(1,'Winston','winston@leetcode.com');
insert into users values(2,'Jonathan','jonathanisgreat');
insert into users values(3,'Annabelle', 'bella-@leetcode.com');
insert into users values(4,'Sally','sally.come@leetcode.com');
insert into users values(5,'Marwan','quarz#2020@leetcode.com');
insert into users values(6,'David','david69@gmail.com');
insert into users values(7,'Shapiro','.shapo@leetcode.com');
select * from users;

-- Q.27  Write an SQL query to find the users who have valid emails.
-- A valid e-mail has a prefix name and a domain where:
-- ● The prefix name is a string that may contain letters (upper or lower case), digits, underscore
-- '_', period '.', and/or dash '-'. The prefix name must start with a letter.
-- ● The domain is '@leetcode.com'.
-- Return the result table in any order.
-- The query result format is in the following example
select name, mail from users where REGEXP_like(mail, '^^[a-zA-Z]+[a-zA-Z0-9_\\./\\-]{0,}@leetcode.com$');

-- Q.28
create table if not exists customers
(
customer_id int,
name varchar(30),
country varchar(40),
primary key (customer_id)
);

create table if not exists products_
(
product_id int,
description_ varchar(30),
price varchar(40),
primary key(product_id)
);

create table if not exists orders_
(
order_id int,
customer_id int,
product_id int,
order_date date,
quantity int,
primary key (order_id)
);

insert into customers values(1, 'Winston', 'USA');
insert into customers values(2, 'Jonathan', 'Peru');
insert into customers values(3, 'Moustafa', 'Egypt');

insert into products_ values(10, 'LC Phone', 300);
insert into products_ values(20, 'LC T-Shirt', 10);
insert into products_ values(30, 'LC Book', 45);
insert into products_ values(40, 'LC Keychain', 2);

insert into orders_ values(1, 1, 10, '2020-06-10', 1);
insert into orders_ values(2, 1, 20, '2020-07-01', 1);
insert into orders_ values(3, 1, 30, '2020-07-08', 2);
insert into orders_ values(4, 2, 10, '2020-06-15', 2);
insert into orders_ values(5, 2, 40, '2020-07-01', 10);
insert into orders_ values(6, 3, 20, '2020-06-24', 2);
insert into orders_ values(7, 3, 30, '2020-06-25', 2);
insert into orders_ values(9, 3, 30, '2020-05-08', 3);

-- Q.28 Write an SQL query to report the customer_id and customer_name of customers who have spent at
-- least $100 in each month of June and July 2020. Return the result table in any order.
select o.customer_id, c.name from customers c, products_ p, orders_ o
where c.customer_id = o.customer_id and p.product_id = o.product_id
group by o.customer_id
having 
(
    sum(case when o.order_date like '2020-06%' then o.quantity*p.price else 0 end) >= 100
    and
    sum(case when o.order_date like '2020-07%' then o.quantity*p.price else 0 end) >= 100
);

-- Q.29
create table if not exists tvprogram
(
program_date date,
content_id int,
channel varchar(200),
primary key (program_date, content_id)
);
drop table content;
create table if not exists content
(
content_id varchar(3),
title varchar(30),
Kids_content enum('Y','N'),
content_type varchar(10),
primary key (content_id)
);

insert into tvprogram values('2020-06-10 08:00', 1, 'LC-Channel');
insert into tvprogram values('2020-05-11 12:00', 2, 'LC-Channel');
insert into tvprogram values('2020-05-12 12:00', 3, 'LC-Channel');
insert into tvprogram values('2020-05-13 14:00', 4, 'Disney Ch');
insert into tvprogram values('2020-06-18 14:00', 4, 'Disney Ch');
insert into tvprogram values('2020-07-15 16:00', 5, 'Disney Ch');

insert into content values(1, 'Leetcode Movie', 'N', 'Movies');
insert into content values(2, 'Alg. for Kids', 'Y', 'Series');
insert into content values(3, 'Database Sols', 'N', 'Series');
insert into content values(4, 'Aladdin', 'Y', 'Movies');
insert into content values(5, 'Cinderella', 'Y', 'Movies');

-- Q.29 Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.
-- Return the result table in any order
select title from content c inner join tvprogram tv on c.content_id= tv.content_id 
where c.content_type = 'Movies' and c.kids_content = 'Y' and tv.program_date like '2020-06%';

-- Q.30
create table if not exists npv
(
id int,
year int,
npv int,
primary key (id, year)
);

create table if not exists queries
(
id int,
year int,
primary key (id, year)
);
insert into npv values(1, 2018, 100);
insert into npv values(7, 2020, 30);
insert into npv values(13, 2019, 40);
insert into npv values(1, 2019, 113);
insert into npv values(2, 2008, 121);
insert into npv values(3, 2009, 12);
insert into npv values(11, 2020, 99);
insert into npv values(7, 2019, 0);

insert into queries values(1, 2019);
insert into queries values(2, 2008);
insert into queries values(3, 2009);
insert into queries values(7, 2018);
insert into queries values(7, 2019);
insert into queries values(7, 2020);
insert into queries values(13, 2019);

-- Q.30 Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.
select q.*, ifnull(n.npv,0) as npv from queries q left join npv n on q.id = n.id and q.year=n.year;

-- Q.31
-- question repated, copy of Q.30

create table if not exists employees
(
id int,
name varchar(20),
primary key (id)
);

create table if not exists employeesuni
(
id int,
unique_id int,
primary key (id, unique_id)
);
insert into employees values(1, 'Alice');
insert into employees values(7, 'Bob');
insert into employees values(11, 'Meir');
insert into employees values(90, 'Winston');
insert into employees values(3, 'Jonathan');

insert into employeesuni values(3, 1);
insert into employeesuni values(11, 2);
insert into employeesuni values(90, 3);

-- Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just
-- show null.
-- select euni.id from employeesuni euni;
-- select euni.unique_id as unique_id , e.name from employees e join employeesuni euni on e.id=euni.id ;
select unique_id, name from employees left join employeesuni on employees.id = employeesuni.id;

-- Q.33 Write an SQL query to report the distance travelled by each use
select name, ifnull(sum(distance), 0) as travelled_distance from users left join rides on users.id = rides.user_id
group by Users.id order by travelled_distance desc, name;

-- Q.34 Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
-- and their amount. Return result table in any order

-- Answer: repeated question copy answer of Q.26

-- Q.35
create table if not exists movies
(
movie_id int,
title varchar(20),
primary key (movie_id)
);

create table if not exists users_
(
user_id int,
name varchar(15),
primary key (user_id)
);

create table if not exists movierating
(
movie_id int,
user_id int,
rating int,
created_at date,
primary key (movie_id, user_id)
);

insert into movies values (1, 'Avengers');
insert into movies values (2, 'Frozen 2');
insert into movies values (3, 'Joker');

insert into users_ values(1, 'Daniel');
insert into users_ values(2, 'Monica');
insert into users_ values(3, 'Maria');
insert into users_ values(4, 'James');

insert into movierating values (1, 1, 3, '2020-01-12');
insert into movierating values (1, 2, 4, '2020-02-11');
insert into movierating values (1, 3, 2, '2020-02-12');
insert into movierating values (1, 4, 1, '2020-01-01');
insert into movierating values (2, 1, 5, '2020-02-17');
insert into movierating values (2, 2, 2, '2020-02-01');
insert into movierating values (2, 3, 2, '2020-03-01');
insert into movierating values (3, 1, 3, '2020-02-22');
insert into movierating values (3, 2, 4, '2020-02-25');

-- Q.35 Write an SQL query to:
-- ● Find the name of the user who has rated the greatest number of movies. In case of a tie,
-- return the lexicographically smaller user name.
-- ● Find the movie name with the highest average rating in February 2020. In case of a tie, return
-- the lexicographically smaller movie name.
-- The query result format is in the following example.

(select name from users_ left join movierating on users_.user_id= movierating.user_id 
group by movierating.user_id order by count(movierating.rating) desc , name limit 1)
union 
(select title from movies left join movierating using(movie_id) 
where left(created_at,7)= '2020-02' group by movie_id order by avg(rating) desc, title limit 1);

-- Q.36

create table user1
(
id int,
name varchar(20),
primary key (id)
);

create table if not exists rides
(
id int,
user_id int,
distance int,
primary key (id)
);

insert into user1 values(1, 'Alice');
insert into user1 values(2, 'Bob');
insert into user1 values(3, 'Alex');
insert into user1 values(4, 'Donald');
insert into user1 values(7, 'Lee');
insert into user1 values(13, 'Jonathan');
insert into user1 values(19, 'Elvis');

insert into rides values(1, 1, 120);
insert into rides values(2, 2, 317);
insert into rides values(3, 3, 222);
insert into rides values(4, 7, 100);
insert into rides values(5, 13, 312);
insert into rides values(6, 19, 50);

-- Q.36 Write an SQL query to report the distance travelled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users
-- travelled the same distance, order them by their name in ascending order.
-- The query result format is in the following example

use mysql_test;
select name, sum(ifnull(distance,0)) as travelled_distance from rides r right join user1 u1 on r.user_id = u1.id group by name order by travelled_distance desc, name asc;

-- Q.37 Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just
-- show null.
-- Return the result table in any order.
-- The query result format is in the following exampl

-- select * from employees;
-- select * from employeesuni;
select ifnull(empuni.unique_id, Null), emp.name from employees emp left join employeesuni empuni on emp.id = empuni.id  order by name asc;

create table if not exists students
(
id int,
name varchar(15),
department_id int
);

create table if not exists departments
(
id int,
name varchar(20)
);

insert into departments values(1, 'Electrical Eng');
insert into departments values(7, 'Computer Eng');
insert into departments values(13, 'Business Admin');

insert into students values(23,'Alice', 1);
insert into students values(1,'Bob', 7);
insert into students values(5,'Jeniffer', 13);
insert into students values(2,'John', 14);
insert into students values(4,'Jasmin', 77);
insert into students values(3,'Steve', 74);
insert into students values(6,'Luis', 1);
insert into students values(8,'Jonathan', 7);
insert into students values(7,'Diana', 33);
insert into students values(11,'Medlyne', 1);

-- Q.38 Write an SQL query to find the id and the name of all students who are enrolled in departments that no
-- longer exist. Return the result table in any order.
-- The query result format is in the following example.
select id ,name from students where department_id not in( select id from departments);

create table if not exists calls
(
from_id int,
to_id int,
duration int 
);

insert into calls values(1,2,59);
insert into calls values(2,1,11);
insert into calls values(1,3,20);
insert into calls values(3,4,100);
insert into calls values(3,4,20);
insert into calls values(3,4,50);
insert into calls values(4,3,30);

-- Q.39 Write an SQL query to report the number of calls and the total call duration between each pair of
-- distinct persons (person1, person2) where person1 < person2.
-- Return the result table in any order.
-- The query result format is in the following example
select from_id, to_id, count(duration), sum(duration) from calls group by from_id, to_id;

WITH caller as (
    select from_id as person1, to_id as person2, duration
    from Calls
    UNION ALL
    select to_id as person1, from_id as person2, duration
    from Calls
),

unique_caller as (
    select person1, person2, duration
    from caller
    where person1 < person2
)

select
    person1, person2, count(*) as call_count, sum(duration) as total_duration
from unique_caller
group by person1, person2;

-- Q.40 Write an SQL query to find the average selling price for each product. average_price should be
-- rounded to 2 decimal places.
-- Return the result table in any order.
-- The query result format is in the following example.

select product_id, sum(modified.value)/sum(units) as average_price from 
(select prices.product_id, unitsold.units, prices.price*units as value from unitsold join prices on unitsold.product_id=prices.product_id and unitsold.purchase_date between prices.start_date and prices.end_date) as modified group by prices.product_id;

-- Q.41 Write an SQL query to report the number of cubic feet of volume the inventory occupies in each
-- warehouse.
-- Return the result table in any order.
-- The query result format is in the following example
Use mysql_test;

create table wearhouse(
name varchar(25),
product_id int,
units int
);

insert into wearhouse value ( 'LC House1', 1, 2);
insert into wearhouse value ( 'LC House1', 2, 10);
insert into wearhouse value ( 'LC House1', 3, 5);
insert into wearhouse value ( 'LC House2', 1, 2);
insert into wearhouse value ( 'LC House2', 2, 2);
insert into wearhouse value ( 'LC House3', 4, 1);

-- create table
select wh.name as werhouse_name,	
	sum(p.width * p.lenggth * p.height) as volume
from wearhouse wh inner join product_new p on wh.product_id = p.product_id
group by wh.name;

create table product_new(
product_id int,
product_name varchar(20),
width int,
lenggth int,
height int,
primary key(product_id)
);
insert into product_new values(1,'LC-TV', 5, 50, 40);
insert into product_new values(2,'LC-keychain', 5, 5, 5);
insert into product_new values(3,'LC-Phone', 2, 10, 10);
insert into product_new values(4,'LC-Tshirt', 4, 10, 20);

-- Q.42 Write an SQL query to report the difference between the number of apples and oranges sold each day.
-- Return the result table ordered by sale_date.
-- The query result format is in the following example

create table sales_new
(
sale_date date,
fruit varchar(20),
sold_num int,
primary key(sale_date, fruit)
);

insert into sales_new values( '2020-05-01' , 'apples', 10);
insert into sales_new values( '2020-05-01' , 'oranges', 8);
insert into sales_new values( '2020-05-02' , 'apples', 15);
insert into sales_new values( '2020-05-02' , 'oranges', 15);
insert into sales_new values( '2020-05-03' , 'apples', 20);
insert into sales_new values( '2020-05-03' , 'oranges', 0);
insert into sales_new values( '2020-05-04' , 'apples', 15);
insert into sales_new values( '2020-05-04' , 'oranges', 16);

select date(sale_date) as sale_date, 
SUM(case when fruit = 'apples' then sold_num
		  when fruit = 'oranges' then -sold_num 
end) as diff
from sales_new
group by sale_date;

-- Q. 43 Write an SQL query to report the fraction of players that logged in again on the day after the day they
-- first logged in, rounded to 2 decimal places. In other words, you need to count the number of players
-- that logged in for at least two consecutive days starting from their first login date, then divide that
-- number by the total number of players.
-- The query result format is in the following example.

-- Q.44

-- Q.45 Write an SQL query to report the respective department name and number of students majoring in
-- each department for all departments in the Department table (even ones with no current students).
-- Return the result table ordered by student_number in descending order. In case of a tie, order them by
-- dept_name alphabetically

select d.id, d.name, count(s.id) from students s inner join mysql_test.departments d 
on s.department_id = d.id 
group by d.id;

-- Q.46 Write an SQL query to report the customer ids from the Customer table that bought all the products in
-- the Product table.
-- Return the result table in any order.
-- The query result format is in the following example.

-- select customer_id
-- 	case when p.product_key in  
select distinct customer_id
    from (
        select customer_id, count(distinct product_key) as product_count
            from Customer
            group by customer_id
    ) as customer_product_counts
    join (
        select count(distinct product_key) as product_count from Product
    ) as product_counts
    on customer_product_counts.product_count = product_counts.product_count;

create table if not exists Customer
(
customer_id int,
product_key int
);
insert into Customer values(1, 5);
insert into Customer values(2, 6);
insert into Customer values(3, 5);
insert into Customer values(3, 6);
insert into Customer values(1, 6);

create table if not exists products_a
(
product_key int
);

insert into products_a values (6);
insert into products_a values (5);

select distinct(p.product_key) from products_a p ;
select c.customer_id, (c.product_key) from Customer c 
group by c.customer_id;

-- Q.49

select temp.*
from
(select *,
rank() over(partition by student_id order by grade desc, course_id asc) as student_rank 
from enrollments) as temp
where temp.student_rank = 1;

-- Q.50 
create table matches(
match_id integer,
host_team integer,
guest_team integer,
host_goal int,
guest_goal int,
primary key(match_id)
);
 
 insert into matches values(2,2,95);
 insert into matches values(2,3,95);
 insert into matches values(1,1,90);
 insert into matches values(1,2,99);
 insert into matches values(3,1,80);
 insert into matches values(3,2,75);
 insert into matches values(3,3,82);

