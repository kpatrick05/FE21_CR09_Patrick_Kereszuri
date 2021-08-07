
-- First quary
SELECT customers.c_firstName, customers.c_lastName FROM customers WHERE customers.customer_id 
IN (SELECT products.product_id FROM products WHERE products.p_price > "150")

--Second quary
SELECT products.product_name FROM products WHERE products.product_id 
IN (SELECT tracking.tracking_id FROM tracking WHERE tracking.shipping_time BETWEEN "2021-08-01" AND "2021-08-04");

--Third quary
SELECT COUNT(products.product_id) FROM products 
WHERE products.product_id 
IN (SELECT contacts.contact_id FROM contacts WHERE contacts.city_name = "Vienna");


--Fourth quary

SELECT products.product_name, suppliers.supplier_name, orders.order_time FROM products 
JOIN orders ON orders.product_id = products.product_id
JOIN suppliers ON suppliers.supplier_id = products.supplier_id
WHERE products.product_id 
IN (SELECT contacts.contact_id FROM contacts WHERE contacts.city_name = "Vienna");


--Fifth quary

SELECT customers.c_firstName, products.product_name, products.p_price FROM customers 
JOIN orders on orders.customer_id = customers.customer_id
JOIN products on products.product_id = orders.product_id
WHERE customers.customer_id 
IN (Select tracking.tracking_id FROM tracking WHERE tracking.recieved_time < CURRENT_DATE());
