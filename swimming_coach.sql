create table parents(
    parent_id int unsigned auto_increment primary key,
    name varchar(100) not null,
    contact_no varchar(100),
    occupation varchar(100)
) engine = innodb;



create table addresses(
    address_id int unsigned auto_increment not null primary key,
    parent_id int unsigned not null, 
    block_number varchar(100) not null,
    street_name varchar(100) not null,
    postal_code varchar(100) not null

)engine = innodb;



alter table addresses add constraint fk_addresses_parents
foreign key (parent_id) references parents(parent_id);



create table available_payment_types(
    payment_types_id int unsigned not null primary key,
    payment_type varchar(255),
    parent_id int unsigned not null
)engine = innodb;



create


alter table available_payment_types add constraint fk_available_payment_types_parents
foreign key (parent_id) references parents(parent_id);


create table students(
    student_id int unsigned not null primary key,
    parent_id int unsigned not null,
    name varchar(100) not null,
    date_of_birth date not null
)engine = innodb;


alter table students add constraint students_parents
foreign key (parent_id) references parents(parent_id);
