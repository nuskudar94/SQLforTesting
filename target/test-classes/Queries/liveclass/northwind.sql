select * from employees;
-- BASICS
-- 1.Give me List of male employees living in London ?
select * from "Employees"
where TitleOfCourtesy ="Mr." and City = "London" ;
-- 2.Get me all employees information in following format with columnName ContactInfo
-- FirstName LastName can be reached at Extension
-- Nancy Davolio can be reached at 5467
select FirstName||' '||LastName||' can be reached at '||Extension as ContactInfo from "Employees";
-- 3.Get me all the CustomerID in lowercase letter and renamed as ID from the customers table.
select lower("CustomerID") as ID from "Customers";

-- 4.Give me List of customers  in Germany,France,Argentina ?
select * from "Customers"
where "Country" in ("Germany","France","Argentina");
-- 5.Get me all the even numbers employeeID from employeesTable
--Sqlite
select * from "Employees"
where "EmployeeID"%2=0 ;
--mysql oracle post
-- mod(EmployeeID,2)=0
-- 6.Get me  top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order.
select OrderID,OrderDate,ShippedDate,CustomerID,Freight from "Orders"
order by "Freight" desc
limit 10;
-- 7.Get me ten most expensive products
select "ProductName", unitprice from "Products"
order by "UnitPrice" desc
limit 10;
-- LIKE
-- 8.Get me all employees who know French
select * from "Employees"
where "Notes"  like '%French%';

-- Group BY
-- 9.How many  customers  we have  in Germany,France,Argentina ?
select country,count(*) from "Customers"
where "Country" in ("Germany","France","Argentina")
group by "Country";
-- 10.How many sales did each of my employees make ?
select EmployeeID,count("OrderID") from "Orders"
group by "EmployeeID";

-- 11.Which of our personnel make more than 75 sales ?

-- JOIN
/*
 12.Transported to France by a cargo company called United Package
and the sales for which we paid more than 35 dollars for shipping were made by which personnel at what time?
 */
select "FirstName","LastName","ShippedDate",  "Freight", CompanyName, ShipCountry
from Shippers s
inner join orders o on s."ShipperID" = o."ShipVia"
inner join "Employees" e on s."ShipperID" = e."EmployeeID"
where "ShipCountry"='France' and "Freight">35 and "CompanyName"='United Package';



-- 13.From which supplier companies did we purchase products with
-- a unit price of more than 20 in the Beverages category?

-- 14.Get me  customers  we have never sold to before
-- SELF JOIN
-- 15.Get me all employees and their managers
select EmployeeID,FirstName,LastName,ReportsTo,Title from Employees;
select "ReportsTo" from "Employees";
SELECT Workers.FirstName, Workers.LastName , Workers.ReportsTo, Manager.EmployeeID , Manager.FirstName , Manager.LastName
FROM Employees Workers INNER JOIN Employees Manager on Workers.ReportsTo = Manager.EmployeeID;
--SET OPS
-- 16.Get me all customers and employees phone numbers
-- 17.Get me all suppliers and customers city,companyName,ContactName





