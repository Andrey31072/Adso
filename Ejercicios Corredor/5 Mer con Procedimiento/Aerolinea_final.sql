CREATE DATABASE AEROLINEA_Final;
USE AEROLINEA_Final;

CREATE TABLE Pasajero (
    id_pasajero INT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(100)
);

CREATE TABLE Avion (
    id_avion INT PRIMARY KEY,
    modelo VARCHAR(30),
    capacidad INT
);

CREATE TABLE Destino (
    id_destino INT PRIMARY KEY,
    ciudad VARCHAR(50),
    codigo_iata CHAR(3)
);

CREATE TABLE Vuelo (
    id_vuelo INT PRIMARY KEY,
    numero_vuelo VARCHAR(10),
    id_avion INT,
    FOREIGN KEY (id_avion) REFERENCES Avion(id_avion)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    cargo VARCHAR(30)
);

CREATE TABLE Pasajero_Vuelo (
    id_pasajero INT,
    id_vuelo INT,
    PRIMARY KEY (id_pasajero, id_vuelo),
    FOREIGN KEY (id_pasajero) REFERENCES Pasajero(id_pasajero),
    FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id_vuelo)
);

CREATE TABLE Empleado_Vuelo (
    id_empleado INT,
    id_vuelo INT,
    PRIMARY KEY (id_empleado, id_vuelo),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id_vuelo)
);

INSERT INTO Pasajero VALUES (1, 'Carlos Pérez', 'carlos@gmail.com');
INSERT INTO Avion VALUES (1, 'Airbus A320', 180);
INSERT INTO Destino VALUES (1, 'Bogotá', 'BOG');
INSERT INTO Vuelo VALUES (1, 'AV101', 1);
INSERT INTO Empleado VALUES (1, 'Luis Gómez', 'Piloto');
INSERT INTO Pasajero_Vuelo VALUES (1, 1);
INSERT INTO Empleado_Vuelo VALUES (1, 1);

CREATE PROCEDURE RegistrarPasajeroVuelo (
    IN p_id_pasajero INT,
    IN p_id_vuelo INT
)
BEGIN
    INSERT INTO Pasajero_Vuelo (id_pasajero, id_vuelo)
    VALUES (p_id_pasajero, p_id_vuelo);
END

SELECT nombre, LENGTH(nombre) FROM Pasajero;
SELECT nombre FROM Pasajero WHERE correo LIKE '@gmail.com';
SELECT UPPER(nombre) FROM Pasajero;
SELECT LOWER(nombre) FROM Pasajero;
SELECT CONCAT(nombre, ' <', correo, '>') AS nombre_correo FROM Pasajero;
SELECT REPLACE(correo, 'gmail.com', 'empresa.com') AS correo_actualizado FROM Pasajero;
SELECT SUBSTRING_INDEX(correo, '@', -1) AS dominio FROM Pasajero;
SELECT LEFT(nombre, 3) AS iniciales FROM Pasajero;
SELECT TRIM(nombre) AS nombre_sin_espacios FROM Pasajero;
SELECT INSTR(correo, '@') AS posicion_arroba FROM Pasajero;

UPDATE Pasajero SET correo = 'carlos_nuevo@gmail.com' WHERE id_pasajero = 1;
UPDATE Avion SET modelo = 'Airbus A321' WHERE id_avion = 1;
UPDATE Vuelo SET numero_vuelo = 'AV303' WHERE id_vuelo = 1;
UPDATE Empleado SET cargo = 'Capitán' WHERE id_empleado = 1;
UPDATE Destino SET ciudad = 'Cartagena' WHERE id_destino = 1;

DELETE FROM Pasajero WHERE id_pasajero = 2;
DELETE FROM Avion WHERE id_avion = 2;
DELETE FROM Vuelo WHERE id_vuelo = 2;
DELETE FROM Empleado WHERE id_empleado = 2;
DELETE FROM Destino WHERE id_destino = 2;

ALTER TABLE Pasajero ADD telefono VARCHAR(15);
ALTER TABLE Avion ADD fabricante VARCHAR(30);
ALTER TABLE Empleado MODIFY cargo VARCHAR(50);
ALTER TABLE Destino ADD pais VARCHAR(30);
ALTER TABLE Vuelo ADD estado VARCHAR(20);

TRUNCATE TABLE Pasajero_Vuelo;
TRUNCATE TABLE Empleado_Vuelo;
TRUNCATE TABLE Vuelo;
TRUNCATE TABLE Avion;
TRUNCATE TABLE Empleado;

DROP TABLE  Pasajero_Vuelo;
DROP TABLE Empleado_Vuelo;
DROP TABLE  Vuelo;
DROP TABLE  Avion;
DROP PROCEDURE RegistrarPasajeroVuelo;

SELECT nombre FROM Pasajero
WHERE id = (
    SELECT id_pasajero FROM Pasajero_Vuelo
    GROUP BY id_pasajero
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

SELECT modelo FROM Avion
WHERE id_avion = (
    SELECT id_avion FROM Vuelo
    ORDER BY id_vuelo DESC
    LIMIT 1
);