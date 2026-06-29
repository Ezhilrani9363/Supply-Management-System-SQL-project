-- Database creation

create database SMS;
use SMS;

-- Table creation

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    age int check (age>=18)
    );
    select * from suppliers;
    
CREATE TABLE Warehouse (
    warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
    warehouse_name VARCHAR(100) NOT NULL,
    location VARCHAR(150)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    supplier_id INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_name varchar(100),
    warehouse_id INT,
    quantity INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id)
);

CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    warehouse_id INT,
    product_id INT,
    quantity INT,
    shipment_date DATE,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    warehouse_id INT,
    quantity INT,
    order_date DATE,
    status VARCHAR(50) DEFAULT 'Processing',
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id)
);

-- Inserting values

INSERT INTO Suppliers (supplier_name, contact_name, phone, email, address,age) VALUES
('Global Electronics', 'Ravi Kumar', '9876543210', 'ravi@globalelec.com', 'Chennai, India',18),
('FreshFoods Ltd', 'Anita Sharma', '9123456780', 'anita@freshfoods.com', 'Delhi, India',19),
('TechParts Co.', 'Suresh Iyer', '9988776655', 'suresh@techparts.com', 'Mumbai, India',24),
('TechParts Co.', 'Suresh Iyer', '9988776655', 'suresh@techparts.com', 'Mumbai, India',24),
('MedSupplies Inc.', 'Priya Nair', '9090909090', 'priya@medsupplies.com', 'Bangalore, India',34);

INSERT INTO Warehouse (warehouse_name, location) VALUES
('Central Warehouse', 'Delhi'),
('South Warehouse', 'Chennai'),
('West Warehouse', 'Mumbai'),
('East Warehouse', 'Kolkata');

INSERT INTO Products (product_name, supplier_id, unit_price) VALUES
('Smartphone X', 1, 25000.00),
('Organic Rice 10kg', 2, 800.00),
('Laptop Battery', 3, 3500.00),
('Surgical Mask Box', 4, 500.00);

INSERT INTO Inventory (product_id,product_name, warehouse_id, quantity) VALUES
(1, 'Rice',1, 150),  
(2,'Turmeric', 2, 300),   
(3, 'Mustard',3, 100),   
(4, 'ChilliPowder',4, 500);

INSERT INTO Shipments (supplier_id, warehouse_id, product_id, quantity, shipment_date, status) VALUES
(1, 1, 1, 100, '2025-09-20', 'Delivered'),
(2, 2, 2, 200, '2025-09-18', 'Delivered'),
(3, 3, 3, 50,  '2025-09-19', 'Pending'),
(4, 4, 4, 300, '2025-09-21', 'In Transit');

INSERT INTO Orders (product_id, warehouse_id, quantity, order_date, status) VALUES
(1, 1, 10, '2025-09-22', 'Processing'),
(2, 2, 20, '2025-09-21', 'Shipped'),
(3, 3, 5,  '2025-09-20', 'Delivered'),
(4, 4, 50, '2025-09-23', 'Processing');

-- Ater
alter table Orders add column rating int;
alter table Shipments modify column quantity bigint;
alter table Shipments change column quantity quantities int;
alter table Inventory drop column product_name;

Drop table Orders;
Truncate table Orders;

-- Update table

update  suppliers 
set name ='Ravi Mohan'
where address='chennai';

-- Delete 

delete from suppliers 
where name='Ravi Mohan';

-- Select,orderby,limit,like,offset

select * from suppliers;
select inventory_id, qunatity from Inventory;
select * from suppliers where name='Suresh Iyer';
select * from warehouse where warehouse ='Chennai'order by warehouse_id asc;
select * from product order by product_name desc limit 2 offset 1;
select * from product order by product_name  like 'r%';

-- Aggregate Function

select sum(unit_price) as price from products;
select avg(unit_price) as price from products;
select max(unit_price) as price from products;
select min(unit_price) as price from products;
select count(product_name) as price from products;

-- view table 

create view supply as select quantity,order_date from orders;
create view  management as select order_date from orders where order_date=Date;

select * from supply;
drop view management;
show full tables where table_type='view';

-- grou by and having
select status, SUM(quantity) AS total_quantity
from Shipments
group by status
having SUM(quantity) > 100;

select status, count(warehouse_id)
from orders
group by status
having status='delevired';

-- Joins

select orders.order_id,orders.order_date,orders,product_id,products.product_id,product_name
from orders inner join orders on products.product_id=orders.product_id;

select orders.order_id,orders.order_date,orders,product_id,products.product_id,product_name
from orders right join orders on products.product_id=orders.product_id;

select orders.order_id,orders.order_date,orders,product_id,products.product_id,product_name
from orders left join orders on products.product_id=orders.product_id;

-- subquery

select unit_price
from products
where unit_price=(select avg(unit_price) from products);

select contact_name
from suppliers
where contact_name=(select count(contact_name) from suppliers);

-- stored procedure
delimiter $$
create procedure Showproject()
begin
select quantity
from shippments;
end $$
delimiter ;
call showproject;

delimiter $$
create procedure Showprojectsss(IN x varchar(100))
begin
select email
from suppliers
where email=x;
end $$
delimiter ;
call showprojectsss('priya@medsupplies.com');

-- trigger

CREATE TABLE Supplier_Log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    action_type VARCHAR(20),        -- INSERT, UPDATE, DELETE
    supplier_id INT,
    supplier_name VARCHAR(100),
    contact_name VARCHAR(100),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_supplier_inserts
AFTER INSERT ON Suppliers
FOR EACH ROW
BEGIN
    INSERT INTO Supplier_Log (action_type, supplier_id, supplier_name, contact_name)
    VALUES ('INSERT', NEW.supplier_id, NEW.supplier_name, NEW.contact_name);
END$$

DELIMITER ;

INSERT INTO Suppliers (supplier_name, contact_name, phone, email, address)
VALUES ('Test Supplier Pvt Ltd', 'Rahul Verma', '9876500000', 'rahul@testsup.com', 'Pune, India');

-- TCL

start transaction;

insert into suppliers (supplier_name, contact_name, phone, email, address)
values ('supplier a', 'ravi', '1111111111', 'ravi@a.com', 'chennai');

savepoint sp1;

insert into suppliers (supplier_name, contact_name, phone, email, address)
values ('supplier b', 'sita', '2222222222', 'sita@b.com', 'delhi');

rollback to sp1;

commit;

-- string function

select upper('gayu');
select lower('ugan');
select contact_name, email, 
       concat(contact_name, ' ', email) as contact_email
from suppliers;

-- indexes
create unique index idx_email on suppliers(email);
create index idx_name_email on suppliers(contact_name, email);
























    
    

