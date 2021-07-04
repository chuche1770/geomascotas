CREATE DATABASE if NOT EXISTS geo_pets;
use geo_pets ;


-- -----------------------------------------------------
-- Table `GeoMascotas`.`Especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ESPECIE (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `GeoMascotas`.`Pregunta_Secreta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PREGUNTA_S (
  idPreguntaSecreta TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pregunta` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idPreguntaSecreta`));

-- -----------------------------------------------------
-- Table `GeoMascotas`.`Registro_Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS USUARIOS (
  `idUsuario` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `correo` VARCHAR(50) NOT NULL,
  `telefonoPersonal` VARCHAR(10) NOT NULL,
  `pin` CHAR(4) NOT NULL,
  idPreguntaSecreta TINYINT UNSIGNED NOT NULL,
  respuesta VARCHAR(40),
  PRIMARY KEY (`idUsuario`),
  INDEX (idPreguntaSecreta),
  FOREIGN KEY (idPreguntaSecreta) REFERENCES PREGUNTA_S(idPreguntaSecreta
  )) ;

-- -----------------------------------------------------
-- Table `GeoMascotas`.`GPS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LOCALIZACION (
  `idNumChip` VARCHAR(10) NOT NULL,
  `Latitud` VARCHAR(30) NOT NULL,
  `Longitud` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idNumChip`)
);


-- -----------------------------------------------------
-- Table `GeoMascotas`.`Registro_Mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS MASCOTAS (
  `idMascota` SMALLINT UNSIGNED NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `idEspecie` TINYINT UNSIGNED NOT NULL,
  `idNumChip` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idMascota`),
  FOREIGN KEY (idNumChip) REFERENCES LOCALIZACION(idNumChip),
  FOREIGN KEY (idEspecie) REFERENCES ESPECIE(id));


