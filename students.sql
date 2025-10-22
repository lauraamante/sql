-- Criação da tabela
CREATE TABLE alunos (
  nome TEXT,
  idade INT,
  curso TEXT,
  faculdade TEXT
  );

-- Inserção de info
INSERT INTO alunos (nome, idade, curso, faculdade)
VALUES 
('Laura', 19, 'Sistemas de Informação', 'UDESC'),
('Beatriz', 23, 'Engenharia de Produção', 'UDESC'),
('Caio', 18, 'Direito', 'Univille'),
('Jonas', 42, 'Sistemas de Informação', 'Unisociesc'),
('Carolina', 32, 'Engenharia de Materiais', 'UDESC'),
('Pedro', 27, 'Direito', 'Unisociesc');

-- Ordenar os alunos por idade, do menor ao maior
SELECT * FROM alunos 
ORDER BY idade ASC;

-- Selecionar alunos com mais de 20 anos
SELECT * FROM alunos
WHERE idade > 20
