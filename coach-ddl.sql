
create database swimming_coach_1
use swimming_coach_1



create table parents(
    parent_id int unsigned auto_increment primary key,
    name varchar(100) not null,
    contact_no varchar(100),
    occupation varchar(100)
) engine = innodb;

//insert  rows
insert into parents (name,contact_no,occupation)
values("Tan Ah Liang","9999999","Truck driver");

//check for rows
select * from parents;

-- insert multiple parents
insert into parents (name, contact_no, occupation) values  
        ("Mary Sue", "1111111", "Doctor"),
        ("Tan Ah Kow", "22222222", "Programmer");


create table locations (
location_id mediumint unsigned auto_increment primary key,
name varchar(100) not null,
address varchar(255) not null
 )engine=innodb;


 insert into locations (name,address) values("Yishun swimmming complex","Yishun Ave 4");

// types field in it
 describe locations

// show rows
 select * from locations;

create table addresses(
    address_id int unsigned auto_increment primary key,
    parent_id int unsigned not null,
    block_number varchar(6) not null,
    street_name varchar(255) not null,
    unit_number varchar(100) not null,
    postal_code varchar(10) not null
)engine=innodb;


// add in foreign key in table
//add in foreign key relationship to parent_id
alter table addresses add constraint fk_addresses_parents
foreign key (parent_id) references parents(parent_id);

# addresses.parent_id will refer to parents.parent_id

# create students with foreign key 
create table students(
    students_id int unsigned auto_increment primary key,
    name varchar(100) not null,
    date_of_birth date not null,
    parent_id int unsigned not null,
    foreign key (parent_id) references parents(parent_id)
)engine = innodb;


insert into students (name,date_of_birth,parent_id)
values ('Cindy Tan','2020-06-11',3);


# rmb to use () not curly  {}
create table sessions(
    session_id int unsigned auto_increment primary key ,
    datetime datetime not null,
    location_id mediumint unsigned not null,
    foreign key (location_id) references locations (location_id)
)engine= innodb;

show tables;
#backtick `` as a string not datatype or use --  when 