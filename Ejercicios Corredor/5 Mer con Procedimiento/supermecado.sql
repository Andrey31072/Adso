CREATE DATABASE SUPERMERCADO_DB;
USE SUPERMERCADO_DB;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(100)
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10)
);

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    cargo VARCHAR(30)
);

CREATE TABLE Factura (
    id_factura INT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Factura_Producto (
    id_factura INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_factura, id_producto),
    FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Producto_Categoria (
    id_producto INT,
    id_categoria INT,
    PRIMARY KEY (id_producto, id_categoria),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

INSERT INTO Cliente VALUES (1, 'Laura Ramírez', 'laura@gmail.com');
INSERT INTO Producto VALUES (1, 'Leche Entera', 35000);
INSERT INTO Categoria VALUES (1, 'Lácteos', 'Productos derivados de la leche');
INSERT INTO Empleado VALUES (1, 'Carlos Mejía', 'Cajero');
INSERT INTO Factura VALUES (1, 1, '2025-06-20');

CREATE PROCEDURE RegistrarPasajeroVuelo (
    IN p_id_pasajero INT,
    IN p_id_vuelo INT
)
BEGIN
    INSERT INTO Pasajero_Vuelo (id_pasajero, id_vuelo)
    VALUES (p_id_pasajero, p_id_vuelo);
END 
Go;

SELECT nombre, LENGTH(nombre) FROM Cliente;
SELECT nombre FROM Cliente WHERE correo LIKE '%@gmail.com';
SELECT UPPER(nombre) FROM Cliente;
SELECT LOWER(nombre) FROM Cliente;
SELECT CONCAT(nombre, ' <', correo, '>') AS cliente_info FROM Cliente;
SELECT REPLACE(correo, 'gmail.com', 'supermercado.com') FROM Cliente;
SELECT SUBSTRING_INDEX(correo, '@', -1) AS dominio FROM Cliente;
SELECT LEFT(nombre, 3) AS inicial FROM Cliente;
SELECT TRIM(nombre) FROM Cliente;
SELECT INSTR(correo, '@') AS posicion_arroba FROM Cliente;

UPDATE Cliente SET correo = 'laura_nueva@gmail.com' WHERE id_cliente = 1;
UPDATE Producto SET precio = 40000 WHERE id_producto = 1;
UPDATE Categoria SET descripcion = 'Productos lácteos en general' WHERE id_categoria = 1;
UPDATE Empleado SET cargo = 'Administrador' WHERE id_empleado = 1;
UPDATE Factura SET fecha = '2025-06-22' WHERE id_factura = 1;

DELETE FROM Factura_Producto WHERE id_factura = 2 AND id_producto = 2;
DELETE FROM Producto_Categoria WHERE id_producto = 2 AND id_categoria = 2;
DELETE FROM Factura WHERE id_factura = 2;
DELETE FROM Producto WHERE id_producto = 2;
DELETE FROM Cliente WHERE id_cliente = 2;

ALTER TABLE Cliente ADD telefono VARCHAR(15);
ALTER TABLE Producto ADD stock INT;
ALTER TABLE Empleado MODIFY cargo VARCHAR(50);
ALTER TABLE Categoria ADD activa BOOLEAN DEFAULT TRUE;
ALTER TABLE Factura ADD total DECIMAL(10,2);

TRUNCATE TABLE Factura_Producto;
TRUNCATE TABLE Producto_Categoria;
TRUNCATE TABLE Factura;
TRUNCATE TABLE Producto;
TRUNCATE TABLE Cliente;

DROP TABLE IF EXISTS Factura_Producto;
DROP TABLE IF EXISTS Producto_Categoria;
DROP TABLE IF EXISTS Factura;
DROP PROCEDURE IF EXISTS RegistrarProductoEnFactura;
DROP DATABASE IF EXISTS SUPERMERCADO_DB;

SELECT nombre FROM Cliente
WHERE id_cliente = (
    SELECT id_cliente FROM Factura
    ORDER BY fecha DESC
    LIMIT 1
);

SELECT nombre FROM Producto
WHERE id_producto = (
    SELECT id_producto FROM Factura_Producto
    GROUP BY id_producto
    ORDER BY SUM(cantidad) DESC
    LIMIT 1
);