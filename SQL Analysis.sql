--Find the top 5 salesmen based on total revenue generated.
select * from(select salesmanbk, concat(fname,' ',lname) as 'Salesperson name', sum(totalprice) as 'Total sales'
,ROW_NUMBER() over (order by sum(totalprice) desc ) as 'Rank'
from DimSaleMan s join Fact_sales f
on s.SalesManSK = f.salesmanID_FK
group by salesmanbk, concat(fname,' ',lname)) sales
where Rank <= 5

--Analyze total sales quantity and revenue by Month and Year.
select Monthname, year, sum(quantity) as 'Total quantity', sum(totalprice) as 'Total sales'
from DimDate d join Fact_sales s
on d.DateSK = s.orderdate_FK
group by Monthname, year

--Which Gender spends more on average per order?
select gendername, sum(totalprice) / count(distinct orderid_bk) as 'Average spendings per order'
from DimCustomer c join Fact_sales s
on c.CustomerSK = s.customerID_FK
group by gendername

--List all Product Categories and their total revenue, but only for products that are currently active
select categoryname, sum(totalprice) as 'Total revenue'
from DimProduct p join Fact_sales s
on p.ProductSK = s.productID_FK
group by categoryname

--Identify which hour of the day sees the highest volume of sales.
select top 1 hour , sum(totalprice) as 'Total sales'
from DimTime t join Fact_sales s
on t.TimeSK = s.ordertime_FK
group by hour