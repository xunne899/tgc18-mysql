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



create table locations(
  location_id int unsigned not null primary key,
  name varchar(100) not null,
  address varchar(255) not null

)engine = innodb;





create table student_session(
  student_session_id int unsigned not null primary key,
  student_id int unsigned not null,
   session_id int unsigned not null

)engine = innodb;



alter table student_session add constraint student_session_students
foreign key (student_id) references students(student_id);


alter table student_session add constraint student_session_sessions
foreign key (session_id) references sessions(session_id);

create table sessions(
  session_id int unsigned not null primary key,
  datetime datetime not null,
   location_id int unsigned not null

)engine = innodb;



alter table sessions add constraint sessions_locations
foreign key (location_id) references locations(location_id);
;




create table payments(
  payment_id int unsigned not null primary key,
   parent_id int unsigned not null,
   session_id int unsigned not null,
    student_id int unsigned not null,
    payment_mode varchar(255) not null,
     amount float unsigned not null


)engine = innodb;






alter table payments add constraint payments_parents
foreign key (parent_id) references parents(parent_id);


alter table payments add constraint payments_sessions
foreign key (session_id) references sessions(session_id);

alter table payments add constraint payments_students
foreign key (student_id) references students(student_id);


