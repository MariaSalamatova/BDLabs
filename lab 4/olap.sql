SELECT COUNT(*) AS total_product
FROM Product;

SELECT MIN(price) AS minimum_price
FROM Product;

SELECT SUM(price) AS total_price
FROM Product
WHERE categories = 'Побутова техніка';

SELECT categories, COUNT(*) AS total_categoies
FROM Product
GROUP BY categories;

SELECT delivery_method, COUNT(*) AS total_delivermethods
FROM Delivery
GROUP BY delivery_method
HAVING COUNT(*) < 2;

SELECT delivery_method, COUNT(*) AS total_delivermethods
FROM Delivery
WHERE order_status = 'В дорозі'
GROUP BY delivery_status
HAVING COUNT(*) >= 2;

SELECT 
    o.order_id,
    u.name,
    u.surname,
    d.delivery_method,
    d.order_status,
    o.total_price
FROM Orders o
INNER JOIN Cart c ON o.cart_id = c.user_id
INNER JOIN Users u ON c.user_id = u.user_id
INNER JOIN Delivery d ON o.delivery_id = d.delivery_id;

SELECT 
    p.product_name,
    p.price,
    p.info,
    c.category_name
FROM Product p
LEFT JOIN Category c 
    ON p.categories = c.category_name;

SELECT
    o.order_id,
    o.status,
    pay.payment_method,
    pay.payment_status
FROM Payment pay
RIGHT JOIN Orders o 
    ON o.payment_id = pay.payment_id;

SELECT 
    u.user_id,
    u.name,
    u.surname,
    (
        SELECT COUNT(*) 
        FROM Cart c 
        WHERE c.user_id = u.user_id
    ) AS cart_count
FROM Users u;

SELECT 
    order_id,
    total_price,
    delivery_date
FROM Orders
WHERE total_price > (
    SELECT AVG(total_price)
    FROM Orders
);

SELECT 
    status,
    COUNT(*) AS count_orders
FROM Orders
GROUP BY status
HAVING COUNT(*) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM Orders
        GROUP BY status
    ) AS counts
);