CREATE DATABASE HOSPITAL;
USE HOSPITAL;

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    nombre VARCHAR(50),
    fecha_nacimiento DATE
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    nombre VARCHAR(50),
    especialidad VARCHAR(50)
);

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY,
    nombre VARCHAR(50),
    ubicacion VARCHAR(50)
);

CREATE TABLE Cita (
    id_cita INT PRIMARY KEY,
    id_paciente INT,
    fecha DATE,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

CREATE TABLE Habitacion (
    id_habitacion INT PRIMARY KEY,
    numero VARCHAR(10),
    piso VARCHAR(10)
);

CREATE TABLE Medico_Departamento (
    id_medico INT,
    id_departamento INT,
    PRIMARY KEY (id_medico, id_departamento),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Paciente_Habitacion (
    id_paciente INT,
    id_habitacion INT,
    PRIMARY KEY (id_paciente, id_habitacion),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion)
);

INSERT INTO Paciente VALUES (1, 'Juan Pérez', '1990-05-14');
INSERT INTO Medico VALUES (1, 'Dra. Ana Gómez', 'Cardiología');
INSERT INTO Departamento VALUES (1, 'Cardiología', 'Piso 2');
INSERT INTO Cita VALUES (1, 1, '2025-06-21');
INSERT INTO Habitacion VALUES (1, '201B', 'Piso 2');
INSERT INTO Medico_Departamento VALUES (1, 1);
INSERT INTO Paciente_Habitacion VALUES (1, 1);



SELECT nombre, LENGTH(nombre) FROM Paciente;
SELECT nombre FROM Paciente WHERE nombre LIKE '%Pérez';
SELECT UPPER(nombre) FROM Paciente;
SELECT LOWER(nombre) FROM Paciente;
SELECT CONCAT(nombre, ' - Nacido: ', fecha_nacimiento) FROM Paciente;
SELECT REPLACE(nombre, 'Juan', 'Jhon') FROM Paciente;
SELECT SUBSTRING (nombre, ' ', 1) AS primer_nombre FROM Paciente;
SELECT LEFT(nombre, 4) FROM Paciente;
SELECT TRIM(nombre) FROM Paciente;



CREATE PROCEDURE RegistrarCita (
    IN p_id_cita INT,
    IN p_id_paciente INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO Cita (id_cita, id_paciente, fecha)
    VALUES (p_id_cita, p_id_paciente, p_fecha);
END 
EXEC RegistrarCita(3, 1, '2025-06-30');

UPDATE Paciente SET nombre = 'Juan P. Pérez' WHERE id_paciente = 1;
UPDATE Medico SET especialidad = 'Medicina General' WHERE id_medico = 2;
UPDATE Departamento SET ubicacion = 'Piso 1' WHERE id_departamento = 2;
UPDATE Cita SET fecha = '2025-06-25' WHERE id_cita = 1;
UPDATE Habitacion SET numero = '301C' WHERE id_habitacion = 2;

DELETE FROM Cita WHERE id_cita = 2;
DELETE FROM Paciente_Habitacion WHERE id_paciente = 2 AND id_habitacion = 2;
DELETE FROM Medico_Departamento WHERE id_medico = 2 AND id_departamento = 2;
DELETE FROM Habitacion WHERE id_habitacion = 2;
DELETE FROM Paciente WHERE id_paciente = 2;

ALTER TABLE Paciente ADD genero VARCHAR(10);
ALTER TABLE Medico ADD telefono VARCHAR(20);
ALTER TABLE Departamento MODIFY ubicacion VARCHAR(100);
ALTER TABLE Habitacion ADD disponible BOOLEAN DEFAULT TRUE;
ALTER TABLE Cita ADD hora TIME;

TRUNCATE TABLE Cita;
TRUNCATE TABLE Paciente_Habitacion;
TRUNCATE TABLE Medico_Departamento;
TRUNCATE TABLE Habitacion;
TRUNCATE TABLE Medico;

DROP TABLE IF EXISTS Paciente_Habitacion;
DROP TABLE  Medico_Departamento;
DROP PROCEDURE IF EXISTS  RegistrarCita;
DROP TABLE Cita;
DROP DATABASE HOSPITAL;

SELECT nombre FROM Paciente
WHERE id_paciente = (
    SELECT id_paciente FROM Cita
    ORDER BY fecha DESC
    LIMIT 1
);

SELECT nombre FROM Medico
WHERE id_medico = (
    SELECT id_medico FROM Medico_Departamento
    GROUP BY id_medico
    ORDER BY COUNT(*) DESC
    LIMIT 1
);