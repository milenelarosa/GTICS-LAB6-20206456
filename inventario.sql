-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema inventario
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inventario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inventario` DEFAULT CHARACTER SET utf8 ;
USE `inventario` ;

-- -----------------------------------------------------
-- Table `inventario`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`rol` (
  `idrol` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventario`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `rol_idrol` INT NOT NULL,
  `profesor` INT NULL,
  `prestamos_idprestamos` INT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_rol_idx` (`rol_idrol` ASC) VISIBLE,
  INDEX `fk_usuario_usuario1_idx` (`profesor` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`rol_idrol`)
    REFERENCES `inventario`.`rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_usuario1`
    FOREIGN KEY (`profesor`)
    REFERENCES `inventario`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventario`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`inventario` (
  `idinventario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idinventario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventario`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`prestamos` (
  `inventario_idinventario` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  `fechainicio` DATE NOT NULL,
  `fechafin` DATE NOT NULL,
  PRIMARY KEY (`inventario_idinventario`, `usuario_idusuario`),
  INDEX `fk_inventario_has_usuario_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  INDEX `fk_inventario_has_usuario_inventario1_idx` (`inventario_idinventario` ASC) VISIBLE,
  CONSTRAINT `fk_inventario_has_usuario_inventario1`
    FOREIGN KEY (`inventario_idinventario`)
    REFERENCES `inventario`.`inventario` (`idinventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_has_usuario_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `inventario`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
