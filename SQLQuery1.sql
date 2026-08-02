USE COLLEGE
select  * from dbo.[SQL - Retail Sales Analysis_utf ]
select count(*) from dbo.[SQL - Retail Sales Analysis_utf ]
select * from dbo.[SQL - Retail Sales Analysis_utf ] 
where transactions_id is null or sale_date is null
or sale_time is null
or  gender is null
or category is null
or quantiy is null
or  price_per_unit is null
or cogs is null
or total_sale is null


delete from dbo.[SQL - Retail Sales Analysis_utf ] 
where quantiy is null or price_per_unit is null
delete from dbo.[SQL - Retail Sales Analysis_utf ] 
where age is null
-- Data Exploration
-- how many sales we have ?
select count(*) as total_sale from dbo.[SQL - Retail Sales Analysis_utf ]
select count(distinct customer_id) as total_sale from dbo.[SQL - Retail Sales Analysis_utf ]
select distinct category from dbo.[SQL - Retail Sales Analysis_utf ]

-- data analysis & business key problems & answers
--Q1 Write a sql query  to retrieve all columns for sales made on '2022-11-05'
select * from dbo.[SQL - Retail Sales Analysis_utf ] 
where sale_date = '2022-11-05'
--Q2 write a sql query to retrieve all transactions where the category is 'clothing'
--and the quantity sold is more than 10 in the month of Nov-2022
select 
   category,sum(quantiy)
from dbo.[SQL - Retail Sales Analysis_utf ]
where category = 'clothing'
group by category

select * from dbo.[SQL - Retail Sales Analysis_utf ]
where category = 'clothing'
And format(sale_date,'yyyy-mm') = '2022-11' 
and quantiy >=4

--Q3 write a sql query to calculate the total sales (total_sales) for each category
select * from dbo.[SQL - Retail Sales Analysis_utf ]

select
     category,
     sum(total_sale) as net_sale,
     count(*) as total_order
from dbo.[SQL - Retail Sales Analysis_utf ]
group by category

---Q4 write a sql query to find the average age of customer who purchased from the 'beauty'category.
select round( avg(age),2) as avg_age 
from dbo.[SQL - Retail Sales Analysis_utf ]
where category = 'beauty'

--Q5 write a sql query to find all transactions where the total_sale is greater than 1000.
select * from dbo.[SQL - Retail Sales Analysis_utf ]
where total_sale > 1000

--Q6 write a sql query to find the total number of transaction (transaction_id) and by each gender in each category.
select category,gender,count(*) as total_trans
from dbo.[SQL - Retail Sales Analysis_utf ]
group by category,gender
order by 1

--Q7 write a sql query to calculate the average sale for each month.find out best selling month in each year
SELECT 
    YEAR(sale_date) AS sales_year, 
    MONTH(sale_date) AS sales_month, 
    AVG(total_sale) AS avg_sale
FROM dbo.[SQL - Retail Sales Analysis_utf]
GROUP BY 
    YEAR(sale_date), 
    MONTH(sale_date)
ORDER BY 
    YEAR(sale_date), 
    MONTH(sale_date);
--Q8  write a sql query to find the top 5 customer based on the highest total sales
select top 5 customer_id,sum(total_sale) as total_sales
from dbo.[SQL - Retail Sales Analysis_utf ] group by customer_id
order by total_sales desc 

--Q9 write a sql query to find the nu,ber of unique customer who purchase items from each category.
select category,count(distinct customer_id) from dbo.[SQL - Retail Sales Analysis_utf ]
group by category
--Q10 write a sql query to create each shift and number of order
with hourly_sale
as
(
select case when datepart(hour , sale_time) < 12 then 'morning' 
when datepart(hour , sale_time) between 12 and 17 then 'afternoon'
 else 'evening'
 end as shift,
 total_sale
 from dbo.[SQL - Retail Sales Analysis_utf ]
 )
 SELECT 
    shift,
    COUNT(*) AS sale_count,
    SUM(total_sale) AS total_sales
FROM hourly_sale
GROUP BY shift
ORDER BY shift

--- END OF PROJECT







