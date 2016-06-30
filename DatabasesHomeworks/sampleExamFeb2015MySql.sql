CREATE DATABASE orders;

USE orders;

CREATE TABLE products 
(id int auto_increment PRIMARY KEY,
Name nvarchar(500) NOT NULL,
price decimal(10,2));

CREATE TABLE customers
(id int auto_increment PRIMARY KEY,
name nvarchar(500) NOT NULL);

CREATE TABLE orders
(id int auto_increment PRIMARY KEY,
order_date datetime);

CREATE TABLE order_items
(id int auto_increment PRIMARY KEY,
order_id int,
product_id int,
quantity decimal(10,2));

INSERT INTO `products` VALUES (1,'beer',1.20), (2,'cheese',9.50), (3,'rakiya',12.40), (4,'salami',6.33), (5,'tomatos',2.50), (6,'cucumbers',1.35), (7,'water',0.85), (8,'apples',0.75);
INSERT INTO `customers` VALUES (1,'Peter'), (2,'Maria'), (3,'Nakov'), (4,'Vlado');
INSERT INTO `orders` VALUES (1,'2015-02-13 13:47:04'), (2,'2015-02-14 22:03:44'), (3,'2015-02-18 09:22:01'), (4,'2015-02-11 20:17:18');
INSERT INTO `order_items` VALUES (12,4,6,2.00), (13,3,2,4.00), (14,3,5,1.50), (15,2,1,6.00), (16,2,3,1.20), (17,1,2,1.00), (18,1,3,1.00), (19,1,4,2.00), (20,1,5,1.00), (21,3,1,4.00), (22,1,1,3.00);

ALTER TABLE order_items
ADD CONSTRAINT FK_order_itmes_order FOREIGN KEY(order_id) REFERENCES orders(id);
ALTER TABLE order_items
ADD CONSTRAINT FK_order_items_products FOREIGN KEY(product_id) REFERENCES products(id);

SELECT p.Name as product_name, COUNT(o.id) as num_orders, IFNULL(SUM(oi.quantity), 0) as quantity, p.price as price, IFNULL(SUM(oi.quantity) * p.price, 0) as total_price from orders o
JOIN order_items oi
ON o.id = oi.order_id
RIGHT JOIN products p
ON oi.product_id = p.id
GROUP BY p.id, p.Name
ORDER BY p.name