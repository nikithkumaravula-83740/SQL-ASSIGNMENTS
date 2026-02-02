create database sqljoins;
use sqljoins;

create table customers(CustomerID int, CustomerName varchar(30), City varchar(30));

insert into customers(CustomerID, CustomerName, City)
values
(1, 'John Smith', 'New York'),
(2,'Mary Johnson', 'Chicago'),
(3,'Peter Adams', 'Los Angeles'),
(4,'Nancy Miller', 'Houston'),
(5,'Robert White', 'Miami');

select * from customers;

create table orders(OrderID int, CustomerID int, OrderDate date, Amount int);

insert into orders(OrderID, CustomerID, OrderDate, Amount)
values
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);
select  distinct * from orders;

create table payments(PaymentID varchar(30), CustomerID int, PaymentDate date, Amount int);

insert into payments(PaymentID, CustomerID, PaymentDate, Amount)
values
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

create table employees(EmployeeID int, EmployeeName varchar(30), ManagerID varchar(30));

insert into employees(EmployeeID, EmployeeName, ManagerID)
values
(1, 'Alex Green', 'NULL'),
(2, 'Brian Lee', '1'),
(3, 'Carol Ray' , '1'),
(4, 'David Kim', '2' ),
(5, 'Eva Smith', '2');


--# Q1 Retrieve all customers who have placed at least one order
select distinct customers.customername
from customers join orders on customers.CustomerID = orders.Customerid;

--# Q2 Retrieve all customers and their orders, including customers who have not placed any orders.
select c.*, o.*
from customers as c left join orders as o on c.customerid = o.customerid;

--# Q3 Retrieve all orders and their corresponding customers, including orders placed by unknown customers.
select o.*, c.*
from orders as o left join customers as c on o.customerid = c.customerid;

--# Q4 Display all customers and orders, whether matched or not
select c.*, o.*
from customers as c left join orders as o on c.customerid = o.customerid
union
select c.*, o.*
from customers as c right join orders as o on c.customerid = o.customerid;

-- Q5 Find customers who have not placed any orders.
select c.*
from customers as c left join orders as o on c.customerid = o.customerid where o.customerid is null;

-- Q6  Retrieve customers who made payments but did not place any orders.
select c.*
from customers as c join payments as p on c.customerid=p.customerid left join orders as o on c.customerid = o.customerid 
where o.customerid is null;

-- Q7 Generate a list of all possible combinations between Customers and Orders.
select c.*, o.*
from customers as c cross join orders as o on c.customerid = o.customerid;

-- Q8 Show all customers along with order and payment amounts in one table.
select c.*, o.orderid, p.amount
from customers as c left join orders as o on c.customerid = o.customerid left join payments as p on c.customerid = o.customerid;

-- Q9 Retrieve all customers who have both placed orders and made payments.
select distinct c.*, o.*, p.*
from customers as c join orders as o on c.customerid = o.customerid join payments as p on c.customerid=p.customerid;
