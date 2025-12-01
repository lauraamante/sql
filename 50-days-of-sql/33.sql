
SELECT 
    c.category_name,
    ROUND(AVG(p.unit_price), 2) AS average_unit_price

