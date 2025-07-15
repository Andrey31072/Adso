CREATE DATABASE Panaderia_DB;
USE Panaderia_DB;

-- Tabla: Cliente
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    telefono VARCHAR(20)
);

-- Tabla: Empleado
CREATE TABLE Empleado (
    empleado_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    cargo VARCHAR(50)
);

-- Tabla: Producto
CREATE TABLE Producto (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(8,2),
    stock INT
);

-- Tabla: Pedido
CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    empleado_id INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (empleado_id) REFERENCES Empleado(empleado_id)
);

-- Tabla: Proveedor
CREATE TABLE Proveedor (
    proveedor_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(50)
);


CREATE TABLE Pedido_Producto (
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    PRIMARY KEY (pedido_id, producto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Producto(producto_id)
);

CREATE TABLE Producto_Proveedor (
    producto_id INT,
    proveedor_id INT,
    PRIMARY KEY (producto_id, proveedor_id),
    FOREIGN KEY (producto_id) REFERENCES Producto(producto_id),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedor(proveedor_id)
);

SELECT CONCAT(nombre, ' ', apellido) AS NombreCompleto FROM Cliente;

DELIMITER //
CREATE PROCEDURE InsertarProducto(
    IN p_nombre VARCHAR(50),
    IN p_precio DECIMAL(8,2),
    IN p_stock INT
)
BEGIN
    INSERT INTO Producto(nombre, precio, stock) VALUES (p_nombre, p_precio, p_stock);
END;
//
DELIMITER ;

SELECT pr.nombre, pr.precio, pp.cantidad
FROM Producto pr
JOIN Pedido_Producto pp ON pr.producto_id = pp.producto_id
WHERE pp.pedido_id = 1;
SELECT p.nombre AS Producto, prov.nombre AS Proveedor
FROM Producto p
JOIN Producto_Proveedor pp ON p.producto_id = pp.producto_id
JOIN Proveedor prov ON pp.proveedor_id = prov.proveedor_id
WHERE p.producto_id = 1;

UPDATE Producto SET precio = precio * 1.10 WHERE producto_id = 1;
UPDATE Producto SET stock = stock + 20 WHERE producto_id = 2;
UPDATE Empleado SET cargo = 'Supervisor' WHERE empleado_id = 1;
DELETE FROM Proveedor WHERE proveedor_id = 3;
ALTER TABLE Cliente ADD correo VARCHAR(100);
TRUNCATE TABLE Pedido_Producto;
DROP TABLE Producto_Proveedor;


SELECT nombre, apellido FROM Cliente
WHERE cliente_id IN (
    SELECT cliente_id FROM Pedido
    GROUP BY cliente_id
    HAVING COUNT(*) > 2
);