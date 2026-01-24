create database filtering_db;
use filtering_db;
create table Employees(Empid int, EmpName varchar(50), Department varchar(50), City varchar(50), Salary int, Hiredate date);

insert into employees(Empid, Empname, Department, City, Salary, Hiredate)
values
( 101, 'Rahul_Mehta', 'Sales', 'Delhi', 55000, '2020-04-12'),
(102, 'Priya_Sharma', 'HR', 'Mumbai', 62000, '2019-09-25'),
(103, 'Aman_Singh', 'IT', 'Bengluru', 72000, '2021-03-10'),
(104, 'Neha_Patel', 'Sales', 'Delhi', 48000, '2022-01-14'),
(105, 'Karan_Joshi', 'Marketing', 'Pune', 45000, '2018-07-22'),
(106, 'Divya_Nair', 'IT', 'Chennai', 81000, '2019-12-11'),
(107, 'Raj_Kumar', 'HR', 'Delhi', 60000, '2020-05-28'),
(108, 'Simran_Kaur', 'Finance', 'Mumbai', 58000, '2021-08-03'),
(109, 'Arjun_Reddy', 'IT', 'Hyderabad', 70000, '2022-02-18'),
(110, 'Anjali_Das', ' Sales', 'Kolkata', 51000, '2023-01-15');

select * from employees;


# 	Q1 Show employees working in either the ‘IT’ or ‘HR’ departments.
select * from Employees
where Department = 'IT' or Department ='HR';

-------------------------------------------------------------------------

# Q2 : Retrieve employees whose department is in ‘Sales’, ‘IT’, or ‘Finance’.

SELECT * FROM employees
WHERE department IN ('Sales', 'IT', 'Finance');

----------------------------------------------------------------------------

# Q3 : Display employees whose salary is between ₹50,000 and ₹70,000.

select * from employees
where Salary  between 50000 and 70000;

-----------------------------------------------------

# Q4 : List employees whose names start with the letter ‘A’.

SELECT * FROM employees
WHERE EmpName LIKE 'A%';

-------------------------------------------------------------------------------

# Q5 : Find employees whose names contain the substring ‘an’.

select * from employees
where EmpName LIKE '%an%';

-----------------------------------------------------------------------------------------

# Q6 : Show employees who are from ‘Delhi’ or ‘Mumbai’ and earn more than ₹55,000.

select * from employees 
where city in ( 'Delhi', 'Mumbai')
and
salary > 55000;

-------------------------------------------------------------------------------

 # Q7 : Display all employees except those from the ‘HR’ department.

select * from employees
where Department <> 'HR';

-----------------------------------------------------------------------------------------------

# Q8 : Get all employees hired between 2019 and 2022, ordered by HireDate 
(oldest first).

select * from employees
where Hire_Date  between '2019-01-01' and '2022-12-31'
order by Hire_date asc;

