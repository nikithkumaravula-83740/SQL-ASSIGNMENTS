# Q1. Create a New Database and  Table for Employees
create database company_db;
use company_db
create table Employees(emp_id int, first_name varchar(50), last_name varchar(50), department varchar(50), salary int, hire_date date);
SELECT  * FROM Employees;
    
# Q2. Insert Data into Employees Table

insert into Employees(emp_id, first_name, last_name, department, salary, hire_date)
values
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-01-10');

SELECT * FROM Employees;


# Q3. Display All Employee Records Sorted by Salary (Lowest to Highest)

select * from employees
order by salary asc;



# Q4. Show Employees Sorted by Department (A–Z) and Salary (High → Low)

select * from employees
order by department asc, salary desc;


# Q5. List All Employees in the IT Department, Ordered by Hire Date (Newest First)

select first_name, last_name, department, hire_date from Employees
where department = 'IT'
order by hire_date desc;


# Q6. Create and Populate a Sales Table
create database sales_db;
use sales_db;
create table sales(sale_id int, customer_name varchar(50), amount int, sale_date date);
select *from sales;
insert into sales
(sale_id, customer_name, amount, sale_date)
values
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan',2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');

select * from sales;

# Q7. Display All Sales Records Sorted by Amount (Highest → Lowest)

select * from sales
order by amount desc;



# Q8. Show All Sales Made by Customer “Aditi”

select * from sales
where customer_name = 'Aditi'



# Q9. What is the Difference Between a Primary Key and a Foreign Key?

(Primary key
A primary key is a unique column we set in a table to easily identify and locate data queries.
There is no null value or duplicate value in primary key.
for example- roll no. is a primary key as it is unique for every student and it is easy to
 find the other details of student as roll no. is always unique. Also the same roll no. cannot 
 be given to two or more students.
 
 Foreign keys
 A foreign key iS a column used to link two or more tables together.
 A table can have any number of foreign keys, can have null or duplicate values.
 
 for example we have flipkart data, in this data we may have more than 1 tables. All the tables
 are customer, order, product, coupons, orderstatus, but all the  tables are connected,
 one or more column is common in two or more tables. The content in that
 column can be assumed as foreign keys.)
 

 
 # Q10. What Are Constraints in SQL and Why Are They Used?
 
 Constraints are used to specify rules for data in a table.
 This ensures the accuracy and reliability.
 Is can be specified.
 










