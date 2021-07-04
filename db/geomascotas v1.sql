-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema geomascotas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `geomascotas` ;

-- -----------------------------------------------------
-- Schema geomascotas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `geomascotas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci ;
USE `geomascotas` ;

-- -----------------------------------------------------
-- Table `geomascotas`.`PREGUNTAS_SECRETAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geomascotas`.`PREGUNTAS_SECRETAS` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pregunta` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geomascotas`.`USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geomascotas`.`USUARIOS` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `correo` VARCHAR(50) NOT NULL,
  `telefonoPersonal` CHAR(10) NOT NULL,
  `pin` CHAR(4) NOT NULL,
  `respuestaPreguntaSecreta` VARCHAR(45) NOT NULL,
  `PREGUNTAS_SECRETAS_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_USUARIOS_PREGUNTAS_SECRETAS1_idx` (`PREGUNTAS_SECRETAS_id` ASC) VISIBLE,
  CONSTRAINT `fk_USUARIOS_PREGUNTAS_SECRETAS1`
    FOREIGN KEY (`PREGUNTAS_SECRETAS_id`)
    REFERENCES `geomascotas`.`PREGUNTAS_SECRETAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geomascotas`.`ESPECIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geomascotas`.`ESPECIES` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `especie` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geomascotas`.`LOCALIZADORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geomascotas`.`LOCALIZADORES` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `sim` VARCHAR(10) NOT NULL,
  `latitud` VARCHAR(30) NOT NULL,
  `longitud` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `sim_UNIQUE` (`sim` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geomascotas`.`MASCOTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geomascotas`.`MASCOTAS` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `ESPECIES_id` TINYINT UNSIGNED NOT NULL,
  `LOCALIZADORES_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_MASCOTAS_ESPECIES1_idx` (`ESPECIES_id` ASC) VISIBLE,
  INDEX `fk_MASCOTAS_LOCALIZADORES1_idx` (`LOCALIZADORES_id` ASC) VISIBLE,
  CONSTRAINT `fk_MASCOTAS_ESPECIES1`
    FOREIGN KEY (`ESPECIES_id`)
    REFERENCES `geomascotas`.`ESPECIES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MASCOTAS_LOCALIZADORES1`
    FOREIGN KEY (`LOCALIZADORES_id`)
    REFERENCES `geomascotas`.`LOCALIZADORES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geomascotas`.`USUARIOS_MASCOTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geomascotas`.`USUARIOS_MASCOTAS` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `USUARIOS_id` SMALLINT UNSIGNED NOT NULL,
  `MASCOTAS_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_USUARIOS_MASCOTAS_USUARIOS1_idx` (`USUARIOS_id` ASC) VISIBLE,
  INDEX `fk_USUARIOS_MASCOTAS_MASCOTAS1_idx` (`MASCOTAS_id` ASC) VISIBLE,
  CONSTRAINT `fk_USUARIOS_MASCOTAS_USUARIOS1`
    FOREIGN KEY (`USUARIOS_id`)
    REFERENCES `geomascotas`.`USUARIOS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIOS_MASCOTAS_MASCOTAS1`
    FOREIGN KEY (`MASCOTAS_id`)
    REFERENCES `geomascotas`.`MASCOTAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `geomascotas`.`PREGUNTAS_SECRETAS`
-- -----------------------------------------------------
START TRANSACTION;
USE `geomascotas`;
INSERT INTO `geomascotas`.`PREGUNTAS_SECRETAS` (`id`, `pregunta`) VALUES (1, 'Default');

COMMIT;


-- -----------------------------------------------------
-- Data for table `geomascotas`.`USUARIOS`
-- -----------------------------------------------------
START TRANSACTION;
USE `geomascotas`;
INSERT INTO `geomascotas`.`USUARIOS` (`id`, `nombre`, `correo`, `telefonoPersonal`, `pin`, `respuestaPreguntaSecreta`, `PREGUNTAS_SECRETAS_id`) VALUES (1, 'Ociel', 'ocielgp@outlook.com', '3522071305', '1234', 'Hola', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `geomascotas`.`ESPECIES`
-- -----------------------------------------------------
START TRANSACTION;
USE `geomascotas`;
INSERT INTO `geomascotas`.`ESPECIES` (`id`, `especie`) VALUES (1, 'Perro');
INSERT INTO `geomascotas`.`ESPECIES` (`id`, `especie`) VALUES (2, 'Gato');

COMMIT;

