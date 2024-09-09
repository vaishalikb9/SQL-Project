create database onlineretailstore;
use onlineretailstore;

create table customers(
CustomerID int primary key,
Name varchar(50),
Email varchar(50),
RegistrationDate Date );


create table products (
	ProductID int primary key,
	ProductName varchar(255),
	Price Decimal (10, 2),
    CategoryID int ,
	foreign key (CategoryID) references Categories(CategoryID)); 
    
create table Categories(
	CategoryID int primary key,
    CategoryName varchar(255));
    
create table Orders(
OrderId int primary key,
CustomerID int, 
OrderDate date,
TotalAmount Decimal(10, 2),
FOREIGN key (CustomerID) references Customers(CustomerID)
);    
    
select * from Orders;   

create table  OrderDetails(
	OrderDetailID int primary key,
	OrderId int,
	ProductID int,
	Quantity int,
	Price Decimal (10 ,2),
    foreign key (OrderID) references Orders(OrderID),
	foreign key (ProductID) references Products(ProductID)
    );
    
show tables;

Insert into customers (CustomerID, Name, Email, RegistrationDate)
		values
        (101, 'Maitri', 'maitri_r@online.com', '2023-09-27'),
        (105, 'Diana', 'diana_r@online.com', '2023-08-12'),
        (102, 'Sushil', 'sudhil_a@online.com', '2023-08-17'),
        (111, 'Marry', 'marry_a@online.com', '2023-03-23'),
        (122, 'Vacky', 'vacky_r@online.com', '2023-01-05'),
        (123, 'Chandu', 'chandu_r@online.com', '2024-02-13'),
        (145, 'allen', 'allen_r@online.com', '2024-02-26'),
        (137, 'Rahul', 'Rahul_r@online.com', '2023-08-06'),
        (187, 'Kiara', 'kiara_a@online.com', '2023-08-17'),
        (164, 'Veera', 'veera_r@online.com', '2023-07-12');

 show tables; 
 select * from customers;
 
 insert into Categories (CategoryID, CategoryName)
 values
	(1, 'Electronics'),
    (2, 'Books'),
    (3, 'Clothing'),
    (4, 'Home & Kitchen'),
    (5, 'Beauty & Personal Care'),
    (6, 'Sports & Outdoors'),
    (7, 'Automotive'),
    (8, 'Toys & Games'),
    (9, 'Health & Wellness'),
    (10, 'Pet Supplies');
    
   select * from categories;
 
 insert into products (ProductID, ProductName, Price, CategoryID)
 values 
    (1, 'Bluetooth Headphones', 49.99, 1),
    (2, 'Mystery Novel', 14.50, 2),
    (3, 'Science Fiction Book', 22.75, 2),
    (4, 'Women''s Jeans', 29.99, 3),
    (5, 'Face Moisturizer', 15.50, 5),
    (6, 'Smartphone', 699.99, 1),
    (7, 'LED Monitor', 149.99, 1),
    (8, 'Vacuum Cleaner', 129.99, 4),
    (9, 'Mountain Bike', 499.99, 6),
    (10, 'Car Tires Set', 350.00, 7);
    
    select * from products;
    
insert into Orders (OrderId, CustomerID, OrderDate, TotalAmount)
		values
    (1, 101, '2024-01-15', 250.00),
    (2, 105, '2024-02-20', 180.75),
    (3, 102, '2024-03-05', 320.40),
    (4, 111, '2024-04-10', 150.00),
    (5, 122, '2024-05-25', 275.90),
    (6, 123, '2024-06-12', 210.30),
    (7, 145, '2024-07-18', 299.99),
    (8, 137, '2024-08-25', 135.60),
    (9, 187, '2023-09-30', 425.00),
    (10, 164, '2023-10-15', 189.45);

 select * from Orders;
 
 use onlineretailstore;
 
 insert into Orderdetails (OrderdetailID, OrderID, ProductID, Quantity, Price)
	values
		  (11,1,9,1,499.99),
          (12,2,7,2,149.99),
          (13,3,6,1,650),
          (14,4,2,1,45),
          (15,5,3,2,14.50),
          (16,6,4,1,22.75),
          (17,7,6,1,29.99),
          (18,8,10,4,330),
          (19,9,8,1,120),
          (20,10,5,3,15.50);
		
 desc orderdetails;

