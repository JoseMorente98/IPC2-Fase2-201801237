-- DROP IF EXIST DATABASE
DROP DATABASE IF EXISTS Proyecto1;

-- CREATE DATABASE
CREATE DATABASE Proyecto1;

-- USE DATABASE
USE Proyecto1;

-- CREATE TABLE TYPE OF USER
CREATE TABLE TipoUsuario(
	idTipoUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	descripcion VARCHAR(100) NULL
);

-- CREATE TABLE USER
CREATE TABLE Usuario(
	idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	carnet BIGINT NULL,
	dpi BIGINT NULL,
	email VARCHAR(100) NOT NULL,
	password VARCHAR(255) NOT NULL,
	nombre VARCHAR(100) NULL,
	apellido VARCHAR(100) NULL
);

-- CREATE TABLE DETAIL USER
CREATE TABLE DetalleUsuario(
    idDetalleUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idTipoUsuario INT NOT NULL,
    idUsuario INT NOT NULL,
    FOREIGN KEY (idTipoUsuario) REFERENCES TipoUsuario(idTipoUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);
-- CREATE TABLE CURSE
DROP TABLE IF EXISTS Curso;
CREATE TABLE Curso(
	idCurso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NULL,
	codigo VARCHAR(50) NULL,
	estado TINYINT NOT NULL
);

-- CREATE TABLE SECCION
DROP TABLE IF EXISTS Seccion;
CREATE TABLE Seccion(
	idSeccion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(10) NULL
);

-- CREATE TABLE DETAIL CURSE
DROP TABLE IF EXISTS DetalleCurso;
CREATE TABLE DetalleCurso(
    idDetalleCurso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    semestre VARCHAR(50) NULL,
	anio VARCHAR(50) NULL,
	horaInicio VARCHAR(50) NULL,
	horaFin VARCHAR(50) NULL,
    fechaFin DATETIME NOT NULL,
    idCurso INT NOT NULL,
    idSeccion INT NOT NULL,
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (idSeccion) REFERENCES Seccion(idSeccion)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREATE TABLE ASIGNAMENT AUXILIAR
DROP TABLE IF EXISTS AsignacionAuxiliar;
CREATE TABLE AsignacionAuxiliar(
    idAsignacionAuxiliar INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    idDetalleCurso INT NOT NULL,
    descripcion VARCHAR(255) NULL,
	estado TINYINT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (idDetalleCurso) REFERENCES DetalleCurso(idDetalleCurso)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREATE TABLE MESSAGES
DROP TABLE IF EXISTS Mensaje;
CREATE TABLE Mensaje(
    idMensaje INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idUsuario1 INT NOT NULL,
    idUsuario2 INT NOT NULL,
    asunto VARCHAR(255) NOT NULL,
    FOREIGN KEY (idUsuario1) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (idUsuario2) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREATE TABLE MESSAGES
DROP TABLE IF EXISTS DetalleMensaje;
CREATE TABLE DetalleMensaje(
    idDetalleMensaje INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idMensaje INT NOT NULL,
    cuerpo VARCHAR(255) NOT NULL,
    archivo BLOB NULL,
    FOREIGN KEY (idMensaje) REFERENCES Mensaje(idMensaje)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREATE TABLE FORO
DROP TABLE IF EXISTS Foro;
CREATE TABLE Foro(
    idForo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fechaFin DATETIME NOT NULL,
	idDetalleCurso INT NOT NULL,
	FOREIGN KEY (idDetalleCurso) REFERENCES DetalleCurso(idDetalleCurso)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREATE TABLE DETAIL FORO
DROP TABLE IF EXISTS DetalleForo;
CREATE TABLE DetalleForo(
    idDetalleForo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comentario VARCHAR(250) NOT NULL,
	idUsuario INT NOT NULL,
	idForo INT NOT NULL,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
	FOREIGN KEY (idForo) REFERENCES Foro(idForo)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREAR TABLA ASIGNACION ESTUDIANTE
DROP TABLE IF EXISTS AsignacionEstudiante;
CREATE TABLE AsignacionEstudiante(
    idAsignacionEstudiante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idDetalleCurso INT NOT NULL,
	idUsuario INT NOT NULL,
	FOREIGN KEY (idDetalleCurso) REFERENCES DetalleCurso(idDetalleCurso)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREATE TABLE DETAIL ACTIVIDAD
DROP TABLE IF EXISTS Actividad;
CREATE TABLE Actividad(
    idActividad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(250) NOT NULL,
    fechaLimite DATETIME NOT NULL,
    ponderacion INT NOT NULL,
    estado TINYINT NULL,
    idDetalleCurso INT NOT NULL,
	FOREIGN KEY (idDetalleCurso) REFERENCES DetalleCurso(idDetalleCurso)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- LA TABLA LE ASIGNA LA ACIVIDAD A LOS ALUMNOS
DROP TABLE IF EXISTS ActividadAlumno;
CREATE TABLE ActividadAlumno(
    idActividadAlumno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idActividad INT NOT NULL,
    idUsuario INT NOT NULL,
    entregada INT NOT NULL,
	texto VARCHAR(250) NOT NULL,
    NOTA INT NULL,
    archivo BLOB NULL,
	FOREIGN KEY (idActividad) REFERENCES Actividad(idActividad)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREAR TABLA DE TICKET
DROP TABLE IF EXISTS Ticket;
CREATE TABLE Ticket(
    idTicket INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	asunto VARCHAR(255) NOT NULL,
	mensaje VARCHAR(255) NOT NULL,
    estado TINYINT NOT NULL,
	respuesta VARCHAR(255) NULL,
    idUsuario INT NOT NULL,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREAR TABLA DE TICKET
DROP TABLE IF EXISTS Evaluacion;
CREATE TABLE Evaluacion(
    idEvaluacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
    habilitar TINYINT NULL,
    aleatorio TINYINT NULL,
    punteo INT NULL,
    idDetalleCurso INT NOT NULL,
	FOREIGN KEY (idDetalleCurso) REFERENCES DetalleCurso(idDetalleCurso)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREAR TABLA DE TICKET
DROP TABLE IF EXISTS Pregunta;
CREATE TABLE Pregunta(
    idPregunta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipoPregunta VARCHAR(100) NOT NULL,
	pregunta VARCHAR(100) NULL,
	respuesta1 VARCHAR(100) NULL,
	respuesta2 VARCHAR(100) NULL,
	respuesta3 VARCHAR(100) NULL,
    correcta VARCHAR(100) NULL,
	punteo DECIMAL NULL,
    idEvaluacion INT NOT NULL,
	FOREIGN KEY (idEvaluacion) REFERENCES Evaluacion(idEvaluacion)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREAR TABLA DE TICKET
DROP TABLE IF EXISTS Asistencia;
CREATE TABLE Asistencia(
    idAsistencia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha DATE NOT NULL,
    idDetalleCurso INT NOT NULL,
	FOREIGN KEY (idDetalleCurso) REFERENCES DetalleCurso(idDetalleCurso)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREAR TABLA DE TICKET
DROP TABLE IF EXISTS DetalleAsistencia;
CREATE TABLE DetalleAsistencia(
    idDetalleAsistencia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(100) NULL,
    idUsuario INT NOT NULL,
    idDetalleCurso INT NOT NULL,
	FOREIGN KEY (idDetalleCurso) REFERENCES DetalleCurso(idDetalleCurso)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREAR TABLA DE TICKET
DROP TABLE IF EXISTS Publicacion;
CREATE TABLE Publicacion(
    idPublicacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	descripcion VARCHAR(255) NULL,
	imagen VARCHAR(255) NULL,
	video VARCHAR(255) NULL
);

-- CREAR TABLA DE TICKET
DROP TABLE IF EXISTS MeGusta;
CREATE TABLE MeGusta(
    idMeGusta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idUsuario INT NOT NULL,
    idPublicacion INT NOT NULL,
	FOREIGN KEY (idPublicacion) REFERENCES Publicacion(idPublicacion)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- CREAR TABLA DE TICKET
DROP TABLE IF EXISTS Comentario;
CREATE TABLE Comentario(
    idComentario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comentario VARCHAR(255) NULL,
	idUsuario INT NOT NULL,
    idPublicacion INT NOT NULL,
	FOREIGN KEY (idPublicacion) REFERENCES Publicacion(idPublicacion)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- SP VER CREAR USUARIO
DELIMITER $$
CREATE PROCEDURE SP_CreateMeGusta
(IN _idUsuario INT, _idPublicacion INT)
BEGIN
	DECLARE _existe INT;
	SET _existe = (SELECT COUNT(*) FROM MeGusta WHERE idUsuario = _idUsuario AND idPublicacion = _idPublicacion);
	IF(_existe = 0) THEN
		INSERT INTO MeGusta(idUsuario, idPublicacion) VALUES (_idUsuario, _idPublicacion);
		SELECT _existe;
	ELSE
		SELECT _existe;
	END IF;
END;
$$

-- SP AGREGAR DETALLE USUARIO
DELIMITER $$
CREATE PROCEDURE SP_AsignarRol
(IN _idTipoUsuario INT, _idUsuario INT)
BEGIN
	DECLARE _existe INT;
	SET _existe = (SELECT COUNT(*) FROM DetalleUsuario WHERE idTipoUsuario = _idTipoUsuario AND idUsuario = _idUsuario);
	IF(_existe = 0) THEN
	INSERT INTO DetalleUsuario(idTipoUsuario, idUsuario) VALUES (_idTipoUsuario, _idUsuario);
		SELECT _existe;
	ELSE
		SELECT _existe;
	END IF;
END;
$$

-- SP VER DETALLE USUARIO
DELIMITER $$
CREATE PROCEDURE SP_GetUsuario
(IN _idUsuario INT)
BEGIN
	SELECT Usuario.idUsuario, Usuario.carnet, Usuario.dpi, Usuario.email, Usuario.password, 
	Usuario.nombre, Usuario.apellido, TipoUsuario.nombre AS 'tipo', TipoUsuario.idTipoUsuario FROM DetalleUsuario
		INNER JOIN Usuario ON (DetalleUsuario.idUsuario = Usuario.idUsuario)
		INNER JOIN TipoUsuario ON (DetalleUsuario.idTipoUsuario = TipoUsuario.idTipoUsuario)
		WHERE Usuario.idUsuario = _idUsuario;
END;
$$

-- SP VER AUTENTICAR
DELIMITER $$
CREATE PROCEDURE SP_Autenticar
(IN _email VARCHAR(100), _password VARCHAR(100))
BEGIN
	SELECT Usuario.idUsuario, Usuario.carnet, Usuario.dpi, Usuario.email, Usuario.password, 
	Usuario.nombre, Usuario.apellido, TipoUsuario.nombre AS 'tipo', TipoUsuario.idTipoUsuario FROM DetalleUsuario
		INNER JOIN Usuario ON (DetalleUsuario.idUsuario = Usuario.idUsuario)
		INNER JOIN TipoUsuario ON (DetalleUsuario.idTipoUsuario = TipoUsuario.idTipoUsuario)
		WHERE Usuario.email = _email AND Usuario.password = _password
        ORDER BY DetalleUsuario.idTipoUsuario;
END;
$$

-- SP VER CREAR USUARIO
DELIMITER $$
CREATE PROCEDURE SP_CreateUsuario
(IN _carnet BIGINT, _dpi BIGINT, _email VARCHAR(100), _password VARCHAR(100), _nombre VARCHAR(100), _apellido VARCHAR(100), _rol INT)
BEGIN
	DECLARE _idUsuario INT;
	INSERT INTO Usuario(carnet, dpi, email, password, nombre, apellido) 
		VALUES (_carnet, _dpi, _email, _password, _nombre, _apellido);
	SET _idUsuario = (SELECT idUsuario FROM Usuario ORDER BY idUsuario DESC LIMIT 1);
    CALL SP_AsignarRol(_rol, _idUsuario);
END;
$$

-- SP CREAR DETALLE DE CURSO
DELIMITER $$
CREATE PROCEDURE SP_CreateDetalleCurso
(IN _semestre VARCHAR(50), _anio VARCHAR(50), _horaInicio VARCHAR(50), _horaFin VARCHAR(50), _fechaFin DATETIME, _idCurso INT, _idSeccion INT)
BEGIN
	DECLARE _existe INT;
	SET _existe = (SELECT COUNT(*) FROM DetalleCurso WHERE idCurso = _idCurso AND idSeccion = _idSeccion AND anio = _anio AND semestre = _semestre);
	IF(_existe = 0) THEN
	INSERT INTO DetalleCurso(semestre, anio, horaInicio, horaFin, fechaFin, idCurso, idSeccion) VALUES (_semestre, _anio, _horaInicio, _horaFin, _fechaFin, _idCurso, _idSeccion);
		SELECT _existe;
	ELSE
		SELECT _existe;
	END IF;
END;
$$

-- SP VER CREAR USUARIO
DELIMITER $$
CREATE PROCEDURE SP_UpdateDetalleCurso
(IN _semestre VARCHAR(50), _anio VARCHAR(50), _horaInicio VARCHAR(50), _horaFin VARCHAR(50), _fechaFin DATETIME, _idCurso INT, _idSeccion INT, _idDetalleCurso INT)
BEGIN
	DECLARE _existe INT;
	SET _existe = (SELECT COUNT(*) FROM DetalleCurso WHERE idCurso = _idCurso AND idSeccion = _idSeccion AND horaInicio = _horaInicio AND horaFin = _horaFin AND semestre = _semestre);
	IF(_existe = 0) THEN
		UPDATE DetalleCurso SET semestre = _semestre, anio = _anio, horaInicio = _horaInicio, horaFin = _horaFin, fechaFin = _fechaFin,
        idCurso = _idCurso, idSeccion = _idSeccion WHERE idDetalleCurso = _idDetalleCurso;
		SELECT _existe;
	ELSE
		SELECT _existe;
	END IF;
END;
$$

-- SP VER CREAR USUARIO
DELIMITER $$
CREATE PROCEDURE SP_UpdateAsignacionAuxiliar
(IN _idUsuario INT, _idDetalleCurso INT, _idAsignacionAuxiliar INT)
BEGIN
	DECLARE _existe INT;
	SET _existe = (SELECT COUNT(*) FROM AsignacionAuxiliar WHERE idUsuario = _idUsuario AND idDetalleCurso = _idDetalleCurso);
	IF(_existe = 0) THEN
		UPDATE AsignacionAuxiliar SET idUsuario = _idUsuario, idDetalleCurso = _idDetalleCurso
        WHERE idAsignacionAuxiliar = _idAsignacionAuxiliar;
		SELECT _existe;
	ELSE
		SELECT _existe;
	END IF;
END;
$$

-- SP VER CREAR ASIGNACION AUXILIAR
DELIMITER $$
CREATE PROCEDURE SP_CreateAsignacionAuxiliar
(IN _idUsuario INT, _idDetalleCurso INT)
BEGIN
	DECLARE _existe INT;
	SET _existe = (SELECT COUNT(*) FROM AsignacionAuxiliar WHERE idUsuario = _idUsuario AND idDetalleCurso = _idDetalleCurso);
	IF(_existe = 0) THEN
		INSERT INTO AsignacionAuxiliar(idUsuario, idDetalleCurso, estado)
			VALUES (_idUsuario, _idDetalleCurso, 1);
		SELECT _existe;
	ELSE
		SELECT _existe;
	END IF;
END;
$$

-- SP CREAR MENSAJE
DELIMITER $$
CREATE PROCEDURE SP_CreateMensaje
(IN _idUsuario1 INT, _idUsuario2 INT, _asunto VARCHAR(255), _cuerpo VARCHAR(255), _archivo BLOB)
BEGIN
	INSERT INTO Mensaje(idUsuario1, idUsuario2, asunto) VALUES(_idUsuario1, _idUsuario2, _asunto);
    INSERT INTO DetalleMensaje(idMensaje, cuerpo, archivo) VALUES((SELECT max(idMensaje) FROM Mensaje), _cuerpo, _archivo);
END;
$$

-- CREAR HILO FORO
DELIMITER $$
CREATE PROCEDURE SP_CreateHiloForo
(IN _comentario VARCHAR(250), _idUsuario INT, _idForo INT)
BEGIN
	DECLARE _fechaFin DATETIME;
    DECLARE _tiempo INT;
	SET _fechaFin = (SELECT fechaFin FROM foro WHERE idForo = _idForo);
	IF(_fechaFin > NOW()) THEN
		INSERT INTO DetalleForo(comentario, idUsuario, idForo) VALUES (_comentario, _idUsuario, _idForo);
		SET _tiempo = 0;
		SELECT _tiempo;
	ELSE
		SET _tiempo = 1;
		SELECT _tiempo;
	END IF;
END;
$$

-- SP ELIMINAR DETALLE CURSO
DELIMITER $$
CREATE PROCEDURE SP_DeleteDetalleCurso
(IN _idDetalleCurso INT)
BEGIN
	DECLARE _existe INT;
    SET _existe = (SELECT COUNT(*) FROM AsignacionEstudiante WHERE idDetalleCurso = _idDetalleCurso);
	IF(_existe = 0) THEN
		DELETE FROM DetalleCurso WHERE idDetalleCurso = _idDetalleCurso;
		SELECT _existe;
	ELSE
		SELECT _existe;
	END IF;
END;
$$

-- SP CREAR ASIGNACION DE ESTUDIANTE
DELIMITER $$
CREATE PROCEDURE SP_CreateAsignacionEstudiante
(IN _idDetalleCurso INT, IN _idUsuario INT)
BEGIN
	DECLARE _existe INT;
    DECLARE _anio INT;
    DECLARE _fechaFin DATETIME;
    DECLARE _semestre VARCHAR(255);
    DECLARE _idCurso INT;
    SET _anio = (SELECT anio FROM DetalleCurso WHERE idDetalleCurso = _idDetalleCurso);
    SET _semestre = (SELECT semestre FROM DetalleCurso WHERE idDetalleCurso = _idDetalleCurso);
    SET _idCurso = (SELECT idCurso FROM DetalleCurso WHERE idDetalleCurso = _idDetalleCurso);
    SET _fechaFin = (SELECT fechaFin FROM DetalleCurso WHERE idDetalleCurso = _idDetalleCurso);
    SET _existe = (SELECT COUNT(*) FROM AsignacionEstudiante
    INNER JOIN DetalleCurso ON AsignacionEstudiante.idDetalleCurso = DetalleCurso.idDetalleCurso
    INNER JOIN Curso on DetalleCurso.idCurso = Curso.idCurso
    WHERE AsignacionEstudiante.idUsuario = _idUsuario AND anio = _anio AND semestre = _semestre
    AND Curso.idCurso = _idCurso);
	IF(_existe = 0) THEN
		IF(_fechaFin > NOW()) THEN
			INSERT INTO AsignacionEstudiante(idDetalleCurso, idUsuario) VALUES (_idDetalleCurso, _idUsuario);
			SELECT _existe;
		ELSE
			SET _existe = 1;
			SELECT _existe;
		END IF;
	ELSE
		SET _existe = 2;
		SELECT _existe;
	END IF;
END;
$$

-- SP ELIMINAR ASIGNACION DE ESTUDIANTE
DELIMITER $$
CREATE PROCEDURE SP_DeleteAsignacionEstudiante
(IN _idDetalleCurso INT, IN _idAsignacionEstudiante INT)
BEGIN
	DECLARE _existe INT;
    DECLARE _fechaFin DATETIME;
    SET _fechaFin = (SELECT fechaFin FROM DetalleCurso WHERE idDetalleCurso = _idDetalleCurso);
	IF(_fechaFin > NOW()) THEN
		DELETE FROM AsignacionEstudiante WHERE idAsignacionEstudiante = _idAsignacionEstudiante;
        SET _existe = 0;
        SELECT _existe;
	ELSE
		SET _existe = 1;
		SELECT _existe;
	END IF;
END;
$$

-- CREAR HILO FORO
DELIMITER $$
CREATE PROCEDURE SP_MostarPreguntasAleatorio
(IN _idEvaluacion INT)
BEGIN
	DECLARE _aleatorio TINYINT;
	SET _aleatorio = (SELECT aleatorio FROM Evaluacion WHERE idEvaluacion = _idEvaluacion);
	IF(_aleatorio = 0) THEN
		SELECT * FROM Pregunta WHERE idEvaluacion = _idEvaluacion
        ORDER BY RAND();
	ELSE
		SELECT * FROM Pregunta WHERE idEvaluacion = _idEvaluacion;
	END IF;
END;
$$

-- CREAR HILO FORO
DELIMITER $$
CREATE PROCEDURE SP_EntregarActividad
(IN _texto VARCHAR(250), _idUsuario INT, _idActividad INT, _archivo BLOB)
BEGIN
	DECLARE _fechaFin DATETIME;
	DECLARE _fechaFin2 DATETIME;
    DECLARE _tiempo INT;
	SET _fechaFin = (SELECT fechaLimite FROM Actividad WHERE idActividad = _idActividad);
	SET _fechaFin2 = SELECT NOW();
	IF(_fechaFin > _fechaFin2) THEN
		CALL SP_AgregarTarea(_texto, _idUsuario, _idActividad, _archivo);
		SET _tiempo = 0;
		SELECT _tiempo;
	ELSE
		SET _tiempo = 1;
		SELECT _tiempo;
	END IF;
END;
$$

-- SP ELIMINAR DETALLE CURSO
DELIMITER $$
CREATE PROCEDURE SP_AgregarTarea
(IN _texto VARCHAR(250), _idUsuario INT, _idActividad INT, _archivo BLOB)
BEGIN
	DECLARE _existe INT;
    SET _existe = (SELECT COUNT(*) FROM ActividadAlumno WHERE idUsuario = _idUsuario AND idActividad = _idActividad);
	IF(_existe = 0) THEN
        INSERT INTO ActividadAlumno(texto, idUsuario, idActividad, archivo, entregada, nota) VALUES 
		(_texto, _idUsuario, _idActividad, _archivo, 1, 0);
	END IF;
END;
$$