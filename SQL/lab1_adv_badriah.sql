Drop Database if exists nakheel_market;
Create Database nakheel_market;
Show Databases;
Use nakheel_market;
Create Table products (
product_id INT unsigned not null auto_increment,
sku char(6) not null, 
product_name varchar(60) not null,
category varchar(30) not null default 'General',
brand varchar(30),
unit_price decimal(8,2) not null default 0.00,
stock_qty int unsigned not null default 0,
primary key (product_id),
unique key uq_products_sku(sku)
) auto_increment = 1001;

Create table customers (
customer_id int unsigned not null auto_increment,
first_name varchar(30) not null,
last_name varchar(30) not null,
email varchar(80) not null,
phone varchar(20),
city varchar(30) not null,
joined_date Date not null,
primary key(customer_id),
unique key uq_cust_email (email)
)auto_increment = 5001;

Show tables;
desc products;
Show create table customers;
create table products(product_id int);