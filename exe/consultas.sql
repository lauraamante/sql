-- Criação de tabelas
---------------------------------------------------------------------------------
-- Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

---------------------------------------------------------------------------------
-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

---------------------------------------------------------------------------------
-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

---------------------------------------------------------------------------------
-- Order items
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

----------------------------------------------------------------------------------
-- Inserir dados
INSERT INTO customers (customer_id, name, city) VALUES
(1, 'Ana Silva', 'Curitiba'),
(2, 'Bruno Lima', 'São Paulo'),
(3, 'Carla Souza', 'Florianópolis');

INSERT INTO products (product_id, product_name, category, price) VALUES
(10, 'Teclado', 'Periférico', 120),
(11, 'Mouse', 'Periférico', 70),
(12, 'Monitor', 'Vídeo', 900),
(13, 'Headset', 'Áudio', 250);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1001, 1, '2024-10-01'),
(1002, 1, '2024-10-10'),
(1003, 2, '2024-11-05'),
(1004, 3, '2024-11-08');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1001, 10, 1),
(1001, 11, 2),
(1002, 13, 1),
(1003, 12, 1),
(1004, 11, 1),
(1004, 13, 2);

---------------------------------------------------------------------------------------------
-- Manipulação de dados
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- 1 - Selecionar nome e data do pedido e calcular o preço total através 
-- da multiplicação produtos x quantidade
----------------------------------------------------------------------------------------------
SELECT 
    customers.name, -- dá para abreviar para c.
    orders.order_date, -- abreviar orders como o.
    SUM(products.price * order_items.quantity) AS total_price
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id -- Liga pelo campo que indica quem fez o pedido
JOIN order_items 
    ON orders.order_id = order_items.order_id
JOIN products 
    ON order_items.product_id = products.product_id
GROUP BY
    customers.name,
    orders.order_date;

-----------------------------------------------------------------------------------------------
-- 2 - Mostrar o nome e total gasto por cliente
-----------------------------------------------------------------------------------------------
SELECT 
    customers.name,
    SUM(products.price * order_items.quantity) AS total_price
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items 
    ON orders.order_id = order_items.order_id
JOIN products 
    ON order_items.product_id = products.product_id
GROUP BY
    customers.name;

--------------------------------------------------------------------------------------------
-- 3 - Listar a categoria e o valor médio dos produtos vendidos, 
-- ordenado do maior para o menor.
---------------------------------------------------------------------------------------------
SELECT 
    products.category,
    SUM(products.price * order_items.quantity) AS avg_price
FROM products
JOIN order_items
    ON products.product_id = order_items.product_id
JOIN orders 
    ON order_items.order_id = orders.order_id 
JOIN customers 
    ON orders.customer_id = customers.customer_id
GROUP BY 
    products.category
ORDER BY 
    avg_price DESC;

-------------------------------------------------------------------------------------------
-- 4 - Mostrar o produto mais vendido em quantidade total.
--------------------------------------------------------------------------------------------
SELECT 
    products.product_name,
    SUM(order_items.quantity) AS total_vendido
FROM products
JOIN order_items 
    ON products.product_id = order_items.product_id
GROUP BY products.product_name
ORDER BY total_vendido DESC
LIMIT 1;

--------------------------------------------------------------------------------------------
-- 5 - Mostrar todos os clientes que fizeram mais de 1 pedido
--------------------------------------------------------------------------------------------
SELECT 
    customers.name,
    COUNT(DISTINCT orders.order_id) AS total_pedidos
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.name
HAVING total_pedidos > 1;

------------------------------------------------------------------------------------------
-- 6 -  Listar todos os pedidos com o total acima de R$500.
------------------------------------------------------------------------------------------
SELECT 
    orders.order_id,
    SUM(products.price * order_items.quantity) AS total
FROM orders
JOIN order_items 
    ON orders.order_id = order_items.order_id
JOIN products 
    ON products.product_id = order_items.product_id
GROUP BY orders.order_id
HAVING total > 500;

--------------------------------------------------------------------------------------------
-- 7 - Para cada categoria, informar o total vendido (em dinheiro).
--------------------------------------------------------------------------------------------
SELECT 
    products.category,
    SUM(products.price * order_items.quantity) AS total_vendido
FROM products
JOIN order_items
    ON products.product_id = order_items.product_id
GROUP BY products.category;

------------------------------------------------------------------------------------------------
-- 8 - Mostrar os clientes que compraram “Monitor”.
------------------------------------------------------------------------------------------------
SELECT DISTINCT
    customers.name
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON products.product_id = order_items.product_id
WHERE products.product_name = 'Monitor';

--------------------------------------------------------------------------------------------------
-- 9 - Mostrar o nome do cliente e o nome do produto comprado:
-------------------------------------------------------------------------------------------------
SELECT 
    customers.name,
    products.product_name
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON products.product_id = order_items.product_id;

-----------------------------------------------------------------------------------------------
-- 10 - Mostrar o pedido mais recente de cada cliente.
-----------------------------------------------------------------------------------------------
SELECT 
    c.name,
    o.order_id,
    o.order_date
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_date = (
    SELECT MAX(order_date)
    FROM orders
    WHERE customer_id = c.customer_id
);
