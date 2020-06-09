--------------------------------------- run this Firstly-----------------------------------------
create database mini_store_system ;
---------------------------------------run this Secondly-----------------------------------------
USE mini_store_system ;
--------------------------------------- -run Next all -----------------------------------------
 CREATE TABLE store (
    store_id           int,
    store_name         varchar(255),
    store_city         varchar(255),
    store_phone        varchar(255),
	PRIMARY KEY (store_id)
);
insert into store (store_id, store_name, store_city, store_phone) values (320, 'The Corner Store', 'cairo', '01715265023');

CREATE TABLE salesPerson(
    sales_id               int,
    sales_name             varchar(255),
    sales_city             varchar(255),
    store_id               int,
	PRIMARY KEY (sales_id),
	foreign key (store_id) references store (store_id)
);

CREATE TABLE suppliers(
    suppliers_id           int,
    suppliers_name         varchar(255),
    suppliers_email        varchar(255),
    suppliers_phone        int,
    store_id               int,
	PRIMARY KEY (suppliers_id),
	foreign key (store_id) references Store(store_id)
);
insert into suppliers  (suppliers_id, suppliers_name, suppliers_email, suppliers_phone, store_id) values (50, 'Ayman', 'ayman@gmail.com', '01355364506' , 320 );
insert into suppliers  (suppliers_id, suppliers_name, suppliers_email, suppliers_phone, store_id) values ( 52, 'Malek', 'malek@gmail.com' , '01704181593', 320);
insert into suppliers  (suppliers_id, suppliers_name, suppliers_email, suppliers_phone, store_id) values ( 57, 'Amir', 'malek@gmail.com', '01835665653', 320 );
insert into suppliers  (suppliers_id, suppliers_name, suppliers_email, suppliers_phone, store_id) values ( 60, 'Seif', 'malek@gmail.com', '01447361582', 320);
insert into suppliers  (suppliers_id, suppliers_name, suppliers_email, suppliers_phone, store_id) values ( 63, 'Marwan', 'malek@gmail.com', '01527149503', 320);
select *from suppliers ;

CREATE TABLE customer(
    customer_id            int,
    customer_name          varchar(255),
    customer_email         varchar(255),
    customer_phone         varchar(255),
	PRIMARY KEY (customer_id)
);
insert into customer ( customer_id, customer_name, customer_email, customer_phone) values(222, 'Ahmed', 'ahmed@gmail.com', '01389597564' );
insert into customer ( customer_id, customer_name, customer_email, customer_phone) values(212, 'Ali', 'ali@gmail.com', '01761941502' );
insert into customer ( customer_id, customer_name, customer_email, customer_phone) values(200, 'Mohamed', 'mohamed@gmail.com', '01389597564' );
insert into customer ( customer_id, customer_name, customer_email, customer_phone) values(226, 'Mustafa', 'mustafa@gmail.com', '01505485275' );
insert into customer ( customer_id, customer_name, customer_email, customer_phone) values(230, 'Sleem', 'sleem@gmail.com', '01936363565' );
select *from customer ;

CREATE TABLE orders(
    order_id               int,
    order_name             varchar(255),
    order_date             date,
    customer_id            int,
	PRIMARY KEY (order_id),
	foreign key (customer_id) references customer(customer_id)
);
insert into orders ( order_id, order_name, order_date, customer_id) values(110, 'Ziad', '2020/04/15',  200 );
insert into orders ( order_id, order_name, order_date, customer_id) values(145, 'Mohamed', '2020/05/07', 212 );
insert into orders ( order_id, order_name, order_date, customer_id) values(127, 'Mahmoud', '2020/04/20', 222 );
insert into orders ( order_id, order_name, order_date, customer_id) values(100, 'Hassan', '2020/03/27', 226 );
insert into orders ( order_id, order_name, order_date, customer_id) values(150, 'Saleh', '2020/05/17', 230 );
select *from orders ;

CREATE TABLE product(
    product_id             int,
    product_name           varchar(255),
    product_prand          varchar(255),
    product_price          int,
    product_quntity        int,
    suppliers_id           int,
	PRIMARY KEY (product_id),
	foreign key (suppliers_id) references Suppliers(suppliers_id)
);
insert into product ( product_id, product_name, product_prand, product_price, product_quntity, suppliers_id ) values(1413, 'alinware', 'dell', 1000, 20, 50);  
insert into product ( product_id, product_name, product_prand, product_price, product_quntity, suppliers_id ) values(1419, 'ps Wireless Controller', 'sony', 50, 18, 57);  
insert into product ( product_id, product_name, product_prand, product_price, product_quntity, suppliers_id ) values(1421, 'sd card 128', 'kingstone', 20, 14, 63);  
insert into product ( product_id, product_name, product_prand, product_price, product_quntity, suppliers_id ) values(1425, 'sd card 2020', 'apple', 1500, 6, 52);  
insert into product ( product_id, product_name, product_prand, product_price, product_quntity, suppliers_id ) values(1430, 'mgk 5080', 'braun', 99, 15, 60);  
select *from product ;

