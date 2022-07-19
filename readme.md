To start mysql, in the terminal, type in `mysql -u root`

To create a user that can be accessed via nodejs etc, run this:
```
mysql -e "ALTER USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root_password';"



sql
# Import the sakila database
```
mysql -u root < sakila-schema.sql
mysql -u root < sakila-data.sql
```
  use sakila 


  show tables 


# Dependencies
Create a file with the name `init.sh`

```
yarn add express
yarn add hbs
yarn add wax-on
yarn add handlebars-helpers
yarn add mysql2
```
// 
Set permission:
```
chmod +x init.sh
./init.sh
```
 
 use sakila 
 
 chmod +x init.sh



all under sql

CREATE USER 'ahkow'@'localhost' IDENTIFIED BY 'rotiprata123';
GRANT ALL PRIVILEGES  on sakila.* TO 'ahkow'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```


select * from actor