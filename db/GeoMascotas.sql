-- MySQL Script generated by MySQL Workbench
-- Wed Jun 23 14:49:09 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GeoMascotas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GeoMascotas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GeoMascotas` DEFAULT CHARACTER SET utf8 ;
USE `GeoMascotas` ;

-- -----------------------------------------------------
-- Table `GeoMascotas`.`Especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GeoMascotas`.`Especie` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GeoMascotas`.`GPS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GeoMascotas`.`GPS` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(10) NOT NULL,
  `Latitud` VARCHAR(30) NOT NULL,
  `Longitud` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Numero_UNIQUE` (`Numero` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GeoMascotas`.`Registro_Mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GeoMascotas`.`Registro_Mascotas` (
  `id` SMALLINT UNSIGNED NOT NULL,
  `Nombre` VARCHAR(25) NOT NULL,
  `Foto` LONGBLOB NULL,
  `Especie_id` TINYINT UNSIGNED NOT NULL,
  `GPS_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Registro_Mascotas_Especie1_idx` (`Especie_id` ASC) VISIBLE,
  INDEX `fk_Registro_Mascotas_GPS1_idx` (`GPS_id` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Mascotas_Especie1`
    FOREIGN KEY (`Especie_id`)
    REFERENCES `GeoMascotas`.`Especie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Mascotas_GPS1`
    FOREIGN KEY (`GPS_id`)
    REFERENCES `GeoMascotas`.`GPS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GeoMascotas`.`Registro_Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GeoMascotas`.`Registro_Usuarios` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(30) NOT NULL,
  `Correo` VARCHAR(50) NOT NULL,
  `Telefono_Personal` VARCHAR(10) NOT NULL,
  `Pin` CHAR(4) NOT NULL,
  `Registro_Mascotas_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Registro_Usuarios_Registro_Mascotas1_idx` (`Registro_Mascotas_id` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Usuarios_Registro_Mascotas1`
    FOREIGN KEY (`Registro_Mascotas_id`)
    REFERENCES `GeoMascotas`.`Registro_Mascotas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GeoMascotas`.`Pregunta_Secreta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GeoMascotas`.`Pregunta_Secreta` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GeoMascotas`.`Respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GeoMascotas`.`Respuesta` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(30) NOT NULL,
  `Registro_Usuarios_id` SMALLINT UNSIGNED NOT NULL,
  `Pregunta_Secreta_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Respuesta_Registro_Usuarios1_idx` (`Registro_Usuarios_id` ASC) VISIBLE,
  INDEX `fk_Respuesta_Pregunta_Secreta1_idx` (`Pregunta_Secreta_id` ASC) VISIBLE,
  CONSTRAINT `fk_Respuesta_Registro_Usuarios1`
    FOREIGN KEY (`Registro_Usuarios_id`)
    REFERENCES `GeoMascotas`.`Registro_Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Respuesta_Pregunta_Secreta1`
    FOREIGN KEY (`Pregunta_Secreta_id`)
    REFERENCES `GeoMascotas`.`Pregunta_Secreta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