CREATE TABLE order_details(
    order_id               int,
    product_id             int,
    order_date             varchar(255),
    order_product_name     varchar(255),
    order_product_quntity  int,
    order_product_price    int,
    order_total_price      int,
    Foreign key (product_id) references Product(product_id)
);
Alter table order_details
Add Foreign key (order_id) references Orders(order_id) ;
insert into order_details (order_id, product_id, order_date, order_product_name, order_product_quntity, order_product_price, order_total_price) values (145, 1419, '2020/05/07', 'ps Wireless Controller', 2, 500, 1000 );
insert into order_details (order_id, product_id, order_date, order_product_name, order_product_quntity, order_product_price, order_total_price) values (110 , 1430, '2020/04/04', 'mgk 5080', 3,  99, 297 );
insert into order_details (order_id, product_id, order_date, order_product_name, order_product_quntity, order_product_price, order_total_price) values (127, 1425, '2020/05/01','sd card 2020', 1, 1500, 1500 );
insert into order_details (order_id, product_id, order_date, order_product_name, order_product_quntity, order_product_price, order_total_price) values (150 , 1421, '2020/05/05', 'sd card 128', 3, 20, 40 );
insert into order_details (order_id, product_id, order_date, order_product_name, order_product_quntity, order_product_price, order_total_price) values (100 , 1413, '2020/03/29', 'alinware', 1, 1000, 2000 );
select *from order_details ;


-- Select Statements 
select * from store where store_city='cairo';
select *from suppliers ;
select * from suppliers where store_id= 320;
select * from suppliers where suppliers_id> 55;
select suppliers_name,suppliers_email,suppliers_phone from suppliers  ORDER BY suppliers_name;
SELECT TOP 3 * FROM customer;
select * from suppliers where suppliers_name LIKE '%m%' order by suppliers_id;
select * from suppliers order by suppliers_id;
select * from orders where order_date > '2020/05/07' ;
select count(order_id) from orders ;
select avg(order_total_price) from order_details;
select max(order_total_price) from order_details;
select min(order_total_price) from order_details;
select sum(order_total_price) from order_details where order_id > 130;
select * from order_details where order_date > '2020/05/02' ;
select order_id, order_total_price from order_details where order_date NOT IN ('2020/04/04', '2020/05/07');
select order_id from order_details where order_total_price> 500;
select count(suppliers_id) from suppliers ;
select max(order_product_quntity) from order_details;
select * from product  ORDER BY product_price;

-- Select using Sub Query
SELECT suppliers_name,  suppliers_phone FROM suppliers WHERE suppliers_id=(select suppliers_id from product  where product_name = 'sd card 2020') ;
SELECT order_name, order_date FROM orders WHERE order_id=(select order_id from order_details where order_id = 100) ;
SELECT product_name, product_prand, product_price FROM product WHERE product_id=(select product_id from order_details where order_date = '2020/05/01') ;

-- Select using Count and Group 
 SELECT order_product_name, count(*) FROM order_details GROUP BY order_product_name ;
 SELECT product_name ,count(product_id) FROM product GROUP BY product_name ;
 SELECT count(order_id), order_name FROM orders GROUP BY order_name ORDER BY order_name;

-- Select using Different Joins 
SELECT store.store_name, suppliers.suppliers_name FROM store INNER JOIN suppliers ON store.store_id = suppliers.store_id ;
SELECT customer.customer_name, orders.order_date FROM customer INNER JOIN orders ON customer.customer_id = orders.customer_id ;
SELECT product.product_name, order_details.order_id FROM product right JOIN order_details ON product.product_price = order_details.order_total_price ;
 SELECT orders.order_name, order_details.order_total_price FROM orders left JOIN order_details ON orders.order_date = order_details.order_date ;
SELECT product.product_name, order_details.order_id FROM product INNER JOIN order_details ON product.product_price = order_details.order_total_price ;

-- Update Statement 
UPDATE suppliers SET suppliers_name = 'Adel', suppliers_email= 'Adel@gmail.com' WHERE suppliers_id = 57;
UPDATE product SET product_price = 40 WHERE product_id = 1421;
UPDATE order_details SET order_date = '2020/04/01' WHERE product_id = 1413;
UPDATE product SET product_price = 1100 WHERE product_id = 1413;
UPDATE order_details SET order_product_quntity = 3 WHERE order_id = 145;

-- Delete Statement 
DELETE FROM orders WHERE order_id= 120;
DELETE FROM customer WHERE customer_id= 127;
DELETE FROM orders WHERE order_id= 175;
DELETE FROM order_details WHERE order_date= '2020/04/07';
DELETE FROM customer WHERE customer_name= 'Mustafaa';
