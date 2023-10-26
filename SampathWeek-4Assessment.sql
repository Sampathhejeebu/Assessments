
--  First step is to Create the new database so that it is easy to store and access information
Create Database SampathAssessmentDB;
Go

-- Now I use to switch the current database context to "SampathAssessmentDB"
use SampathAssessmentDB;
Go

--Now we need to invoke the AdventureWorks database with the SampathAssessmentDB which allows us to access tables and data within the AdventureWorks database
USE AdventureWorks2022;
GO

--Problem 1: List Product Names and Prices
--Write a query to retrieve the names and list prices of all products in the "Production.Product" table.


Select
    Name AS 'Product Name',-- we are accessing "Name" column from ""Production.Product" table and displayed as alias it as "Product Name" in the result table.. 
    ListPrice AS 'Product Price'--we are selecting "ListPrice" column from ""Production.Product" table and displayed as alias it as "Product Price" in the result table.. 
	-- AS is Aliases are used to provide more descriptive or user-friendly names for the columns in the result set.it renames the 'Name' as "Product Name" and 'List price' as "Product Price"...
From
    Production.Product;
	Go
-- After executing this query it will show the product names and their corresponding list prices from the "Production.Product" table...

--Problem 2: Find Customers from a Specific City
--Retrieve the names and email addresses of customers who live in the city of "Seattle" from the "Sales.Customer" table.
 
Select 
    p.FirstName, -- p acts as aliases for the table Person.Person whichh is used to used to reference specific columns....
    p.LastName,
    e.EmailAddress, -- simillary 'e' is aliases for Person.EmailAddress table...
    a.City --- simillary 'a' is aliases for Person.Adress table...
Into NewCustomerTable -- the result should be stored in NewCustomerTable...
From
    Person.Person p
JOIN 
    Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID 
	--This joins the Person.Person table with the Person.EmailAddress table based on the BusinessEntityID column....
JOIN 
    Person.Address a ON p.BusinessEntityID = a.AddressID
	--This joins the Person.Person table with the Person.Address table based on the BusinessEntityID and AddressID columns....
JOIN
    Sales.Customer c ON p.BusinessEntityID = c.PersonID;
	--This joins the Person.Person table with the Sales.Customer table based on the BusinessEntityID and PersonID columns....

-- Now we are execute the data y using select statement...
select firstname,
       lastname,
	   EmailAddress,
	   City 
 from NewCustomerTable where city='seattle';
 go
 --As a result While we execute the above queries we will get the combined data what we want from the "Sales.Customer" table.

--Problem 3: Calculate Total Sales for a Product
--Calculate the total sales amount for the product with the ProductID of 793 from the"Sales.SalesOrderDetail" and "Production.Product" tables. Display the product name and total sales amount...

Select
   p.Name AS ProductName,
   --  Here we are Rename the "Name" column from the "Production.Product" table  as "ProductName".
   SUM(sod.OrderQty * sod.UnitPrice) AS TotalSalesAmount
   --First we are calculating the total sales amount for the product by summing the product of "OrderQty" and "UnitPrice" columns in the "Sales.SalesOrderDetail" table and we are aliased that result as "TotalSalesAmount"...
From
   Production.Product p
JOIN 
   Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
Where  
   p.ProductID = 793
   -- The WHERE clause is used to filters rows where the ProductID is equal to 793:
Group BY
   p.Name;
   --groups the results by the "Name" column, which represents the product name.
   go

--Problem 4: List Employees by Job Title
--List the names and job titles of employees from the "HumanResources.Employee" table, ordered by job title in ascending order.

Select
    p.LastName AS LastName, -- p acts as aliases for the table Person.Person whichh is used to used to reference specific columns....
    p.FirstName AS FirstName,
    e.JobTitle -- Simillarly e acts  aliases as HumanResources.Employee table.....
From 
    HumanResources.Employee e	
JOIN 
    Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
	--This Joins employee data from the "HumanResources.Employee" table to corresponding personal data in the "Person.Person" table...
Order By
    e.JobTitle ASC;
	-- Based on the "JobTitle" column from the "HumanResources.Employee" table we are arrerange the result in Assesscending order...
	Go

--Problem 5: Find Order Details for a Customer
--Retrieve all the order details (product names and quantities) for a specific customer with a CustomerID of 29485 from the "Sales.SalesOrderHeader," "Sales.SalesOrderDetail," and "Production.Product" tables.

Select 
    p.Name AS ProductName,-- we are selecting name coloum form the "Production.Product" table and we are displaying the result name as "productName" by aliasing...
	sod.OrderQty -- we are selecting OrderQuality colouum from the "Sales.SalesOrderDetail" table....	
From 
    Sales.SalesOrderHeader soh
Join
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
	--This joins sales order header data to sales order detail data based on the "SalesOrderID" column.
Join 
    Production.Product p ON sod.ProductID = p.ProductID
	--This joins sales order detail data to product data based on the "ProductID" column.
Where 
    -- Filttering with customer id having 29485 from the table.
    soh.CustomerID = 29485;
	Go


--Problem 6: Find Orders Placed by a Salesperson
--Find all the orders placed by a salesperson with an EmployeeID of 276 from the "Sales.SalesOrderHeader" and "HumanResources.Employee" tables. Display the order number, order date, and customer name.

Select
    soh.SalesOrderID AS OrderNumber,-- we are getting SalesOrderID data from the table "Sales.SalesOrderHeader" and displayed it result as by alias "OrderName" as resulttable..
    soh.OrderDate, -- We are getting OrderDate data from the table "Sales.SalesOrderHeader" table...
    pe.firstname,-- we are getting FirstName Data from the table "Person.Person" table...
	pe.lastname -- We are getting LastName data from the table "Person.Person" table..
