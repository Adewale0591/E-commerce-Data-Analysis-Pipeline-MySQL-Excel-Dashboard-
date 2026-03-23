CREATE DATABASE e_commerce_db;

USE e_commerce_db;

CREATE TABLE customers(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100) UNIQUE,
phone VARCHAR(20),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE products(
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(50),
description TEXT,
price DECIMAL(10,2),
stock_quantity INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10,2),
status VARCHAR(50),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE order_items(
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
price DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES orders (order_id),
FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@email.com', '1234567890'),
('Jane', 'Smith', 'jane.smith@email.com', '2345678901'),
('Michael', 'Brown', 'michael.brown@email.com', '3456789012'),
('Sarah', 'Johnson', 'sarah.johnson@email.com', '4567890123'),
('David', 'Williams', 'david.williams@email.com', '5678901234');

INSERT INTO products(product_name, description, price, stock_quantity) VALUES
('Wireless Mouse', 'Ergonomic wireless mouse', 25.99, 100),
('Mechanical Keyboard', 'RGB mechanical keyboard', 89.99, 50),
('Laptop Stand', 'Adjustable aluminium laptop stand', 39.99, 70),
('USB-C Hub', 'Multiport USB-C hub', 45.50, 60),
('Noise Cancelling Headphones', 'Over-ear wireless headphones', 120.00, 40);

INSERT INTO orders(customer_id, order_date, total_amount, status) VALUES
(1, '2024-01-10', 115.98, 'Completed'),
(2, '2024-01-12', 39.99, 'Completed'),
(3, '2024-01-15', 120.00, 'Pending'),
(4, '2024-01-18', 71.49, 'Shipped'),
(5, '2024-01-20', 25.99, 'Completed');

INSERT INTO order_items(order_id, product_id, quantity, price) VALUES
(1,1,2,25.99),
(1,2,1,89.99),
(3,5,1,120.00),
(4,4,1,45.50),
(4,1,1,25.99),
(5,1,1,25.99);