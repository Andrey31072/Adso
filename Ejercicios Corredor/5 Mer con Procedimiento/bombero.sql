CREATE DATABASE BOMBEROS;
USE BOMBEROS;

CREATE TABLE Bombero (
    id_bombero INT PRIMARY KEY,
    nombre VARCHAR(50),
    rango VARCHAR(30)
);

CREATE TABLE Unidad (
    id_unidad INT PRIMARY KEY,
    tipo VARCHAR(50),
    capacidad INT
);

CREATE TABLE Emergencia (
    id_emergencia INT PRIMARY KEY,
    descripcion TEXT,
    fecha DATE
);

CREATE TABLE Estacion (
    id_estacion INT PRIMARY KEY,
    nombre VARCHAR(50),
    ubicacion VARCHAR(100)
);

CREATE TABLE Turno (
    id_turno INT PRIMARY KEY,
    id_bombero INT,
    horario VARCHAR(30),
    FOREIGN KEY (id_bombero) REFERENCES Bombero(id_bombero)
);

CREATE TABLE Bombero_Unidad (
    id_bombero INT,
    id_unidad INT,
    PRIMARY KEY (id_bombero, id_unidad),
    FOREIGN KEY (id_bombero) REFERENCES Bombero(id_bombero),
    FOREIGN KEY (id_unidad) REFERENCES Unidad(id_unidad)
);

CREATE TABLE Unidad_Emergencia (
    id_unidad INT,
    id_emergencia INT,
    PRIMARY KEY (id_unidad, id_emergencia),
    FOREIGN KEY (id_unidad) REFERENCES Unidad(id_unidad),
    FOREIGN KEY (id_emergencia) REFERENCES Emergencia(id_emergencia)
);

INSERT INTO Bombero VALUES (1, 'Pedro Salazar', 'Teniente');
INSERT INTO Unidad VALUES (1, 'Carro Escalera', 4);
INSERT INTO Emergencia VALUES (1, 'Incendio en edificio', '2025-06-20');
INSERT INTO Estacion VALUES (1, 'Estación Central', 'Av. Libertador #45');
INSERT INTO Turno VALUES (1, 1, '08:00 - 16:00');
INSERT INTO Bombero_Unidad VALUES (1, 1);
INSERT INTO Unidad_Emergencia VALUES (1, 1);

GO
CREATE PROCEDURE RegistrarTurno
    @id_turno INT,
    @id_bombero INT,
    @horario VARCHAR(30)
AS
BEGIN
    INSERT INTO Turno (id_turno, id_bombero, horario)
    VALUES (@id_turno, @id_bombero, @horario);
END
GO

EXEC RegistrarTurno @id_turno = 2, @id_bombero = 1, @horario = '16:00 - 00:00';

SELECT nombre, LEN(nombre) FROM Bombero;
SELECT nombre FROM Bombero WHERE rango LIKE 'Ten%';
SELECT UPPER(nombre) FROM Bombero;
SELECT LOWER(nombre) FROM Bombero;
SELECT nombre + ' - ' + rango AS detalle FROM Bombero;
SELECT REPLACE(nombre, 'Pedro', 'Capitán') FROM Bombero;
SELECT LEFT(nombre, CHARINDEX(' ', nombre + ' ') - 1) AS primer_nombre FROM Bombero;
SELECT LEFT(nombre, 4) AS inicial FROM Bombero;
SELECT LTRIM(RTRIM(nombre)) AS limpio FROM Bombero;
SELECT CHARINDEX(' ', nombre) AS espacio FROM Bombero;

UPDATE Bombero SET rango = 'Comandante' WHERE id_bombero = 1;
UPDATE Unidad SET tipo = 'Unidad Rápida' WHERE id_unidad = 1;
UPDATE Emergencia SET descripcion = 'Incendio forestal' WHERE id_emergencia = 1;
UPDATE Estacion SET nombre = 'Estación Sur' WHERE id_estacion = 1;
UPDATE Turno SET horario = '10:00 - 18:00' WHERE id_turno = 1;

DELETE FROM Bombero_Unidad WHERE id_bombero = 1 AND id_unidad = 1;
DELETE FROM Unidad_Emergencia WHERE id_unidad = 1 AND id_emergencia = 1;
DELETE FROM Turno WHERE id_turno = 2;
DELETE FROM Unidad WHERE id_unidad = 2;
DELETE FROM Emergencia WHERE id_emergencia = 2;

ALTER TABLE Bombero ADD telefono VARCHAR(15);
ALTER TABLE Unidad ADD en_servicio BIT DEFAULT 1;
ALTER TABLE Emergencia ADD gravedad VARCHAR(20);
ALTER TABLE Estacion ADD telefono VARCHAR(20);
ALTER TABLE Turno ALTER COLUMN horario VARCHAR(50);

TRUNCATE TABLE Bombero_Unidad;
TRUNCATE TABLE Unidad_Emergencia;
TRUNCATE TABLE Turno;
TRUNCATE TABLE Unidad;
TRUNCATE TABLE Bombero;

DROP PROCEDURE IF EXISTS RegistrarTurno;
DROP TABLE IF EXISTS Bombero_Unidad;
DROP TABLE IF EXISTS Unidad_Emergencia;
DROP TABLE IF EXISTS Turno;
DROP DATABASE IF EXISTS BOMBEROS_DB;

SELECT nombre FROM Bombero
WHERE id_bombero = (
    SELECT TOP 1 id_bombero
    FROM Turno
    ORDER BY id_turno DESC
);

SELECT tipo FROM Unidad
WHERE id_unidad = (
    SELECT TOP 1 id_unidad
    FROM Unidad_Emergencia
    GROUP BY id_unidad
    ORDER BY COUNT(*) DESC
);
