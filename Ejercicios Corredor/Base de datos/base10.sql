CREATE DATABASE HogarInfantil_DB;
USE HogarInfantil_DB;

CREATE TABLE Nino (
    nino_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    fecha_nacimiento DATE
);

CREATE TABLE Acudiente (
    acudiente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    telefono VARCHAR(20)
);

CREATE TABLE Educador (
    educador_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    especialidad VARCHAR(50)
);

CREATE TABLE Actividad (
    actividad_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    educador_id INT,
    FOREIGN KEY (educador_id) REFERENCES Educador(educador_id)
);

CREATE TABLE Alimento (
    alimento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(50)
);

CREATE TABLE Nino_Actividad (
    nino_id INT,
    actividad_id INT,
    PRIMARY KEY (nino_id, actividad_id),
    FOREIGN KEY (nino_id) REFERENCES Nino(nino_id),
    FOREIGN KEY (actividad_id) REFERENCES Actividad(actividad_id)
);

CREATE TABLE Nino_Alimento (
    nino_id INT,
    alimento_id INT,
    fecha DATE,
    PRIMARY KEY (nino_id, alimento_id, fecha),
    FOREIGN KEY (nino_id) REFERENCES Nino(nino_id),
    FOREIGN KEY (alimento_id) REFERENCES Alimento(alimento_id)
);

SELECT CONCAT(nombre, ' ', apellido) AS NombreCompleto FROM Nino;

DELIMITER //
CREATE PROCEDURE InsertarAlimento(
    IN p_nombre VARCHAR(50),
    IN p_tipo VARCHAR(50)
)
BEGIN
    INSERT INTO Alimento(nombre, tipo) VALUES (p_nombre, p_tipo);
END;
//
DELIMITER ;

SELECT a.nombre, a.descripcion 
FROM Actividad a
JOIN Nino_Actividad na ON a.actividad_id = na.actividad_id
WHERE na.nino_id = 1;

SELECT al.nombre, al.tipo, na.fecha
FROM Alimento al
JOIN Nino_Alimento na ON al.alimento_id = na.alimento_id
WHERE na.nino_id = 1;

UPDATE Nino SET apellido = 'García' WHERE nino_id = 1;
UPDATE Acudiente SET telefono = '3006543210' WHERE acudiente_id = 1;
UPDATE Educador SET especialidad = 'Psicopedagogía' WHERE educador_id = 2;

DELETE FROM Alimento WHERE alimento_id = 5;
ALTER TABLE Acudiente ADD correo VARCHAR(100);
TRUNCATE TABLE Nino_Alimento;
DROP TABLE Nino_Actividad;

SELECT nombre, apellido FROM Nino
WHERE nino_id IN (
    SELECT nino_id FROM Nino_Actividad
    GROUP BY nino_id
    HAVING COUNT(*) > 1
);