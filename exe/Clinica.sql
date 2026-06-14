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
