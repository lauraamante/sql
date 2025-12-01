
SELECT 
    c.category_name,
    ROUND(AVG(p.unit_price), 2) AS average_unit_price

FROM 
    categories c
JOIN 
    products p ON p.category_id = c.category_id
