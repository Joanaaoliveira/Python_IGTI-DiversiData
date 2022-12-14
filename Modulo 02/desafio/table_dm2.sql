-- MySQL Script generated by MySQL Workbench
-- Sun Jun  5 17:04:14 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dm2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dm2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dm2` DEFAULT CHARACTER SET utf8 ;
USE `dm2` ;

-- -----------------------------------------------------
-- Table `dm2`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dm2`.`pais` (
  `cod_pais` INT NOT NULL AUTO_INCREMENT,
  `nome_pais` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dm2`.`jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dm2`.`jogo` (
  `cod_jogo` INT NOT NULL AUTO_INCREMENT,
  `nome_jogo` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_jogo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dm2`.`jogador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dm2`.`jogador` (
  `cod_jogador` INT NOT NULL AUTO_INCREMENT,
  `nome_jogador` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NULL,
  `data_nascimento` DATE NULL,
  `num_vitorias` INT NULL,
  `num_derrotas` INT NULL,
  `total_partidas` INT NULL,
  `cod_pais` INT NOT NULL,
  `cod_jogo` INT NOT NULL,
  PRIMARY KEY (`cod_jogador`),
  INDEX `fk_jogador_pais_idx` (`cod_pais` ASC) VISIBLE,
  INDEX `fk_jogador_jogo1_idx` (`cod_jogo` ASC) VISIBLE,
  CONSTRAINT `fk_jogador_pais`
    FOREIGN KEY (`cod_pais`)
    REFERENCES `dm2`.`pais` (`cod_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogador_jogo1`
    FOREIGN KEY (`cod_jogo`)
    REFERENCES `dm2`.`jogo` (`cod_jogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
