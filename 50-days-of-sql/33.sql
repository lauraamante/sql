--Calcula o preço médio, arredonda e dá um nome para a coluna
SELECT 
    c.category_name,
    ROUND(AVG(p.unit_price), 2) AS average_unit_price
FROM 
    categories c
    
--Liga as diferentes categorias, nome da categoria e preços na mesma linha
JOIN 
    products p ON p.category_id = c.category_id

GROUP BY 
    c.category_name
    
-- Ordena pelo preço médio, do maior para o menor
ORDER BY 
    average_unit_price DESC;
