-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema andersonGas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema andersonGas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `andersonGas` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema rascunho
-- -----------------------------------------------------
USE `andersonGas` ;

-- -----------------------------------------------------
-- Table `andersonGas`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `andersonGas`.`endereco` (
  `id_endereco` INT NOT NULL,
  `CEP` VARCHAR(8) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `numero` INT NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  UNIQUE INDEX `id_endereco_UNIQUE` (`id_endereco` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `andersonGas`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `andersonGas`.`clientes` (
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(9) NOT NULL,
  `endereco_id_endereco` INT NOT NULL,
  PRIMARY KEY (`nome`, `endereco_id_endereco`),
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE,
  INDEX `fk_clientes_endereco_idx` (`endereco_id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_endereco`
    FOREIGN KEY (`endereco_id_endereco`)
    REFERENCES `andersonGas`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `andersonGas`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `andersonGas`.`inventario` (
  `nome_produto` VARCHAR(45) NOT NULL,
  `codigo_produto` INT NOT NULL,
  `preco_de_compra` VARCHAR(45) NOT NULL,
  `preco_de_venda` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`nome_produto`),
  UNIQUE INDEX `codigo_produto_UNIQUE` (`codigo_produto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `andersonGas`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `andersonGas`.`pedidos` (
  `id_pedido` INT NOT NULL,
  `data_pedido` DATE NOT NULL,
  `clientes_nome` VARCHAR(100) NOT NULL,
  `clientes_endereco_id_endereco` INT NOT NULL,
  `inventario_nome_produto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedidos_clientes1_idx` (`clientes_nome` ASC, `clientes_endereco_id_endereco` ASC) VISIBLE,
  INDEX `fk_pedidos_inventario1_idx` (`inventario_nome_produto` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`clientes_nome` , `clientes_endereco_id_endereco`)
    REFERENCES `andersonGas`.`clientes` (`nome` , `endereco_id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_inventario1`
    FOREIGN KEY (`inventario_nome_produto`)
    REFERENCES `andersonGas`.`inventario` (`nome_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
