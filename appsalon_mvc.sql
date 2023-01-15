CREATE DATABASES appsalon;
use appsalon;

CREATE TABLE usuarios(
	id INT(11) NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(60),
	apellido VARCHAR(60),
	email VARCHAR(30),
	telefono VARCHAR(8),
	admin TINYINT(1),
	confirmado TINYINT(1),
	token VARCHAR(15),
	PRIMARY KEY(id)
);

CREATE TABLE servicios(
	id INT(11) NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(60),
	precio DECIMAL(5,2),
	PRIMARY KEY(id)
);

CREATE TABLE citas(
	id INT(11) NOT NULL AUTO_INCREMENT,
	fecha DATE,
	hora TIME,
	usuarioId INT(11),
	PRIMARY KEY(id),
	CONSTRAINT FK_UsuarioCita FOREIGN KEY(usuarioId) REFERENCES usuarios(id) 
);

CREATE TABLE citasservicios(
	id INT(11) NOT NULL AUTO_INCREMENT,
	citaId INT(11),
	servicioId INT(11),
	PRIMARY KEY(id),
	CONSTRAINT FK_Cita FOREIGN KEY(citaId) REFERENCES citas(id),
	CONSTRAINT FK_servicios FOREIGN KEY(servicioId) REFERENCES servicios(id)  
);