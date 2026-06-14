-- Aula
CREATE DATABASE Clinica;
CREATE USER
 'admin'@'localhost'
 IDENTIFIED BY '$uperAdmin';


CREATE USER
 'suporte'@'localhost'
 IDENTIFIED BY '$uportE ';


CREATE USER
 'operador'@'localhost'
 IDENTIFIED BY 'operador123 ';


CREATE USER
 'consulta'@'host';


GRANT all privileges
 ON Clinica.*
 TO 'admin'@'localhost'
 WITH GRANT OPTION;


 
 GRANT SELECT, UPDATE, INSERT, DROP ON Clinica.*
 TO 'suporte'@'localhost';

create table Ambulatorio( 
nroa int primary key, 
andar tinyint not null); 
  
create table Medicos( 
codm int primary key, 
nome varchar(50) not null, 
idade smallint not null, 
constraint idade check 
(idade >= 18), 
especialidade char(20),  
cpf decimal(11) unique not null, 
cidade varchar(30) not null, 
nroa int); 
  
create table Pacientes( 
codp int primary key, 
nome varchar(50) not null, 
idade smallint not null, 
constraint idade_p check 
(idade >= 18), 
doenca varchar(40)); 
  
create table Funcionario( 
codf int primary key, 
nome varchar(50) not null, 
idade smallint not null, 
constraint idade_f check 
(idade >= 18), 
cidade varchar(30) not null, 
salario decimal(6) default 2000 not null, 
cargo varchar(20) not null); 
  
create table Consultas( 
codm int, 
codp int not null, 
foreign key (codm)  
references Medicos(codm), 
foreign key (codp)  
references Pacientes(codp), 
data date not null, 
hora time not null, 
constraint pk primary key (codm, data, hora), 
constraint hora check 
(hora>="06:00" and hora>="21:00") 
); 

alter table Ambulatorio
add capacidade smallint not null;

alter table Pacientes 
add cidade varchar(30);

alter table Funcionario
drop column cargo;

alter table Medicos
add constraint FKAmbulatorio foreign key(nroa) references Ambulatorio (nroa);

alter table Medicos
add column ativo BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE Pacientes
DROP COLUMN doenca;

ALTER TABLE Consultas
ADD COLUMN doenca VARCHAR;


REVOKE SELECT ON clinica.Pacientes 
FROM 'consulta'@'localhost';

FLUSH PRIVILEGES;

show grants for 'consulta'@'localhost';
