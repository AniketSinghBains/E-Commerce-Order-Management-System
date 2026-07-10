CREATE DATABASE ecommerce_order_management;

USE ecommerce_order_management;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

SHOW TABLES;
USE ecommerce_order_management;

INSERT INTO customers (customer_name, email, phone, city)
VALUES
('Amit Sharma', 'amit.sharma@gmail.com', '9876543210', 'Delhi'),
('Priya Verma', 'priya.verma@gmail.com', '9876543211', 'Mumbai'),
('Rahul Singh', 'rahul.singh@gmail.com', '9876543212', 'Jalandhar'),
('Neha Gupta', 'neha.gupta@gmail.com', '9876543213', 'Pune'),
('Karan Mehta', 'karan.mehta@gmail.com', '9876543214', 'Chandigarh');

INSERT INTO products (product_name, category, price, stock_quantity)
VALUES
('Laptop', 'Electronics', 55000.00, 20),
('Wireless Mouse', 'Electronics', 1200.00, 50),
('Keyboard', 'Electronics', 1800.00, 40),
('Office Chair', 'Furniture', 7500.00, 15),
('Study Table', 'Furniture', 10000.00, 10),
('Smartphone', 'Electronics', 30000.00, 25),
('Headphones', 'Electronics', 2500.00, 35),
('Backpack', 'Accessories', 1500.00, 60);

INSERT INTO orders (customer_id, order_date, order_status, total_amount)
VALUES
(1, '2026-07-01', 'Delivered', 57400.00),
(2, '2026-07-02', 'Shipped', 30000.00),
(3, '2026-07-03', 'Pending', 9300.00),
(1, '2026-07-04', 'Delivered', 2500.00),
(4, '2026-07-05', 'Cancelled', 10000.00),
(5, '2026-07-06', 'Delivered', 1500.00);

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 55000.00),
(1, 2, 2, 1200.00),

(2, 6, 1, 30000.00),

(3, 4, 1, 7500.00),
(3, 3, 1, 1800.00),

(4, 7, 1, 2500.00),

(5, 5, 1, 10000.00),

(6, 8, 1, 1500.00);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT COUNT(*) AS total_customers
FROM customers;
SELECT COUNT(*) AS total_products
FROM products;
SELECT COUNT(*) AS total_orders
FROM orders;
SELECT COUNT(*) AS total_order_items
FROM order_items;

/*----------------joins------------------*/

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_date,
    o.order_status,
    o.total_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;
    
SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id;
    
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.order_status,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;

SELECT
    o.order_id,
    c.customer_name,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    c.customer_name;
    
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;
    
SELECT
    c.customer_id,
    c.customer_name,
    c.email
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered';

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_units_sold DESC;

USE ecommerce_order_management;

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
/*----------------------------------------------------------------------------*/
SELECT
    o.order_id,
    o.customer_id,
    c.customer_name
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id;
    
SELECT
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    p.product_name
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id;
    
SELECT
    oi.order_item_id,
    oi.order_id,
    o.order_status
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id;
    
SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*---------------------------------------------------*/
INSERT INTO customers
(customer_name, email, phone, city)
VALUES
('Simran Kaur', 'simran.kaur@gmail.com', '9876543215', 'Amritsar');

SELECT
    c.customer_id,
    c.customer_name,
    c.email
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

INSERT INTO products
(product_name, category, price, stock_quantity)
VALUES
('Webcam', 'Electronics', 3200.00, 25);

SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

/*-----------------------------------------------------------------------------------*/

SELECT
    SUM(total_amount) AS total_sales
FROM orders
WHERE order_status <> 'Cancelled';


SELECT
    COUNT(*) AS total_orders
FROM orders;

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spending DESC;

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_revenue DESC;

SELECT
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM orders
WHERE order_status <> 'Cancelled'
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
WHERE order_status <> 'Cancelled';

SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status <> 'Cancelled'
ORDER BY o.total_amount DESC
LIMIT 1;

SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < 20
ORDER BY stock_quantity ASC;

SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered'
ORDER BY o.order_date;

/*---------------------------------indexes----------------------------*/

CREATE INDEX idx_customer_email
ON customers(email);

CREATE INDEX idx_product_name
ON products(product_name);

CREATE INDEX idx_order_customer
ON orders(customer_id);

CREATE INDEX idx_order_date
ON orders(order_date);

CREATE INDEX idx_order_status
ON orders(order_status);

CREATE INDEX idx_order_items_order
ON order_items(order_id);

CREATE INDEX idx_order_items_product
ON order_items(product_id);

CREATE INDEX idx_customer_order_date
ON orders(customer_id, order_date);

SHOW INDEX FROM customers;
SHOW INDEX FROM products;
SHOW INDEX FROM orders;
SHOW INDEX FROM order_items;

SELECT *
FROM customers
WHERE email = 'amit.sharma@gmail.com';

SELECT *
FROM products
WHERE product_name = 'Laptop';

SELECT *
FROM orders
WHERE customer_id = 1;

SELECT *
FROM orders
WHERE order_date = '2026-07-01';

SELECT *
FROM orders
WHERE order_status = 'Delivered';

SELECT *
FROM orders
WHERE customer_id = 1
AND order_date BETWEEN '2026-07-01' AND '2026-07-31';

EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 1;

EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 1
AND order_date BETWEEN '2026-07-01' AND '2026-07-31';


/*-------------------------------------views-------------------------------------------*/

CREATE VIEW order_summary_view AS
SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_date,
    o.order_status,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;
    
SELECT *
FROM order_summary_view;

SELECT *
FROM order_summary_view
WHERE order_status = 'Delivered';

SELECT *
FROM order_summary_view
WHERE customer_name = 'Amit Sharma';

DESCRIBE order_summary_view;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';

CREATE VIEW customer_order_report AS
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(
        CASE
            WHEN o.order_status <> 'Cancelled'
            THEN o.total_amount
            ELSE 0
        END
    ) AS total_spending
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;
    
SELECT *
FROM customer_order_report ;

