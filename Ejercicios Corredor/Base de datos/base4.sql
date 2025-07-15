-- Crear la base de datos
CREATE DATABASE Inmobiliaria_DB;
USE Inmobiliaria_DB;

-- Tabla: Propiedad
CREATE TABLE Propiedad (
    propiedad_id INT PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL,
    tipo VARCHAR(50), -- Casa, Apartamento, Local, etc.
    precio DECIMAL(12,2),
    ciudad_id INT
);

-- Tabla: Cliente
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

-- Tabla: Agente
CREATE TABLE Agente (
    agente_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    telefono VARCHAR(20)
);

-- Pivote: Agente_Propiedad
CREATE TABLE Agente_Propiedad (
    agente_id INT,
    propiedad_id INT,
    PRIMARY KEY (agente_id, propiedad_id),
    FOREIGN KEY (agente_id) REFERENCES Agente(agente_id),
    FOREIGN KEY (propiedad_id) REFERENCES Propiedad(propiedad_id)
);

-- Tabla: Contrato
CREATE TABLE Contrato (
    contrato_id INT PRIMARY KEY,
    propiedad_id INT,
    cliente_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    tipo VARCHAR(50), -- Compra o Arriendo
    FOREIGN KEY (propiedad_id) REFERENCES Propiedad(propiedad_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabla: Pago
CREATE TABLE Pago (
    pago_id INT PRIMARY KEY,
    contrato_id INT,
    monto DECIMAL(10,2),
    fecha_pago DATE,
    FOREIGN KEY (contrato_id) REFERENCES Contrato(contrato_id)
);

-- Tabla: Ciudad
CREATE TABLE Ciudad (
    ciudad_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    departamento VARCHAR(50)
);

-- Tabla: Servicio
CREATE TABLE Servicio (
    servicio_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Pivote: Propiedad_Servicio
CREATE TABLE Propiedad_Servicio (
    propiedad_id INT,
    servicio_id INT,
    PRIMARY KEY (propiedad_id, servicio_id),
    FOREIGN KEY (propiedad_id) REFERENCES Propiedad(propiedad_id),
    FOREIGN KEY (servicio_id) REFERENCES Servicio(servicio_id)
);

SELECT CONCAT(nombre, ' ', apellido) AS NombreCompleto FROM Cliente;

DELIMITER //
CREATE PROCEDURE InsertarPago(
    IN p_contrato_id INT,
    IN p_monto DECIMAL(10,2),
    IN p_fecha DATE
)
BEGIN
    INSERT INTO Pago(contrato_id, monto, fecha_pago)
    VALUES (p_contrato_id, p_monto, p_fecha);
END;
//
DELIMITER ;

SELECT p.* FROM Propiedad p
JOIN Ciudad c ON p.ciudad_id = c.ciudad_id
WHERE c.nombre = 'Bogotá';

SELECT a.nombre, a.apellido, p.direccion
FROM Agente a
JOIN Agente_Propiedad ap ON a.agente_id = ap.agente_id
JOIN Propiedad p ON ap.propiedad_id = p.propiedad_id;


UPDATE Propiedad SET precio = precio * 1.10 WHERE propiedad_id = 1;
UPDATE Cliente SET telefono = '3001234567' WHERE cliente_id = 2;
UPDATE Contrato SET fecha_fin = DATE_ADD(fecha_fin, INTERVAL 6 MONTH) WHERE contrato_id = 1;

DELETE FROM Servicio WHERE servicio_id = 5;
ALTER TABLE Contrato ADD estado VARCHAR(20);
TRUNCATE TABLE Pago;
DROP TABLE Propiedad_Servicio;

SELECT nombre, apellido FROM Cliente
WHERE cliente_id IN (
    SELECT cliente_id FROM Contrato
    GROUP BY cliente_id
    HAVING COUNT(*) > 1
);