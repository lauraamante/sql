--Criar tablela clientes
CREATE TABLE clientes(
  id_cliente INT PRIMARY KEY,
  nome TEXT,
  cidade TEXT,
  estado TEXT;

--Criar tabela vendas
CREATE TABLE vendas(
  id_venda INT PRIMARY KEY,
  id_cliente INT,
  produto TEXT,
  valor REAL,
  data_venda TEXT,
  FOREIGN KEY (id_cliente) REFERENCES (id_cliente)
  );

--Inserindo valores na tabela clientes
INSERT INTO clientes (id_cliente, nome, cidade)
VALUES
(1, 'Regina','Curitiba', 'PR')
(2, 'Cássio', 'Florianópolis', 'SC')
(3, 'Pedro', 'Joinville', 'SC')
(4, 'Gabriela', 'Joinville','SC')
(5, 'João', 'Balneario Camboriú','SC')
(6, 'Carla', 'Curitiba','PR')
(7, 'Fernanda','São José dos Campos','SC')
(8, 'Caio', 'Santa Cecília','SC')
(9, 'Pedro', 'Cascavel','PR')
(10, 'Amanda','Maringá','PR')

-- Inserindo valores na tebla vendas
INSERT INTO vendas (id_venda, id_cliente, produto, valor, data_venda)
  VALUES
  (1,5, 'Boné', 59.90, '2025-10-11')
  (2,3, 'Chapéu', 45.50, '2025-09-08')
  (3,1, 'Chinelo', 25.99, '2025-10-11')
  (4,9, 'Fones', 89.90, '2025-09-15')
  (5,2, 'Tênis', 299.90, '2025-09-25')
  (6,4, 'Chinelo', 25.99, '2025-09-11')
  (7,6, 'Relógio', 38.90, '2025-10-19')
  (8,8, 'Pulseira', 4.50, '2025-10-22')
  (9,7, 'Relógio', 38.90, '2025-09-04')
  (10,10, 'Anel', 7.99, '2025-08-24')

-- Seleciona todas as vendas com o nome do cliente
SELECT
  vendas.id_venda,
  clientes.nome AS cliente,
  vendas.produto,
  vendas.valor,
  vendas.data_venda
FROM vendas
JOIN clientes ON vendas.id_cliente = clientes.id_cliente;

--Ver total de compras por cliente
SELECT 
  clientes.nome,
  SUM(vendas.valor) AS total_gasto
FROM vendas
JOIN clientes ON vendas.id_cliente = clientes.id_cliente
GROUP BY clientes.nome;

-- Seleciona as vendas feitas para SC
SELECT 
  vendas.produto, 
  vendas.valor,
  clientes.cidade
FROM vendas
JOIN clientes ON vendas.id_cliente = clientes.id_cliente
WHERE clientes.estado = 'SC';
  
  