select * from orderdetails;

select * from products;
show tables;


-- 	Write a query to select all details from the Orders table where the TotalAmount is greater than $100.
select TotalAmount
from orders 
where TotalAmount > 100;

-- 	Where Clause (AND/OR):
-- Write a query to select all products from the Products table where the Price is between $20 and $50 and the CategoryID is 3.
select Price
from Products
where Price between 20 and 50
and categoryID = 3 ;

-- LIKE Operator:
-- Write a query to select all customers whose Name starts with 'A'.

select Name 
from customers
where Name like 'a%' ;

use onlineretailstore;
--	CASE Statement:
-- 	Write a query to select ProductName and a new column DiscountedPrice from the Products table. If Price is greater than $50, 
-- set DiscountedPrice to Price * 0.9, otherwise set it to Price.
SELECT 
    ProductName,
    CASE 
        WHEN Price > 50 THEN Price * 0.9
        ELSE Price
    END AS DiscountedPrice
FROM 
    Products;
    
-- 	Subquery:
--	Write a query to find all customers who have placed orders totaling more than $300. Use a subquery to find these CustomerIDs.
select Name
        from Customers
        where CustomerID in  (select CustomerID
								from Orders
                                group by CustomerID 
                                having sum(TotalAmount) > 300);
-- 	Group By:
--	Write a query to get the total number of orders placed by each customer. Group the results by CustomerID and show the count of orders.
select 
	CustomerID,
    count(OrderID) as Ordercount
from 
	Orders 
group by
	CustomerID;
    
--	Having Clause:
--	Write a query to get the total TotalAmount of orders placed by each customer, but only include customers who have placed more than 1 orders. Use the HAVING clause.
select 
	CustomerID,
    sum(TotalAmount) as TotalOrderAmount,
    COUNT(OrderID) AS OrderCount
from 
	Orders
group by
    CustomerID
having	
    count(orderID) > 1;

--	Limit:
--	Write a query to select the first 5 products ordered by ProductName in ascending order.
select
	ProductID,
    ProductName,
    Price 
from 
	Products
order by
	ProductName asc
Limit 5;

-- 	Inner Join:
--	Write a query to join Orders with Customers to get a list of all orders with CustomerName and OrderDate.
select
	o.OrderID,
    c.Name,
    o.OrderDate,
    o.TotalAmount
From 
	Orders o
Inner join
	Customers c on o.CustomerID = c.CustomerID
order by
	o.OrderDate;
    
--	Outer Join:
--	Write a query to get a list of all products and any associated order details. Include products that might not have been ordered.
use onlineretailstore;
SELECT 
    p.productid,
    p.productname,
    p.price,
    od.orderid,
    od.quantity
FROM 
    products p
LEFT JOIN 
    orderdetails od
ON 
    p.productid = od.productid
ORDER BY
    p.productid;
    
-- Join with Aggregation:
--	Write a query to get the total quantity of each product sold. Use an INNER JOIN between OrderDetails and Products, and group by ProductID.

SELECT 
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM 
    OrderDetails od
INNER JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductID,
    p.ProductName
ORDER BY
    TotalQuantitySold DESC;

--	Subquery with Join:
--	Write a query to find all products that were ordered more than the average quantity of all products. Use a subquery in the WHERE clause.
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM 
    OrderDetails od
INNER JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductID,
    p.ProductName
HAVING 
    SUM(od.Quantity) > (
        SELECT 
            AVG(TotalQuantity)
        FROM 
            (SELECT 
                SUM(Quantity) AS TotalQuantity
             FROM 
                OrderDetails
             GROUP BY 
                ProductID) AS SubQuery
    )
ORDER BY 
    TotalQuantitySold DESC;


use onlineretailstore;
--	Write a query to find all products that were ordered more than the average quantity of all products. Use a subquery in the WHERE clause.
SELECT
    c.Name,
    o.OrderDate,
    p.ProductName
FROM
    Orders o
    INNER JOIN Customers c ON o.CustomerID = c.CustomerID
    LEFT JOIN OrderDetails od ON o.OrderID = od.OrderID
    LEFT JOIN Products p ON od.ProductID = p.ProductID;






                                
                                
    
    


