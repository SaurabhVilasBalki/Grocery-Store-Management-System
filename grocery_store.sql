-- create database
-- drop database grocery_store;
create database grocery_store;

use grocery_store;

-- creating table for products
create table products (
	product_id int not null auto_increment,
    name varchar(100) not null,
    unit_id int not null,
    price_per_unit double not null,
    primary key (product_id)
);

-- creating unit of measure table
create table uom (
	unit_id int not null auto_increment,
    unit_name varchar(45) not null,
    primary key (unit_id)
);


-- adding constraint foreign key on unit_id in product table
alter table products
add constraint fk_unit_id
	foreign key (unit_id)
    references uom (unit_id)
    on delete no action
    on update restrict;

-- creating orders table
create table orders (
	order_id int not null auto_increment,
    customer_name varchar(100) not null,
    total double not null,
    date_time datetime not null,
    primary key (order_id)
);

-- creating order deatils table and adding constraints on order_id and product_id
create table order_details (
	order_id int not null,
    product_id int not null,
    quantity double not null,
    total_price double not null,
    constraint fk_order_id foreign key (order_id)
							references orders (order_id)
                            on delete no action
                            on update restrict,
	constraint fk_product_id foreign key (product_id)
							references products (product_id)
                            on delete no action
                            on update restrict
);