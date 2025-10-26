-- Criando tabela
CREATE TABLE produtos(
   id INT PRIMARY KEY,
   nome TEXT,
   preco REAL,
   categoria TEXT
);
 
-- Inserindo produtos na tabela
INSERT INTO produtos (id, nome, preco, categoria)
VALUES 
(1, 'Tênis', 499.98, 'calcado'),
(2, 'Mochila', 149.90, 'bolsa'),
(3, 'Carteira', 47.90, 'bolsa'),
(4, 'Sandália', 76.99, 'calcado'),
(5, 'Óculos', 78.90, 'acessorio'),
(6, 'Relógio', 50.00, 'acessorio'),
(7, 'Camiseta polo', 23.99, 'vestuario'),
(8, 'Boné', 62.50, 'acessorio'),
(9, 'Short de academia', 45.00, 'vestuario'),
(10, 'Blusão', 48.90, 'vestuario');

-- Ver toda a tabela produtos
SELECT * FROM produtos;

-- Seleciona todos os produtos de vestuári
SELECT * FROM produtos 
WHERE categoria = 'vestuario';

-- Deletar o produto com o id 3
DELETE FROM produtos 
WHERE id = 3;

-- Atualizar preço
UPDATE produtos SET preco = 189.90 WHERE id = 2;

-- Seleciona o nome e preço de produtos que custam menos de R$80,00 e ordena do menor ao maior preço
SELECT nome, preco FROM produtos 
WHERE preco < 80 
ORDER BY preco ASC;
