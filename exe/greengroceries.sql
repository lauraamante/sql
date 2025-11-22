-- Cria a tabela verdureira
CREATE TABLE verdureira (
  id INT PRIMARY KEY,
  produto TEXT,
  categoria TEXT,
  preco REAL
);

-- Insere os valores (20)
INSERT INTO verdureira (id, produto, categoria, preco)
VALUES
(1, 'Banana', 'Fruta', 2.00),
(2, 'Pitanga', 'Fruta', 4.00),
(3, 'Abóbora', 'Fruta', 9.00),
(4, 'Feijão', 'Grão', 2.30),
(5, 'Beterraba', 'Legume', 3.90),
(6, 'Repolho', 'Verdura', 2.80),
(7, 'Pimentão', 'Legume', 4.20),
(8, 'Brócolis', 'Verdura', 6.90),
(9, 'Cebola Roxa', 'Legume', 1.99),
(10, 'Alho Poró', 'Legume', 2.50),
(11, 'Canela em pó', 'Condimento', 5.99),
(12, 'Chia', 'Grão', 11.00),
(13, 'Páprica Picante', 'Condimento', 6.75),
(14, 'Alface', 'Verdura', 3.99),
(15, 'Tomate-cereja', 'Fruta', 9.99),
(16, 'Acelga', 'Verdura', 4.30),
(17, 'Cúrcuma', 'Condimento', 2.80),
(18, 'Ervilha', 'Legume', 3.40),
(19, 'Alcachofra', 'Fruta', 7.98),
(20, 'Pitaia', 'Fruta', 12.89);

-- Seleciona os produtos que são Verdura ou Fruta
SELECT * FROM verdureira
WHERE categoria = 'Verdura' OR categoria = 'Fruta'
ORDER BY produto ASC;

-- Muda o preço do produto de id 9 para 2.10
UPDATE verdureira
SET preco = 2.10
WHERE id = 9;
