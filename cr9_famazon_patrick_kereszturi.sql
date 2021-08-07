
-- First quary
-- Print customers first and lastname where p_price is bigger than 150
SELECT customers.c_firstName, customers.c_lastName FROM customers WHERE customers.customer_id 
IN (SELECT products.product_id FROM products WHERE products.p_price > "150")

--Second quary
--Print products name where shipping id is between 2021-08-01 and 2021-08-04
SELECT products.product_name FROM products WHERE products.product_id 
IN (SELECT tracking.tracking_id FROM tracking WHERE tracking.shipping_time BETWEEN "2021-08-01" AND "2021-08-04");

--Third quary
--print the number of producets where will be shipped to Vienna
SELECT COUNT(products.product_id) FROM products 
WHERE products.product_id 
IN (SELECT contacts.contact_id FROM contacts WHERE contacts.city_name = "Vienna");


--Fourth quary
--print productName, supplier_name, order_time wher will be shipped to Vienna
SELECT products.product_name, suppliers.supplier_name, orders.order_time FROM products 
JOIN orders ON orders.product_id = products.product_id
JOIN suppliers ON suppliers.supplier_id = products.supplier_id
WHERE products.product_id 
IN (SELECT contacts.contact_id FROM contacts WHERE contacts.city_name = "Vienna");


--Fifth quary
--print customers first name lastname product name and product price where tracking_recieved time is less then today`s date
SELECT customers.c_firstName, customers.c_lastName, products.product_name, products.p_price FROM customers 
JOIN orders on orders.customer_id = customers.customer_id
JOIN products on products.product_id = orders.product_id
WHERE customers.customer_id 
IN (Select tracking.tracking_id FROM tracking WHERE tracking.recieved_time < CURRENT_DATE());


--Sixth quary
--print productsName, warehouse addres, and logistik arrival_time in warehouses where wareouhse has an ID

SELECT products.product_name, warehouses.w_address, logistik.arrival_time FROM products
JOIN warehouses ON warehouses.product_id = products.product_id
JOIN logistik on logistik.warehouse_id = warehouses.warehouse_id
WHERE products.product_id
IN (SELECT warehouses.warehouse_id FROM warehouses WHERE warehouses.product_id);


--Seventh  quary
--print customers first and last name, customers credictcard type, city name, invoice final and payment booking time

SELECT customers.c_firstName, customers.c_lastName, customers.c_creditCards, contacts.city_name, invoices.final_sum, payments.booking_time, orders.order_id FROM customers
JOIN contacts ON contacts.customer_id = customers.customer_id
JOIN invoices ON invoices.customer_id = customers.customer_id
JOIN payments ON payments.customer_id = customers.customer_id
join orders ON orders.customer_id = customers.customer_id
WHERE customers.c_creditCards ="MasterCard";


--Eight quary
--print suppliers name, products amount, currency, employee address, contact address where products_name = "MaxWhite"
SELECT suppliers.supplier_name, orders.product_amount, invoices.currency, employees.e_address, contacts.c_address FROM suppliers 
JOIN orders ON orders.supplier_id = suppliers.supplier_id
JOIN invoices on invoices.order_id = orders.order_id
JOIN employees on employees.order_id = orders.order_id
JOIN contacts on contacts.contact_id = employees.contact_id
WHERE suppliers.supplier_id 
IN (SELECT products.product_id FROM products WHERE products.product_name ="MaxWhite");