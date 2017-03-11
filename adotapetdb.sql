-- MySQL Script generated by MySQL Workbench
-- Sáb 11 Mar 2017 00:41:19 BRT
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ADOTAPETDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ADOTAPETDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ADOTAPETDB` DEFAULT CHARACTER SET utf8 ;
USE `ADOTAPETDB` ;

-- -----------------------------------------------------
-- Table `ADOTAPETDB`.`Adotante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`Adotante` (
  `idAdotante` INT NOT NULL AUTO_INCREMENT,
  `isDoador` TINYINT UNSIGNED NULL,
  PRIMARY KEY (`idAdotante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ADOTAPETDB`.`PET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`PET` (
  `idPET` INT NOT NULL AUTO_INCREMENT,
  `Nome ou Apelido` VARCHAR(12) NULL,
  `Especie` VARCHAR(10) NULL,
  `Raca` VARCHAR(16) NULL,
  `Sexo` VARCHAR(6) NULL,
  `Porte` VARCHAR(8) NULL,
  `Idade Estimada` INT NULL,
  `Cor da Pelagem` VARCHAR(8) NULL,
  `isCastrado` TINYINT NULL,
  `Sinais/Marcas Particulares` VARCHAR(45) NULL,
  `Adotante_idAdotante` INT NOT NULL,
  PRIMARY KEY (`idPET`, `Adotante_idAdotante`),
  INDEX `fk_PET_Adotante1_idx` (`Adotante_idAdotante` ASC),
  CONSTRAINT `fk_PET_Adotante1`
    FOREIGN KEY (`Adotante_idAdotante`)
    REFERENCES `ADOTAPETDB`.`Adotante` (`idAdotante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ADOTAPETDB`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `CEP` INT(8) NULL,
  `Rua` VARCHAR(45) NULL,
  `Numero` INT(3) NULL,
  `Cidade` VARCHAR(20) NULL,
  `Estado` VARCHAR(20) NULL,
  `Pais`VARCHAR(15) NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ADOTAPETDB`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`Pessoa` (
  `idPessoa` INT(11) NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(60) NOT NULL,
  `Nome` VARCHAR(20) NULL,
  `RG` VARCHAR(60) NULL,
  `Idade` INT(2) NULL,
  `Senha` VARCHAR(100) NOT NULL,
  `Adotante_idAdotante` INT NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idPessoa`, `Adotante_idAdotante`, `Endereco_idEndereco`),
  INDEX `fk_Pessoa_Adotante1_idx` (`Adotante_idAdotante` ASC),
  INDEX `fk_Pessoa_Endereco1_idx` (`Endereco_idEndereco` ASC),
  CONSTRAINT `fk_Pessoa_Adotante1`
    FOREIGN KEY (`Adotante_idAdotante`)
    REFERENCES `ADOTAPETDB`.`Adotante` (`idAdotante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `ADOTAPETDB`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ADOTAPETDB`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`Empresa` (
  `CNPJ` INT(14) NOT NULL,
  `Razao Social` VARCHAR(45) NULL,
  `Nome Fantasia` VARCHAR(45) NULL,
  `Senha` VARCHAR(100) NOT NULL,
  `Adotante_idAdotante` INT NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`CNPJ`, `Adotante_idAdotante`, `Endereco_idEndereco`),
  INDEX `fk_Empresa_Adotante1_idx` (`Adotante_idAdotante` ASC),
  INDEX `fk_Empresa_Endereco1_idx` (`Endereco_idEndereco` ASC),
  CONSTRAINT `fk_Empresa_Adotante1`
    FOREIGN KEY (`Adotante_idAdotante`)
    REFERENCES `ADOTAPETDB`.`Adotante` (`idAdotante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empresa_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `ADOTAPETDB`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ADOTAPETDB`.`Contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`Contato` (
  `idContato` INT NOT NULL AUTO_INCREMENT,
  `Telefone` INT(10) NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idContato`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
