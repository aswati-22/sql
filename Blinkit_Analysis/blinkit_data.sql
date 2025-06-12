create database blinkitdb
create table blinkit_data (
Item_Fat_Content varchar(20),	
Item_Identifier varchar(10),
Item_Type  varchar(50),
Outlet_Establishment_Year INT,
Outlet_Identifier varchar(10),
Outlet_Location_Type varchar(20),
Outlet_Size	 varchar(10),
Outlet_Type	 varchar(20),
Item_Visibility	float,
Item_Weight	FLOAT,
Total_Sales FLOAT,
Rating FLOAT
);
SELECT * FROM blinkit_data

COPY blinkit_data
 FROM 'D:\BlinkIT_Grocery.csv'
 DELIMITER ',' 
 CSV HEADER;

select  count(*) from blinkit_data
SELECT * FROM blinkit_data

update blinkit_data
set item_fat_content =
case 
when item_fat_content in ('LF','low fat') then 'Low Fat'
when item_fat_content = 'reg' then 'Regular'
else item_fat_content
End

select Distinct item_fat_content from blinkit_data
select cast(sum(Total_sales)/1000000 as decimal(10,2))as total_sales_Millions from blinkit_data

select cast(avg(Total_sales) as decimal(10,0)) as Avg_sales from blinkit_data 

select count(*)as total_no_of_items from blinkit_data

SELECT * FROM blinkit_data

SELECT cast(sum(Total_Sales)/100000 as decimal(10,2)) FROM blinkit_data
where item_fat_content = 'Low Fat'

SELECT cast(sum(Total_Sales)/100000 as decimal(10,2))FROM blinkit_data
where Outlet_Establishment_Year =2022

SELECT cast(avg(Total_Sales)as decimal(10,2))FROM blinkit_data
where Outlet_Establishment_Year =2022

select cast(avg(rating)as decimal(10,0))from blinkit_data

Select item_fat_content ,cast(avg(total_sales)as decimal(10,0))as avg_sales, 
cast (Sum(total_sales)as decimal(10,2)) as Total_sales from blinkit_data

group by item_fat_content order by Total_sales desc


select * from blinkit_data

select outlet_location_type ,item_type,
         Cast(sum(total_sales)as decimal(10,2))as Total_Sales,
		 Cast(avg(total_sales)as decimal (10,2)) as avg_sales,
		 count(*) as no_of_items,
		 cast(avg(rating)as decimal(10,2))as_rating
 from blinkit_data
 group by item_type ,outlet_location_type 
 order by total_sales asc
 limit 5


