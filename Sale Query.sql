select * 
from aeoniancentral..sales


-- 1-5 row id

--clean, row id
select distinct [row id],count([row id]) lala
from AeonianCentral..sales
group by [row id]
order by lala desc


select count([row id]) lala, [row id]
from AeonianCentral..sales
group by [row id]

--no use, order id
select distinct [order id],count([order id]) lala
from AeonianCentral..sales
group by [order id]
order by lala desc

--clean, order date
select distinct [ id],count([row id]) lala
from AeonianCentral..sales
group by [row id]
order by lala desc

-- clean, order priority
select distinct [Order Priority],count([Order Priority]) lala
from AeonianCentral..sales
group by [Order Priority]
order by lala desc

--clean, order quantity
select distinct [Order Quantity],count([Order Quantity]) lala
from AeonianCentral..sales
group by [Order Quantity]
order by lala desc

-- finish 

--checkpoint

select * 
from AeonianCentral..Sales
 
-- 6-10 ,sales
  
--clean, sales

select distinct [sales],count([sales]) lala
from AeonianCentral..sales
group by [sales]
order by lala desc

--clean, discount
select distinct [discount],count([discount]) lala
from AeonianCentral..sales
group by [discount]
order by lala desc

--clean, ship mode
select distinct [ship mode],count([ship mode]) lala
from AeonianCentral..sales
group by [ship mode]
order by lala desc

--clean, profit
select distinct [profit],count([profit]) lala
from AeonianCentral..sales
group by [profit]
order by lala desc

-- clean, unit price
select distinct [Unit Price],count([Unit Price]) lala
from AeonianCentral..sales
group by [Unit Price]
order by lala desc


--finish

select * 
from AeonianCentral..Sales
--checkpoint

--11-15 shipping cost

--clean, shipping cost
select distinct [shipping cost] ,count([shipping cost]) lala
from AeonianCentral..sales
group by [shipping cost]
order by lala desc

--clean,customer name
select distinct [customer name],count([customer name]) lala
from AeonianCentral..sales
group by [customer name]
order by lala desc

--clean, province
select distinct [province],count([province]) lala
from AeonianCentral..sales
group by [province]
order by lala desc

--clean, region
select distinct [Region],count([Region]) lala
from AeonianCentral..sales
group by [Region]
order by lala desc

--clean, customer segment
select distinct [Customer Segment],count([Customer Segment]) lala
from AeonianCentral..sales
group by [Customer Segment]
order by lala desc


--finish

--checkpoint

select * 
from AeonianCentral..sales
--16-21, product category

--clean, product category
select distinct [Product Category],count([Product Category]) lala
from AeonianCentral..sales
group by [Product Category]
order by lala desc

--clean, product sub-category
select distinct [product sub-category],count([product sub-category]) lala
from AeonianCentral..sales
group by [product sub-category]
order by lala desc

--clean, product name
select distinct [product name],count([product name]) lala
from AeonianCentral..sales
group by [product name]
order by lala desc


-- clean, product container
select distinct [product container],count([product container]) lala
from AeonianCentral..sales
group by [product container]
order by lala desc

-- null, product base margin
select distinct [product base margin],count([product base margin]) lala
from AeonianCentral..sales
group by [product base margin]
order by lala desc

-- no use , ship date
select distinct [Customer Segment],count([Customer Segment]) lala
from AeonianCentral..sales
group by [Customer Segment]
order by lala desc



--checkpoint
select *
from AeonianCentral..sales


--descriptive analysis
--what happens?
 
--2. order quantity 1
--3.ship mode 1
--4.most buyed , customer name 1
--5.which province 1
--6.which region  1
--8.product category 1
--9.sub category 1
--10.popular products 1
--11.most used product container 1
--7 .order date to ship date , approximate delivery date 1



--2,good , bad
-- total sold to segment , avg sold
select sum([Order Quantity])as [Total Sold],[Customer Segment], avg([order quantity]) as [AVG Order Quantity]
from AeonianCentral..sales
group by [Customer Segment]
order by 1 desc


--3 good
select distinct [Ship mode],count([ship mode]) [Total Deals]
from AeonianCentral..sales
group by [ship mode]
order by  [Total Deals] desc

--4 good
select  distinct[Customer Name]Customers ,count([customer name]) Deals, sum(sales) Revenue
from aeoniancentral..sales
group by [Customer Name]
order by 3 desc


--5 good
select distinct [Province],count([province]) [Total Order]
from AeonianCentral..sales
group by [province]
order by 2 desc


--checkpoint
select *
from AeonianCentral..sales

--6, good
select distinct [Region],count([Region]) [Total Order]
from AeonianCentral..sales
group by [Region]
order by 2 desc

--7,good, product category
select distinct [Product category], count([product category]) [Total Order],sum([order quantity])[Ordered Quantity], sum(sales) Revenue
from AeonianCentral..sales
group by [Product Category]
order by 2 desc

--8,Good, Product Sub Category, Totalorder,
select distinct [Product Sub-Category],count([product sub-category]) [Total Order], sum([order quantity])[Ordered Quantity]
, sum(sales) Revenue
from AeonianCentral..Sales
group by [Product Sub-Category]
order by 4 desc

--9, good. Product Most Revenue,Ordered
select distinct [Product name] Products,sum([Order Quantity]) [Ordered Quantity], sum(sales) Revenue
from AeonianCentral..sales
group by [product name]
order by 2 desc

--10, good
select Distinct [Product container] , count ([product container])as [Most Used]
from AeonianCentral..sales
group by [Product Container]
order by 2 desc

--11
select * from AeonianCentral..sales

alter table aeoniancentral..sales
add shipdate date

update AeonianCentral..sales
set shipdate = convert(date,[ship date])


select DATEDIFF(day,orderdate, shipdate),[Order Date],[Ship Date]
from AeonianCentral..sales
 
alter table aeoniancentral..sales
add diff int

update AeonianCentral..sales
set diff = DATEDIFF(day,orderdate, shipdate)


select *
from AeonianCentral..sales
order by diff desc

select distinct[order priority] [Order Category], avg(diff) as [Avg Delivery Time] ,count([order priority]) As [Ordered Category]
from AeonianCentral..sales
group by [Order Priority]
order by 2 desc


-- total 10