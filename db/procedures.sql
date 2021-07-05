USE geomascotas;

DELIMITER $$
USE `geomascotas`$$

CREATE PROCEDURE `USUARIOS` (
  IN _id INT,
  IN _name VARCHAR(50),
  IN _email VARCHAR(50),
  IN _phone CHAR(10),
  IN _pin CHAR(4),
  IN _answerSQ VARCHAR(45),
  IN _idSQ INT
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO USUARIOS (nombre, correo,telefonoPersonal,pin,respuestaPreguntaSecreta,PREGUNTAS_SECRETAS_ID)
    VALUES (_name, _email,_phone,_pin,_answerSQ,_idSQ);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE USUARIOS
    SET
    nombre = _name,
    correo = _email,
    telefonoPersonal=_phone,
    pin=_pin,
    respuestaPreguntaSecreta=_answerSQ,
    PREGUNTAS_SECRETAS_ID=_idSQ
    WHERE id = _id;
  END IF;

  SELECT _id AS 'id';
END

-- PROCEDIIENTO ALMACENADO PARA INSERTAR/ ACTUALIZAR MASCOTAS

USE geomascotas;

DELIMITER $$
USE `geomascotas`$$

CREATE PROCEDURE `petsAddOrEdit` (
  IN _idMascota INT,
  IN _idLocalizador INT,
  IN _idUser INT,
  IN _name VARCHAR(30),
  IN _especie VARCHAR(20),
  IN _sim VARCHAR(10)
)
BEGIN 
  IF _idMascota = 0 THEN
  INSERT INTO LOCALIZADORES(sim, latitud, longitud) VALUES (_sim, 0, 0);
  SELECT @idLocalizador := id FROM LOCALIZADORES WHERE sim=_sim;
  SELECT @idEspecie := id FROM ESPECIES WHERE especie=_especie;
  INSERT INTO MASCOTAS (nombre,USUARIOS_ID ,ESPECIES_ID, LOCALIZADORES_ID)
    VALUES (_name,_idUser,@idLocalizador,@idEspecie);

    SET _idMascota = LAST_INSERT_ID();
  ELSE
    -- Se recuperan primero los idEspecie para saber que especie es la que se se le asiganara a la mascota ahora
    SELECT @idEspecie := id FROM ESPECIES WHERE especie=_especie;

    UPDATE LOCALIZADORES
    SET
    sim = _sim
    WHERE id = _idLocalizador;

    UPDATE MASCOTAS
    SET
    nombre = _name,
    ESPECIES_ID=@idEspecie
    WHERE id = _idMascota;

  END IF;

  SELECT _idMascota AS 'id';
END