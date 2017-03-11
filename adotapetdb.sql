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
  `idPET` INT NOT NULL,
  `Nome ou Apelido` VARCHAR(12) NULL,
  `Espécie` VARCHAR(10) NULL,
  `Raça` VARCHAR(16) NULL,
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
-- Table `ADOTAPETDB`.`Endereço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`Endereço` (
  `idEndereço` INT NOT NULL,
  `CEP` INT(8) NULL,
  `Rua` VARCHAR(45) NULL,
  `Número` INT(3) NULL,
  `Cidade` VARCHAR(20) NULL,
  `Estado` VARCHAR(20) NULL,
  `País` VARCHAR(15) NULL,
  PRIMARY KEY (`idEndereço`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ADOTAPETDB`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`Pessoa` (
  `CPF` INT(11) NOT NULL,
  `Nome` VARCHAR(20) NULL,
  `RG` INT(12) NULL,
  `Idade` INT(2) NULL,
  `Adotante_idAdotante` INT NOT NULL,
  `Endereço_idEndereço` INT NOT NULL,
  PRIMARY KEY (`CPF`, `Adotante_idAdotante`, `Endereço_idEndereço`),
  INDEX `fk_Pessoa_Adotante1_idx` (`Adotante_idAdotante` ASC),
  INDEX `fk_Pessoa_Endereço1_idx` (`Endereço_idEndereço` ASC),
  CONSTRAINT `fk_Pessoa_Adotante1`
    FOREIGN KEY (`Adotante_idAdotante`)
    REFERENCES `ADOTAPETDB`.`Adotante` (`idAdotante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_Endereço1`
    FOREIGN KEY (`Endereço_idEndereço`)
    REFERENCES `ADOTAPETDB`.`Endereço` (`idEndereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ADOTAPETDB`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`Empresa` (
  `CNPJ` INT(14) NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `Nome Fantasia` VARCHAR(45) NULL,
  `Adotante_idAdotante` INT NOT NULL,
  `Endereço_idEndereço` INT NOT NULL,
  PRIMARY KEY (`CNPJ`, `Adotante_idAdotante`, `Endereço_idEndereço`),
  INDEX `fk_Empresa_Adotante1_idx` (`Adotante_idAdotante` ASC),
  INDEX `fk_Empresa_Endereço1_idx` (`Endereço_idEndereço` ASC),
  CONSTRAINT `fk_Empresa_Adotante1`
    FOREIGN KEY (`Adotante_idAdotante`)
    REFERENCES `ADOTAPETDB`.`Adotante` (`idAdotante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empresa_Endereço1`
    FOREIGN KEY (`Endereço_idEndereço`)
    REFERENCES `ADOTAPETDB`.`Endereço` (`idEndereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ADOTAPETDB`.`Contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ADOTAPETDB`.`Contato` (
  `idContato` INT NOT NULL,
  `Telefone` INT(10) NULL,
  `E-mail` VARCHAR(45) NULL,
  `Empresa_CNPJ` INT(14) NOT NULL,
  `Empresa_Adotante_idAdotante` INT NOT NULL,
  `Pessoa_CPF` INT(11) NOT NULL,
  `Pessoa_Adotante_idAdotante` INT NOT NULL,
  PRIMARY KEY (`idContato`, `Empresa_CNPJ`, `Empresa_Adotante_idAdotante`, `Pessoa_CPF`, `Pessoa_Adotante_idAdotante`),
  INDEX `fk_Contato_Empresa1_idx` (`Empresa_CNPJ` ASC, `Empresa_Adotante_idAdotante` ASC),
  INDEX `fk_Contato_Pessoa1_idx` (`Pessoa_CPF` ASC, `Pessoa_Adotante_idAdotante` ASC),
  CONSTRAINT `fk_Contato_Empresa1`
    FOREIGN KEY (`Empresa_CNPJ` , `Empresa_Adotante_idAdotante`)
    REFERENCES `ADOTAPETDB`.`Empresa` (`CNPJ` , `Adotante_idAdotante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contato_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF` , `Pessoa_Adotante_idAdotante`)
    REFERENCES `ADOTAPETDB`.`Pessoa` (`CPF` , `Adotante_idAdotante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;