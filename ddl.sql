# Data Definition Language
create database employees;
show databases;
use employees;
select database();



create table employees(
 employee_id int unsigned auto_increment primary key,
 email varchar(320),
 gender varchar(1),
 notes text,
 employment_date date,
 designation varchar(100)
) engine = innodb;

# show coloumns of table
describe employees;

# delete table
drop table employees;

# inserting rows

insert into employees(
  email, gender, notes, employment_date, designation
)values('asd@asd.com','m','Newbie',curdate(),"Intern");

# see all the rows in a table
select * from employees;

#update one row in a table 
update employees set email = "asd@gmail.com" where employee_id = 1;

#delete one row
delete from employees where employee_id = 1;


#

create table departments(
department_id int unsigned auto_increment primary key,
name varchar(100)

)engine = innodb;

# command name data  type
#add a new coloumns in a table
alter table employees add column name varchar(100);
alter table employees rename column name to first_name;

#
describe employees;

#insert 2 or three departments
insert into departments (name) values ("Accounting"),("Human Resource"),("IT");

#insert into employees with first_name

insert employees(
    first_name,email,gender,notes,employment_date,designation
    )values ('Tan ah kow','asd@asd.com','m','newbie',curdate(),"Intern");



    alter table employees add column department_id int unsigned not null;


    alter table employees add constraint fk_employees_departments 
    foreign key (department_id) references departments(department_id);

#delete from employees(so that create fk)
    delete from employees;



insert into employees (first_name, department_id, email,gender,notes,employment_date,designation)
     VALUES('Tan ah kow',3,'asd@asd.com','m','newbie',curdate(),"Intern");
