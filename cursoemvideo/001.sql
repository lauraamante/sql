-- Aprimoramento de estrutura
create database cadastro
default character set utf8 -- constraint de codificação de caracteres padrão
default collate utf8_general_ci; -- constraint collate padrão

-- Criando tabela pessoas
CREATE TABLE pessoas(
  id INT NOT NULL AUTOINCREMENT,
  nome VARCHAR (30) NOT NULL,
  nascimento date, -- data
  sexo enum(M,F) -- Só permite 2 tipos
  peso decimal (5,2) -- define que vão haver 5 números, sendo dois após a vírgula
  altura (3,2);
  nacionalidade VARCHAR(20) DEFAULT 'BR',
primary key (id) 
) DEFAULT CHARSET = utf8;
