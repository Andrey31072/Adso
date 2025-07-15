CREATE DATABASE Gobernacion_DB;
USE Gobernacion_DB;

-- Tabla: Ciudadano
CREATE TABLE Ciudadano (
    ciudadano_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    direccion VARCHAR(100)
);

-- Tabla: Empleado
CREATE TABLE Empleado (
    empleado_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    cargo VARCHAR(50),
    secretaria_id INT
);

-- Tabla: Secretaría
CREATE TABLE Secretaria (
    secretaria_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(100)
);

-- Tabla: Proyecto
CREATE TABLE Proyecto (
    proyecto_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    presupuesto DECIMAL(12,2)
);

-- Tabla: Proveedor
CREATE TABLE Proveedor (
    proveedor_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(50)
);

-- Pivote: Ciudadano_Proyecto
CREATE TABLE Ciudadano_Proyecto (
    ciudadano_id INT,
    proyecto_id INT,
    PRIMARY KEY (ciudadano_id, proyecto_id),
    FOREIGN KEY (ciudadano_id) REFERENCES Ciudadano(ciudadano_id),
    FOREIGN KEY (proyecto_id) REFERENCES Proyecto(proyecto_id)
);

-- Pivote: Proyecto_Proveedor
CREATE TABLE Proyecto_Proveedor (
    proyecto_id INT,
    proveedor_id INT,
    PRIMARY KEY (proyecto_id, proveedor_id),
    FOREIGN KEY (proyecto_id) REFERENCES Proyecto(proyecto_id),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedor(proveedor_id)
);

SELECT CONCAT(nombre, ' ', apellido) AS NombreCompleto FROM Ciudadano;

DELIMITER //
CREATE PROCEDURE InsertarProyecto(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_presupuesto DECIMAL(12,2)
)
BEGIN
    INSERT INTO Proyecto (nombre, descripcion, presupuesto)
    VALUES (p_nombre, p_descripcion, p_presupuesto);
END;
//
DELIMITER ;

SELECT p.nombre, p.descripcion, p.presupuesto
FROM Proyecto p
JOIN Ciudadano_Proyecto cp ON p.proyecto_id = cp.proyecto_id
WHERE cp.ciudadano_id = 1;
SELECT pr.nombre AS Proveedor, pr.contacto
FROM Proveedor pr
JOIN Proyecto_Proveedor pp ON pr.proveedor_id = pp.proveedor_id
WHERE pp.proyecto_id = 1;

UPDATE Ciudadano SET direccion = 'Calle Nueva 456' WHERE ciudadano_id = 1;
UPDATE Empleado SET cargo = 'Director Técnico' WHERE empleado_id = 1;
UPDATE Proyecto SET presupuesto = presupuesto + 3000000 WHERE proyecto_id = 2;

DELETE FROM Proveedor WHERE proveedor_id = 4;
ALTER TABLE Ciudadano ADD telefono VARCHAR(20);
TRUNCATE TABLE Proyecto_Proveedor;
DROP TABLE Ciudadano_Proyecto;

SELECT nombre, apellido FROM Ciudadano
WHERE ciudadano_id IN (
    SELECT ciudadano_id FROM Ciudadano_Proyecto
    GROUP BY ciudadano_id
    HAVING COUNT(*) > 2
);