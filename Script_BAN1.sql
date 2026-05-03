-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Multa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Multa` (
  `AIT` INT NOT NULL,
  `tipo_infracao` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AIT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `CPF` INT(11) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Numero` INT(5) NULL,
  `AIT_multa` INT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  INDEX `AIT_multa_idx` (`AIT_multa` ASC) VISIBLE,
  CONSTRAINT `AIT_multa`
    FOREIGN KEY (`AIT_multa`)
    REFERENCES `mydb`.`Multa` (`AIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `id_venda` INT NOT NULL AUTO_INCREMENT,
  `valor_final` VARCHAR(45) NULL,
  `data` DATE NULL,
  `forma_pagamento` VARCHAR(15) NULL,
  `CPF_clientes` INT NULL,
  PRIMARY KEY (`id_venda`),
  INDEX `CPF_clientes_idx` (`CPF_clientes` ASC) VISIBLE,
  CONSTRAINT `CPF_clientes`
    FOREIGN KEY (`CPF_clientes`)
    REFERENCES `mydb`.`Clientes` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Veiculo Locação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Veiculo Locação` (
  `Placa` INT NOT NULL,
  `Chassi` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Cor` VARCHAR(45) NOT NULL,
  `Ano de Fabricação` DATE NOT NULL,
  `Quilometragem` VARCHAR(45) NOT NULL,
  `Combustível` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Placa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Locação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Locação` (
  `id_locação` INT NOT NULL,
  `Placa_locação` INT NOT NULL,
  `valor_diaria` DECIMAL(7) NOT NULL,
  `valor_total_previsto` DECIMAL(7) NOT NULL,
  `valor_total_real` DECIMAL(7) NOT NULL,
  `condições_contrato` VARCHAR(45) NOT NULL,
  `data_devolução` DATE NOT NULL,
  `data__retirada` DATE NOT NULL,
  `situacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_locação`, `Placa_locação`),
  UNIQUE INDEX `id_locação_UNIQUE` (`id_locação` ASC) VISIBLE,
  INDEX `Placa_locação_idx` (`Placa_locação` ASC) VISIBLE,
  CONSTRAINT `Placa_locação`
    FOREIGN KEY (`Placa_locação`)
    REFERENCES `mydb`.`Veiculo Locação` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionário` (
  `id_funcionário` INT NOT NULL AUTO_INCREMENT,
  `CPF` INT(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_funcionário`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `id_funcionário_UNIQUE` (`id_funcionário` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EnvolveLoc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EnvolveLoc` (
  `CPF_clientes` INT NOT NULL,
  `id_locação` INT NOT NULL,
  PRIMARY KEY (`CPF_clientes`, `id_locação`),
  INDEX `id_locação_idx` (`id_locação` ASC) VISIBLE,
  CONSTRAINT `CPF`
    FOREIGN KEY (`CPF_clientes`)
    REFERENCES `mydb`.`Clientes` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_locação`
    FOREIGN KEY (`id_locação`)
    REFERENCES `mydb`.`Locação` (`id_locação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Atendente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Atendente` (
  `cod_atendente` INT NOT NULL,
  `id_funcionario` INT NOT NULL,
  UNIQUE INDEX `id_funcionario_UNIQUE` (`id_funcionario` ASC) VISIBLE,
  PRIMARY KEY (`cod_atendente`),
  UNIQUE INDEX `cod_atendente_UNIQUE` (`cod_atendente` ASC) VISIBLE,
  CONSTRAINT `id_funcionario`
    FOREIGN KEY (`id_funcionario`)
    REFERENCES `mydb`.`Funcionário` (`id_funcionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `cod_vendedor` INT NOT NULL,
  `id_funcionario` INT NOT NULL,
  `comissão` INT NOT NULL,
  PRIMARY KEY (`cod_vendedor`),
  CONSTRAINT `id_funcionario`
    FOREIGN KEY (`id_funcionario`)
    REFERENCES `mydb`.`Funcionário` (`id_funcionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VendedorVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VendedorVenda` (
  `cod_Vendedor` INT NOT NULL,
  `id_venda` INT NOT NULL,
  PRIMARY KEY (`cod_Vendedor`, `id_venda`),
  INDEX `id_venda_idx` (`id_venda` ASC) VISIBLE,
  CONSTRAINT `cod_funcionario`
    FOREIGN KEY (`cod_Vendedor`)
    REFERENCES `mydb`.`Vendedor` (`cod_vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_venda`
    FOREIGN KEY (`id_venda`)
    REFERENCES `mydb`.`Venda` (`id_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AtendenteLocação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AtendenteLocação` (
  `cod_atendente` INT NOT NULL,
  `id_locação` INT NOT NULL,
  PRIMARY KEY (`cod_atendente`, `id_locação`),
  INDEX `id_locação_idx` (`id_locação` ASC) VISIBLE,
  CONSTRAINT `cod_atendente`
    FOREIGN KEY (`cod_atendente`)
    REFERENCES `mydb`.`Atendente` (`cod_atendente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_locação`
    FOREIGN KEY (`id_locação`)
    REFERENCES `mydb`.`Locação` (`id_locação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VeiculoVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VeiculoVenda` (
  `Placa` INT NOT NULL,
  `id_venda` INT NULL,
  `Chassi` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Ano de Fabricação` DATE NOT NULL,
  `Combustivel` VARCHAR(45) NOT NULL,
  `Quilometragem` INT NOT NULL,
  `Valor_Venda` DECIMAL NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Placa`),
  INDEX `id_venda_idx` (`id_venda` ASC) VISIBLE,
  CONSTRAINT `id_venda`
    FOREIGN KEY (`id_venda`)
    REFERENCES `mydb`.`Venda` (`id_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefones` (
  `CPF_Cliente` INT NOT NULL,
  `idtelefone` VARCHAR(45) NOT NULL,
  `telefone1` VARCHAR(45) NOT NULL,
  `telefone2` VARCHAR(45) NULL,
  PRIMARY KEY (`CPF_Cliente`, `idtelefone`),
  CONSTRAINT `CPF_Cliente`
    FOREIGN KEY (`CPF_Cliente`)
    REFERENCES `mydb`.`Clientes` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gera Multa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gera Multa` (
  `AIT` INT NOT NULL,
  `id_locação` INT NULL,
  PRIMARY KEY (`AIT`),
  INDEX `id_locação_idx` (`id_locação` ASC) VISIBLE,
  CONSTRAINT `AIT`
    FOREIGN KEY (`AIT`)
    REFERENCES `mydb`.`Multa` (`AIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_locação`
    FOREIGN KEY (`id_locação`)
    REFERENCES `mydb`.`Locação` (`id_locação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PagamentoLoc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PagamentoLoc` (
  `cod_pgto_locaçao` INT NOT NULL,
  PRIMARY KEY (`cod_pgto_locaçao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PagamentoVen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PagamentoVen` (
  `cod_pgto_venda` INT NOT NULL,
  PRIMARY KEY (`cod_pgto_venda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Realiza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Realiza` (
  `cod_pgto_locaçao` INT NOT NULL,
  `CPF_cliente` INT(11) NOT NULL,
  `id_locação` INT NOT NULL,
  PRIMARY KEY (`cod_pgto_locaçao`),
  INDEX `CPF_cliente_idx` (`CPF_cliente` ASC) VISIBLE,
  INDEX `id_locação_idx` (`id_locação` ASC) VISIBLE,
  CONSTRAINT `cod_pgto_locaçao`
    FOREIGN KEY (`cod_pgto_locaçao`)
    REFERENCES `mydb`.`PagamentoLoc` (`cod_pgto_locaçao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CPF_cliente`
    FOREIGN KEY (`CPF_cliente`)
    REFERENCES `mydb`.`Clientes` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_locação`
    FOREIGN KEY (`id_locação`)
    REFERENCES `mydb`.`Locação` (`id_locação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Realiza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Realiza` (
  `cod_pgto_locaçao` INT NOT NULL,
  `CPF_cliente` INT(11) NOT NULL,
  `id_locação` INT NOT NULL,
  PRIMARY KEY (`cod_pgto_locaçao`),
  INDEX `CPF_cliente_idx` (`CPF_cliente` ASC) VISIBLE,
  INDEX `id_locação_idx` (`id_locação` ASC) VISIBLE,
  CONSTRAINT `cod_pgto_locaçao`
    FOREIGN KEY (`cod_pgto_locaçao`)
    REFERENCES `mydb`.`PagamentoLoc` (`cod_pgto_locaçao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CPF_cliente`
    FOREIGN KEY (`CPF_cliente`)
    REFERENCES `mydb`.`Clientes` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_locação`
    FOREIGN KEY (`id_locação`)
    REFERENCES `mydb`.`Locação` (`id_locação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pgto Parcelado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pgto Parcelado` (
  `cod_pgto_venda` INT NOT NULL,
  `qtd_parcelas` INT(2) NOT NULL,
  `valor_parcelas` DECIMAL NOT NULL,
  PRIMARY KEY (`cod_pgto_venda`),
  CONSTRAINT `cod_pgto_venda`
    FOREIGN KEY (`cod_pgto_venda`)
    REFERENCES `mydb`.`PagamentoVen` (`cod_pgto_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pgto A Vista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pgto A Vista` (
  `cod_pgto_venda` INT NOT NULL,
  PRIMARY KEY (`cod_pgto_venda`),
  CONSTRAINT `cod_pgto_venda`
    FOREIGN KEY (`cod_pgto_venda`)
    REFERENCES `mydb`.`PagamentoVen` (`cod_pgto_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pgto A Vista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pgto A Vista` (
  `cod_pgto_venda` INT NOT NULL,
  PRIMARY KEY (`cod_pgto_venda`),
  CONSTRAINT `cod_pgto_venda`
    FOREIGN KEY (`cod_pgto_venda`)
    REFERENCES `mydb`.`PagamentoVen` (`cod_pgto_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pgto Parcelado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pgto Parcelado` (
  `cod_pgto_venda` INT NOT NULL,
  `qtd_parcelas` INT(2) NOT NULL,
  `valor_parcelas` DECIMAL NOT NULL,
  PRIMARY KEY (`cod_pgto_venda`),
  CONSTRAINT `cod_pgto_venda`
    FOREIGN KEY (`cod_pgto_venda`)
    REFERENCES `mydb`.`PagamentoVen` (`cod_pgto_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
