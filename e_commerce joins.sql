USE e_commerce_db;

SELECT c.customer_id, 
first_name, 
last_name, 
order_date, 
product_name,
total_amount, 
quantity,
status
FROM customers c
	JOIN orders O
    ON c.customer_id = o.customer_id
    JOIN order_items oi
    ON oi.order_id = o.order_id
    JOIN products p
    ON p.product_id = oi.product_id;