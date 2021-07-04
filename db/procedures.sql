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