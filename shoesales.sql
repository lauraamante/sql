-- Cria a tabela vendas
CREATE TABLE vendas(
  id INT PRIMARY KEY,
  produto TEXT,
  preco REAL,
  quantidade INT,
  data_venda TEXT
);

-- Insere os produtos e informações adicionais
INSERT INTO vendas(id, produto, preco, quantidade, data_venda)
VALUES
(1, 'Sandália Anabela', 78.90, 12, '2025-12-05'),
(2, 'Tênis', 399.99, 5, '2025-10-01'),
(3, 'Salto Scarpin', 289.80, '2025-11-10'),
(4, 'Tamanco', 47.99, '2025-12-03'),
(5, 'Chinelo', 25.50, '2025-15-08'),
(6, 'Coturno', 79.99, '2025-23-11');


-- Seleciona todos os valores em que o preço é maior que 100,00
SELECT * FROM vendas
WHERE preco > 100.00;

--Ordena os valores em ordem decrescente, de acordo com a data
SELECT * FROM vendas
ORDER BY data_venda DESC;

-- Atualiza o valor de todos os produtos que possuem o nome "Tamanco"
UPDATE vendas
SET preco = 50.00
WHERE produto = 'Tamanco';

-- deleta todos os itens com o id = 5
DELETE FROM vendas
WHERE id = 5;

SELECT * FROM vendas
ORDER BY produto;
