create database if not exists swiggy;
use swiggy;
select*from restaurant;
select * from restaurant where city='Bangalore'and
 rating_count=(select min(rating_count) from restaurant where city='Bangalore');
 
 -- which restaurant has genersted maximum revenue all over india?
 select * from restaurant where cost*rating_count=(select max(rating_count*cost) from restaurant);
 
 -- how many restaurant are having rating more than the average rating
 select count(*) from  restaurant where rating>(select avg(rating) from  restaurant);
 
 -- which  restaurant of Delhi has generated most revenue
 select* from restaurant
 where city='delhi' and cost*rating_count= 
 (select max(cost*rating_count) from restaurant where city='delhi');

-- which restaurant chain has maximum number of restaurant
select name, count(name) as 'no_of_chain' from restaurant group by name order by no_of_chain desc limit 1;

-- which restaurant chain has generated maximum revenue?
select name, sum(cost*rating_count) as 'revenue' from restaurant group by name order by revenue desc limit 10;

-- which city has maximum number of restaurant?
select city, count(*) as 'total_no' from restaurant group by city order by total_no desc limit 10;

-- which city has generated maximum revenue all over india?
select city, sum(cost*rating_count) as 'revenue' from restaurant group by city order by revenue desc limit 10;

-- list 10 least expensive cuisines?
select cuisine, avg(cost) as 'avg_price' from restaurant group by cuisine order by avg_price limit 10;

-- list 10 most expensive cuisines?
select cuisine, avg(cost) as 'avg_price' from restaurant group by cuisine order by avg_price desc limit 10;

-- What is the city is having biryani as most popupular cuisine?
select city, avg(rating_count) as 'avg_rating' from restaurant  where cuisine ='biryani' group by city order by avg_rating  desc limit 10;

-- list top 10 unique restaurant with unique name only thorughout the database as per genrate maximum revenue (single restaurant with that name)?
select name, sum(cost*rating_count) as 'revenue' from restaurant
group by name having count(name)=1
order by revenue desc limit 10; 

-- 






















