
-- BASICS
-- 1.Give me List of male employees living in London ?
select * from employees
where TitleOfCourtesy='Mr.' and City='London';

-- 2.Get me all employees information in following format with columnName ContactInfo
-- FirstName LastName can be reached at Extension
-- Nancy Davolio can be reached at 5467
select FirstName||' '||LastName||' can be reached at '||Extension as ContactInfo  from Employees;
--     firstname+" "+lastname+" can be reached at "+ Extension

-- 3.Get me all the CustomerID in lowercase letter and renamed as ID from the customers table.
select * from customers;
select lower(CustomerID) as ID from Customers;

-- 4.Give me List of customers  in Germany,France,Argentina ?
select * from Customers
where country in('France','Germany','Argentina');

-- 5.Get me all the even numbers employeeID from employeesTable
select * from Employees
where EmployeeID%2=0;

/*
if(number%2==0){
    even numbers
}

-- MySQL / ORACLE / Postgessql
select * from Employees
where mod(EmployeeID,2)=0;
 */


-- 6.Get me top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table
-- sorted by Freight in descending order.
select OrderID, OrderDate, ShippedDate, CustomerID, Freight from orders
order by Freight desc;

-- ORACLE
/*
select OrderID, OrderDate, ShippedDate, CustomerID, Freight from (select * from orders)                                                            order by Freight desc)
where rownum<11;
 */


-- MSSQL
/*
select top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from orders
order by Freight desc;
 */

-- OTHERS MYSQL POSTGRES SQLLITE
select OrderID, OrderDate, ShippedDate, CustomerID, Freight from orders
order by Freight desc
limit 10;

-- 7.Get me ten most expensive products
select ProductName,UnitPrice from products
order by UnitPrice desc
limit 10;


-- LIKE
-- 8.Get me all employees who know French
select * from employees
where notes like  '%French%';

/*
 % --> 0 or more letter
 _ --> 1 letter

 contains     '%French%'  -- CORRECT
 endswith     '%French'
 startswith   'French%'

 */


-- Group BY
-- 9.How many  customers  we have  in Germany,France,Argentina ?
select country,count(*) from Customers
where country in('France','Germany','Argentina')
group by country;


-- 10.How many sales did each of my employees make ?
select EmployeeID,count(*) from orders
group by EmployeeID;

select EmployeeID,count(EmployeeID) from orders
group by EmployeeID;

-- Count (All aggregate functions) --> will ignore null values



-- 11.Which of our personnel make more than 75 sales ?
select EmployeeID,count(OrderID) from Orders
group by EmployeeId
.
-- BASICS
-- 1.Give me List of male employees living in London ?
select * from employees
where TitleOfCourtesy='Mr.' and City='London';

-- 2.Get me all employees information in following format with columnName ContactInfo
-- FirstName LastName can be reached at Extension
-- Nancy Davolio can be reached at 5467
select FirstName||' '||LastName||' can be reached at '||Extension as ContactInfo  from Employees;
--     firstname+" "+lastname+" can be reached at "+ Extension

-- 3.Get me all the CustomerID in lowercase letter and renamed as ID from the customers table.
select * from customers;
select lower(CustomerID) as ID from Customers;

-- 4.Give me List of customers  in Germany,France,Argentina ?
select * from Customers
where country in('France','Germany','Argentina');

-- 5.Get me all the even numbers employeeID from employeesTable
select * from Employees
where EmployeeID%2=0;

/*
if(number%2==0){
    even numbers
}

-- MySQL / ORACLE / Postgessql
select * from Employees
where mod(EmployeeID,2)=0;
 */


-- 6.Get me top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table
-- sorted by Freight in descending order.
select OrderID, OrderDate, ShippedDate, CustomerID, Freight from orders
order by Freight desc;

-- ORACLE
/*
select OrderID, OrderDate, ShippedDate, CustomerID, Freight from (select * from orders)                                                            order by Freight desc)
where rownum<11;
 */


-- MSSQL
/*
select top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from orders
order by Freight desc;
 */

-- OTHERS MYSQL POSTGRES SQLLITE
select OrderID, OrderDate, ShippedDate, CustomerID, Freight from orders
order by Freight desc
limit 10;

-- 7.Get me ten most expensive products
select ProductName,UnitPrice from products
order by UnitPrice desc
limit 10;


-- LIKE
-- 8.Get me all employees who know French
select * from employees
where notes like  '%French%';

/*
 % --> 0 or more letter
 _ --> 1 letter

 contains     '%French%'  -- CORRECT
 endswith     '%French'
 startswith   'French%'

 */


-- Group BY
-- 9.How many  customers  we have  in Germany,France,Argentina ?
select country,count(*) from Customers
where country in('France','Germany','Argentina')
group by country;


-- 10.How many sales did each of my employees make ?
select EmployeeID,count(*) from orders
group by EmployeeID;

select EmployeeID,count(EmployeeID) from orders
group by EmployeeID;

-- Count (All aggregate functions) --> will ignore null values



-- 11.Which of our personnel make more than 75 sales ?
select EmployeeID,count(OrderID) from Orders
group by EmployeeId
having count(OrderID) > 75;
-- JOIN
/*
 12.Transported to France by a cargo company called United Package
and the sales for which we paid more than 35 dollars for shipping were made by which personnel at what time?
 */

 select FirstName,LastName,Freight,CompanyName,ShipCountry from Shippers s
     inner join orders o on s.ShipperID = o.ShipVia
     inner join employees e on e.EmployeeID=o.EmployeeID
where ShipCountry='France' and Freight>35 and CompanyName='United Package';


select EmployeeID,FirstName,LastName,ReportsTo from Employees;

select Workers.FirstName,Workers.LastName,Workers.ReportsTo,Manager.EmployeeID,Manager.FirstName,Manager.LastName
       from Employees Workers inner join Employees Manager on Workers.ReportsTo=Manager.EmployeeID;

select Workers.FirstName,Workers.LastName,Workers.ReportsTo,Manager.EmployeeID,Manager.FirstName,Manager.LastName
from Employees Workers left join Employees Manager on Workers.ReportsTo=Manager.EmployeeID;


-- 13.From which supplier companies did we purchase products with
-- a unit price of more than 20 in the Beverages category?
select CategoryName,UnitPrice,CompanyName from products p
                                                   inner join categories c on p.CategoryID = c.CategoryID
                                                   inner join suppliers s on p.SupplierID = s.SupplierID
where UnitPrice>20 and CategoryName='Beverages';
-- 14.Get me  customers  we have never sold to before
select
    c.CustomerID,c.CompanyName,o.OrderID
from
    Customers c left join Orders o on o.CustomerID = c.CustomerID
where o.OrderID is null;
-- SELF JOIN
-- 15.Get me all employees and their managers
--SET OPS
-- 16.Get me all customers and employees phone numbers
select FirstName||' '||LastName as FullName, HomePhone as Phone, 'Personel' as Type from Employees
union
select ContactName,Phone,'Customer'  from Customers;

-- 17.Get me all suppliers and customers city,companyName,ContactName
select City, CompanyName, ContactName, 'Customers' as Relationship
from Customers
union
select City, CompanyName, ContactName, 'Suppliers'
from Suppliers
