CREATE DATABASE Alcaldia_DB;
USE Alcaldia_DB;

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
    departamento_id INT
);

-- Tabla: Departamento
CREATE TABLE Departamento (
    departamento_id INT PRIMARY KEY,
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

CREATE TABLE Proyecto_Ciudadano (
    proyecto_id INT,
    ciudadano_id INT,
    PRIMARY KEY (proyecto_id, ciudadano_id),
    FOREIGN KEY (proyecto_id) REFERENCES Proyecto(proyecto_id),
    FOREIGN KEY (ciudadano_id) REFERENCES Ciudadano(ciudadano_id)
);


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


SELECT pr.nombre, pr.descripcion, pr.presupuesto
FROM Proyecto pr
JOIN Proyecto_Ciudadano pc ON pr.proyecto_id = pc.proyecto_id
WHERE pc.ciudadano_id = 1;

SELECT p.nombre AS Proveedor, p.contacto
FROM Proveedor p
JOIN Proyecto_Proveedor pp ON p.proveedor_id = pp.proveedor_id
WHERE pp.proyecto_id = 1;

UPDATE Ciudadano SET direccion = 'Calle 123 Nueva' WHERE ciudadano_id = 1;
UPDATE Empleado SET cargo = 'Director de Infraestructura' WHERE empleado_id = 2;
UPDATE Proyecto SET presupuesto = presupuesto + 5000000 WHERE proyecto_id = 1;

DELETE FROM Proveedor WHERE proveedor_id = 5;
ALTER TABLE Ciudadano ADD telefono VARCHAR(20);
TRUNCATE TABLE Proyecto_Ciudadano;
DROP TABLE Proyecto_Proveedor;

SELECT nombre, apellido FROM Ciudadano
WHERE ciudadano_id IN (
    SELECT ciudadano_id FROM Proyecto_Ciudadano
    GROUP BY ciudadano_id
    HAVING COUNT(*) > 2
);