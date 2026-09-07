select * from sales_data;
select sum(Sales) as Total_Sales,sum(Profit) as Total_Profit from sales_data;
select 
 Category,sum(Sales) as total_sales 
 from sales_data 
 group by Category
 order by total_sales desc;
select Region,sum(Sales) as total_sales 
from sales_data group by Region 
order by total_sales desc;
select month(str_to_date(`Order Date`,'%m/%d/%y')) as month_number,
monthname(str_to_date(`Order Date`,'%m/%d/%y')) as month_name,
sum(Sales) as total_sales from sales_data 
group by month(str_to_date(`Order Date`,'%m/%d/%y')),
 monthname(str_to_date(`Order Date`,'%m/%d/%y')) order by month_number;
 select Product,sum(Sales) as total_sales from sales_data
 group by Product order by total_sales desc limit 10;
 select Category,Region, sum(sales) as total_sales from sales_data
 group by Region,Category
 order by Region,total_sales desc;
 select Category, sum(profit) as total_profit from sales_data
 group by Category order by total_profit desc;
 select Region,sum(profit) as total_profit from sales_data
 group  by Region order by total_profit desc;
 select Category,sum(sales) as total_sales,
 sum(profit) as total_profit,
 round((sum(profit)/sum(sales))*100,2) as profit_margin_percent
 from sales_data group by Category order by profit_margin_percent desc;
 select Category,round((sum(profit)/sum(sales))*100,2)as profit_margin_percent
 from sales_data group by Category 
 order by profit_margin_percent desc;
 select Sales,case
 when sales>=1000 then 'high'
 when sales>=500 then 'medium' else 'low'
 end as sales_category
 from sales_data limit 10;
 select s.Product,s.Category,s.sales,c.Category_total_sales
 from sales_data as s
 join(
 select Category,sum(Sales) as category_total_sales
 from sales_data
 group by Category) as c on s.category=c.Category
 limit 10;
 select s.Product,s.Category,s.sales,c.Category_total_sales
 from sales_data as s
 left join(
 select Category,sum(Sales) as category_total_sales
 from sales_data
 group by Category) as c on s.category=c.Category
 limit 10;
 select category,sum(sales) as total_sales from sales_data
 group by Category
 having sum(sales)>100000
 order by total_sales desc;
 select product,sales from sales_data 
 where sales>(select avg(sales) from sales_data)
 order by Sales desc;
 select* from sales_data where Region='west';
 
 
 
 
 
 
 
 
 