From
    Sales.SalesOrderHeader soh --This table contains information about sales orders that including "SalesOrderID," "OrderDate," and "SalesPersonID."
Join
    person.person pe on pe.BusinessEntityID= soh.SalesPersonID
	-- This Join sales order data to the corresponding salesperson based on their BusinessEntityID and SalesPersonID...
Where
   -- we are filtering that sales orders associated with SalesPersonID 276:
   SalesPersonID = 276;
   Go
   
--  After execute the query result table including the order number, order date, first name, and last name of the salesperson for all the sales orders placed by the salesperson with SalesPersonID 276...


--Problem 7: Identify Inactive Customers
--List the names and email addresses of customers who have not placed any orders in the "Sales.SalesOrderHeader" table...

Select
    p.FirstName AS CustomersFirstName, --We are getting the data of "FirstName" column from the "Person.Person" table and displaying alias as "CustomersFirstName" in the result tables.
    p.LastName AS CustomersLastName,-- We are getting the data of "LastName" column from the "Person.Person" table and displaying alias as "CustomersLastName" in the result tables.
    e.EmailAddress AS Email -- We are getting the data of "Email Adress" column from the "Person.EmailAdress" table and displaying alias as "CustomersEmailAdress" in the result tables.
From
    Person.Person p -- In this Person.Person p table we have total information inclusing first name ,last name...
Join
    Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
	--This joins the "Person.Person" and "Person.EmailAddress" tables based on the "BusinessEntityID" column and joining customer information with email addresses.
Left join
    Sales.SalesOrderHeader soh ON p.BusinessEntityID = soh.CustomerID
	--Here we are performing LEFT JOIN between the "Person.Person" table and the "Sales.SalesOrderHeader" table are linking customer information to sales orders based on the "BusinessEntityID" and "CustomerID" columns.
Where
    soh.SalesOrderID is null; 
	-- We are filtering customers who have not placed any orders...

--After Execute this query it retrieves customer names and email addresses, joining customer data with email addresses and identifying customers who have not placed any orders...


--Problem 8: Calculate Average Sales per Category
--Calculate the average sales amount for each product category from the "Production.ProductCategory" and "Sales.SalesOrderDetail" tables. Display the category name and average sales amount.


Select
    Production.ProductCategory.Name AS ProductCategoryName, --  We are accessing data "Name" data from the "Production.ProductCategory" table and displaying that data as "ProductCatogaryName" in result table..
    Avg(Sales.SalesOrderDetail.OrderQty * Sales.SalesOrderDetail.UnitPrice) AS AverageSalesAmount
	--we are calculateing the average sales amount for each product category by taking the average of the product of "OrderQty" and "UnitPrice" columns from the "Sales.SalesOrderDetail" table. And displaying as "AverageSalesAmount" in the result table...
From 
    Production.ProductCategory
Join
    Production.ProductSubcategory ON Production.ProductCategory.ProductCategoryID = Production.ProductSubcategory.ProductCategoryID
	--This joins the "Production.ProductCategory" table with the "Production.ProductSubcategory" table based on the "ProductCategoryID" column which joins product categories to subcategories.
Join
    Production.Product ON Production.ProductSubcategory.ProductSubcategoryID = Production.Product.ProductSubcategoryID
	-- This joins the "Production.ProductSubcategory" table with the "Production.Product" table based on the "ProductSubcategoryID" column which joins subcategories to products.
Join
    Sales.SalesOrderDetail ON Production.Product.ProductID = Sales.SalesOrderDetail.ProductID
	-- This joins the "Production.Product" table with the "Sales.SalesOrderDetail" table based on the "ProductID" column joins products to sales order details.
Group by
    Production.ProductCategory.Name;
	Go
	-- This groups the data by category name so that the average sales amount can be calculated for each product category separately.

-- After executeing query the esult table include the category name and the average sales amount for each product category and each row in the result set represents a different product category.


--Problem 9: Find Top-Selling Products
--List the top 10 best-selling products (by quantity sold) from the "Production.Product" and "Sales.SalesOrderDetail" tables. Display the product name and total quantity sold.
 
  Select top 10 -- Select only first 10
    p.Name AS ProductName, --Here we are accessing the "Name" coloum from "Production.Product"table and displayed that data as "ProductName" in result table...
    SUM(sod.OrderQty) AS TotalQuantitySold
	-- We are calculating the total quantity sold for each product by summing the "OrderQty" column from the "Sales.SalesOrderDetail" table and displayed as "TotalQuantitySold" in the result table...
From
    Production.Product p
Join
    Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
	-- This joins the product data to sales order detail data based on the "ProductID" column.
Group by 
    p.Name
	-- This groups the data by product name...
Order  by 
    TotalQuantitySold Desc;
	--  the order will be in Decending order
Go

-- After execute this query we uses top 10 to limit the result set to only the top 10 products with the highest total quantity sold...


--Problem 10: Identify Late Shipments
--Retrieve the order numbers and ship dates of orders that were shipped after their requested ship dates from the "Sales.SalesOrderHeader" table...

select * from Sales.SalesOrderHeader;
select 
	salesorderid,
	orderdate,
	shipdate -- we are accessing salesorderid, orderdate, shipdate coloum data from "Sales.SalesOrderHeader" table...
from 
    sales.SalesOrderHeader 
where 
	shipdate < duedate;-- We are filtering data that rows where the "shipdate" is less than the "duedate."..

-- After execute this query result include sales orders that meet the condition of having a "shipdate" earlier than the "duedate." The result set will contain the selected columns for these specific sales orders...

