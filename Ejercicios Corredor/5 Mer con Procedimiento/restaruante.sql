CREATE DATABASE RESTAURANTE1;
USE RESTAURANTE1;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    telefono VARCHAR(15)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,ic
    nombre VARCHAR(50),
    cargo VARCHAR(30)
);

CREATE TABLE Mesa (
    id_mesa INT PRIMARY KEY,
    numero VARCHAR(10),
    capacidad INT
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL
);

CREATE TABLE Orden (
    id_orden INT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Orden_Producto (
    id_orden INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_orden, id_producto),
    FOREIGN KEY (id_orden) REFERENCES Orden(id_orden),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Empleado_Mesa (
    id_empleado INT,
    id_mesa INT,
    PRIMARY KEY (id_empleado, id_mesa),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa)
);

INSERT INTO Cliente VALUES (1, 'Camila Torres', '3014567890');
INSERT INTO Empleado VALUES (1, 'Mateo Gómez', 'Mesero');
INSERT INTO Mesa VALUES (1, 'M01', 4);
INSERT INTO Producto VALUES (1, 'Hamburguesa Clásica', 18000);
INSERT INTO Orden VALUES (1, 1, '2025-06-20');
INSERT INTO Orden_Producto VALUES (1, 1, 2);
INSERT INTO Empleado_Mesa VALUES (1, 1);

SELECT nombre, LEN(nombre) FROM Cliente;
SELECT nombre FROM Cliente WHERE telefono LIKE '301%';
SELECT UPPER(nombre) FROM Cliente;
SELECT LOWER(nombre) FROM Cliente;
SELECT CONCAT(nombre, ' - Tel: ', telefono) AS cliente_info FROM Cliente;
SELECT REPLACE(nombre, 'Camila', 'Cami') FROM Cliente;
SELECT SUBSTRING (nombre, ' ', 1) AS primer_nombre FROM Cliente;
SELECT LEFT(nombre, 4) FROM Cliente;
SELECT TRIM(nombre) FROM Cliente;
SELECT MIN (precio) FROM Producto;

GO
CREATE PROCEDURE RegistrarOrdenProducto
    @id_orden INT,
    @id_producto INT,
    @cantidad INT
AS
BEGIN
    INSERT INTO Orden_Producto (id_orden, id_producto, cantidad)
    VALUES (@id_orden, @id_producto, @cantidad);
END
GO

EXEC RegistrarOrdenProducto @id_orden = 1, @id_producto = 2, @cantidad = 3;


UPDATE Cliente SET telefono = '3209998888' WHERE id_cliente = 1;
UPDATE Empleado SET cargo = 'Administrador' WHERE id_empleado = 1;
UPDATE Mesa SET capacidad = 6 WHERE id_mesa = 1;
UPDATE Producto SET precio = 19000 WHERE id_producto = 1;
UPDATE Orden SET fecha = '2025-06-22' WHERE id_orden = 1;

DELETE FROM Orden_Producto WHERE id_orden = 1 AND id_producto = 1;
DELETE FROM Empleado_Mesa WHERE id_empleado = 1 AND id_mesa = 1;
DELETE FROM Producto WHERE id_producto = 2;
DELETE FROM Orden WHERE id_orden = 2;
DELETE FROM Cliente WHERE id_cliente = 2;

ALTER TABLE Cliente ADD direccion VARCHAR(100);
ALTER TABLE Empleado ADD telefono VARCHAR(20);
ALTER TABLE Mesa ALTER COLUMN capacidad INT NOT NULL;
ALTER TABLE Producto ADD disponible BIT DEFAULT 1;
ALTER TABLE Orden ADD estado VARCHAR(20);

TRUNCATE TABLE Orden_Producto;
TRUNCATE TABLE Empleado_Mesa;
TRUNCATE TABLE Orden;
TRUNCATE TABLE Producto;
TRUNCATE TABLE Cliente;

DROP PROCEDURE IF EXISTS RegistrarOrdenProducto;
DROP TABLE IF EXISTS Orden_Producto;
DROP TABLE IF EXISTS Empleado_Mesa;
DROP TABLE IF EXISTS Orden;
DROP DATABASE IF EXISTS RESTAURANTE;

SELECT nombre FROM Cliente
WHERE id_cliente = (
    SELECT TOP 1 id_cliente FROM Orden
    ORDER BY fecha DESC
);

SELECT nombre FROM Producto
WHERE id_producto = (
    SELECT TOP 1 id_producto
    FROM Orden_Producto
    GROUP BY id_producto
    ORDER BY SUM(cantidad) DESC
);