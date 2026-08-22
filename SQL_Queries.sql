-- DATA CLEANING
create table store_sales
like sales;

insert store_sales
select * from sales;

SELECT Sale_ID, COUNT(*) FROM Sales GROUP BY Sale_ID HAVING COUNT(*) > 1;

with duplicates as 
(
select *, row_number() 
over (partition by sale_id, branch, city, customer_type, gender, product_name, product_category, unit_price, quantity, tax, total_price, reward_points) as row_duplicates
from sales) 
select *
from duplicates
where row_duplicates > 1; 

SELECT Product_name, Product_category, COUNT(*) AS freq
FROM store_sales
GROUP BY Product_name, Product_category
ORDER BY Product_name, freq DESC;

update store_sales
set product_category = 'Beverages'
where product_name = 'Orange Juice';

commit;
SELECT Product_name, Product_category
FROM (
    SELECT Product_name, Product_category,
           ROW_NUMBER() OVER (PARTITION BY Product_name ORDER BY COUNT(*) DESC) AS rn
    FROM store_sales
    GROUP BY Product_name, Product_category
) t
WHERE rn = 1;  

select product_category, product_name
from store_sales
where product_name like 'sham%';

select distinct(product_category)
from store_sales;

select * from store_sales 
where product_name is null
or product_name = '';

 -- verified no nulls/blanks across all columns

-- REVENUE ANALYSIS
 select max(unit_price), min(unit_price), max(quantity), min(quantity), max(tax), min(tax)
 from store_sales;

SELECT DISTINCT Product_name, Product_category
FROM store_sales
ORDER BY Product_name;

SELECT Product_name, Product_category, COUNT(*) AS freq
FROM store_sales
GROUP BY Product_name, Product_category
ORDER BY freq desc;

select distinct product_category,count(*)
from store_sales
group by product_category;

SELECT product_name, product_category
FROM store_sales 
WHERE (unit_price, product_category) IN (
    SELECT MAX(unit_price), product_category
    FROM store_sales
    GROUP BY product_category
);

SELECT Product_name, 
       AVG(Unit_price) AS avg_unit_price,
       MIN(Unit_price) AS min_price,
       MAX(Unit_price) AS max_price
FROM store_sales
GROUP BY Product_name
ORDER BY avg_unit_price DESC;

select distinct product_name, rank_
from (
select product_name, avg(total_price) over(partition by product_name ) as rank_
from store_sales) as ff
order by rank_ desc;

select product_name, sum(quantity) as quantity_total
from store_sales
group by product_name
order by quantity_total desc;

select distinct product_name, rank_tax
from (
select product_name, avg(tax) over(partition by product_name ) as rank_tax
from store_sales) as ll
order by rank_tax desc;

select distinct product_name, rank_revenue
from (
select product_name, sum(total_price) over(partition by product_name ) as rank_revenue
from store_sales) as ff
order by rank_revenue desc;

select product_name,round(avg(total_price),2) as avg_price
from store_sales
group by product_name
order by avg_price desc;

-- GENDER ANALYSIS

select gender, count(*)
from store_sales
group by gender;

select gender ,round(avg(total_price),2) as gender_bs
from store_sales
group by gender
order by gender_bs desc;

select product_name, gender, sum(quantity) as ss
from store_sales
group by product_name, gender
order by ss desc;

select gender, customer_type, count(customer_type) as customer_ty
from store_sales
group by gender, customer_type;

select gender, sum(quantity)	
from store_sales
group by gender;

select product_name, gender, sum(quantity) as mm
from store_sales
where customer_type = 'member'
group by product_name, gender 
order by mm desc ;

select gender, sum(mm) from (
select product_name, gender, sum(quantity) as mm
from store_sales
where customer_type = 'member'
group by product_name, gender 
order by mm desc) as jj
group by gender ;

select product_name, gender, sum(quantity) as ff
from store_sales
where customer_type = 'normal'
group by product_name, gender
order by ff desc ;

select gender, sum(mm) from (
select product_name, gender, sum(quantity) as mm
from store_sales
where customer_type = 'normal'
group by product_name, gender 
order by mm desc) as jj
group by gender ;


select product_name, gender, count(quantity)
from store_sales
group by product_name, gender;

select gender, sum(reward_points) as reward_points
from store_sales
where customer_type = 'member'
group by gender;

select product_name, gender, sum(reward_points) as reward_points_total, 
rank() over(partition by gender order by sum(reward_points) desc) as rank_points
from store_sales
group by product_name, gender;

----BRANCH ANALYSIS
select branch, sum(total_price)
from store_sales
group by branch;

select branch, city, count(*)
from store_sales
group by branch, city;

select branch, product_name, sum(quantity), rank() over(partition by branch order by sum(quantity) desc)
from store_sales
group by  branch, product_name;

select city, product_name, quantity_total, rank_ 
from (
select city, product_name, sum(quantity) as quantity_total, rank() over(partition by city order by sum(quantity) desc) as rank_
from store_sales
where branch = 'A'
group by  city, product_name) AS f
;

SELECT 
    city,
    ROUND((SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 1) AS percentage_of_male_customers,
    ROUND((SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 1) AS percentage_of_female_customers
FROM Sales
GROUP BY city;




