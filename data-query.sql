-- display all columns from all rows
select * from employees;   -- The * refers to all the columns

-- select <column names> from <table name>
-- display the firstname, lastname and email column from all the employees
select firstName, lastName, email from employees;

-- select column and rename them
SELECT firstName AS 'First Name', lastName AS 'Last Name',


-- use where to filter the rows
select * from employees where officeCode =1;


select firstName, lastName, email,officeCode from employees where officeCode =1;

SELECT city,addressline1,addressLine2 from offices where country = "USA";

--- %sales% wil match as long as the word ''sales appear anywhere in jobTitle
SELECT * FROM employees where jobTitle like "sales%"


--- %sales% wil match as long as the word ''sales  in jobTitle ends with sales
SELECT * FROM employees where jobTitle like "%sales"





-- display all columns from all rows
select * from employees;   -- The * refers to all the columns

-- select <column names> from <table name>
-- display the firstname, lastname and email column from all the employees
select firstName, lastName, email from employees;

-- select column and rename them
SELECT firstName AS 'First Name', lastName AS 'Last Name', email AS 'Email' FROM employees;

-- use where to filter the rows
select * from employees where officeCode = 1;

-- show the city, addressline1, addressline2 of all offices in the USA
select city, addressLine1, addressLine2 from offices where country = "USA";

-- use LIKE with wildcard to match partial strings

-- %sales% will match as long as the word 'sales' appear anywhere in jobtitle
SELECT * FROM employees WHERE jobTitle LIKE "%sales%"

-- %sales will match as long as the job title ends with 'sales'
SELECT * FROM employees WHERE jobTitle LIKE "%sales";

-- sales% will match as long as the jobtitle begins with 'sales
SELECT * FROM employees WHERE jobTitle LIKE "sales%";


-- find all products name begins with  1969
SELECT * FROM products where productName like "1969%"
--find all products which name contains 'davison'
SELECT * FROM products where productName like "%Davidson%"


-- find all the products which name begins with 1969
select productName from products where productName like '1969%';

-- find all the products which name contains the string 'Davidson'
select productName from products where productName like '%Davidson%'

-- filter for multiple conditions using logical operators
-- find all sales rep from office code 1
SELECT * FROM employees WHERE officeCode = "1" 
	AND jobTitle LIKE "Sales Rep" 

--and
select* from employees where officeCode = "1"
and jobTitle like "sales rep"

-- find all employees from office code 1 or office code 2
select * from employees where officeCode = 1 or officeCode = 2;



select * from employees where jobTitle like "sales rep" and (officeCode =1 or officeCode =2);

--show all customers from USA in state of UV
-- who has credit limit more than 5000 OR all customers from any country
-- credit limit more than 1000

select * from customers where (country ="USA" and state="NV" and creditLimit>5000 ) or (creditLimit>10000)



-- join first fliter where == then select

SELECT firstname, lastName, city, addressLine1, addressLine2 FROM employees JOIN offices
 on employees.officeCode = offices.officeCode
 where country="USA"



 -- show customerName along with  firstName, lastName and email of their sales rep

select customerName,firstName, lastName, email from customers join employees on customers.salesRepEmployeeNumber = employees.employeeNumber


-- show the customerName along with the firstName, lastName and email of their sales rep
 -- only for customers that have a sales rep
 -- inner join 
select customerName, salesRepEmployeeNumber, firstName, lastName, email
from customers join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber

--show all customers with their sales rep info, regardless of
--whether the customers have a sales repo or not
-- show the customerName along with the firstName, lastName and email of their sales rep
select customerName, firstName, lastName, email
from customers left join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber


-- show the customerName along with the firstName, lastName and email of their sales rep
-- will show for all employeess regardless of whether they have customers
-- (customers with no sales rep won't show up)
select customerName, firstName, lastName, email
from customers right join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber

-- full outer join == left join + right join

-- for each customer in the USA, show the name of the sales rep and their office number
select customerName AS "Customer Name", customers.country as "Customer Country", firstName, lastName, offices.phone from customers JOIN employees
  ON customers.salesRepEmployeeNumber = employees.employeeNumber
  JOIN offices ON employees.officeCode = offices.officeCode
  WHERE customers.country = "USA";



-- for each customer, show the name of the sales rep  and their  office number

select customerName AS "Customer Name", customers.country, firstName,lastName,offices.phone from customers join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber
join offices on employees.officeCode = offices.officeCode
where customers.country = "USA"


---date manipulation

--tell u current date on server
select NOW()
select curdate(); 



-- Show all payments made after 30th June 2003 
SELECT * FROM payments WHERE paymentDate > "2003-06-30"

-- show all payments between 2003-01-01 and 2003-06-30
SELECT * FROM payments WHERE paymentDate >= "2003-01-01" AND
  paymentDate <= "2003-06-30"

SELECT * FROM payments where paymentDate BETWEEN "2003-01-01" AND "2003-06-30";

-- display the year where a payment is made:
select checkNumber, YEAR(paymentDate) FROM payments

-- show all payments made in the year 2003:
select checkNumber, YEAR(paymentDate) FROM payments WHERE YEAR(paymentDate) = 2003;

-- display the month, year and day for each payment made
select checkNumber, YEAR(paymentDate), MONTH(paymentDate), DAY(paymentDate) FROM payments





---compare date use a datetime data type not varchar


SELECT * FROM payments where paymentDate > "2003-06-30"



SELECT * FROM payments where paymentDate > "2003-06-30" and payemntDate <= "2003-06-30"


SELECT * FROM payments where paymentDate > between "2003-06-30" and payemntDate <= "2003-06-30"



-- month, year and day functions, doesnt work in varchar
select checknumber, year(paymentDate) from payments where year(paymentDate) =2003


-- month, year and day functions, doesnt work in varchar
select checknumber, year(paymentDate),month(paymentDate),day(paymentDate) from payments


-- 1
SELECT city,phone,country FROM offices;

--2
SELECT * FROM orders where comments like "FedEx"
--3
SELECT contactFirstName,contactLastName FROM customers order by customerName desc



--4
SELECT * FROM employees
where  jobTitle = "Sales Rep"
and(officeCode =1 or officeCode =2 or officeCode =3) 
and (firstName like "%son%" or lastName like "%son%")


--5

SELECT customerName,contactFirstName,contactLastName FROM customers join orders
on customers.customerNumber = orders.customerNumber
WHERE customers.customerNumber like "124"

---6


select productName,orderdetails.* from products join orderdetails
on products.productCode = orderdetails.productCode
