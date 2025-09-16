CREATE DATABASE TiendaDeportiva;
USE TiendaDeportiva;


CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) UNIQUE,
    correo VARCHAR(100) UNIQUE,
    direccion VARCHAR(150)
);

CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2) CHECK (salario >= 0)
);

CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INT CHECK (stock >= 0),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,
    id_empleado INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE DetalleVenta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT CHECK (cantidad > 0),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    direccion VARCHAR(150)
);

DELIMITER //
CREATE PROCEDURE InsertarCliente(IN p_nombre VARCHAR(100), IN p_telefono VARCHAR(20), IN p_correo VARCHAR(100), IN p_direccion VARCHAR(150))
BEGIN
    IF p_nombre = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre no puede estar vacío';
    ELSE
        INSERT INTO Clientes(nombre, telefono, correo, direccion)
        VALUES (p_nombre, p_telefono, p_correo, p_direccion);
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertarProducto(IN p_nombre VARCHAR(100), IN p_precio DECIMAL(10,2), IN p_stock INT, IN p_categoria INT)
BEGIN
    IF p_precio <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio debe ser mayor que 0';
    ELSEIF p_stock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    ELSE
        INSERT INTO Productos(nombre_producto, precio, stock, id_categoria)
        VALUES (p_nombre, p_precio, p_stock, p_categoria);
    END IF;
END;
//
DELIMITER ;

INSERT INTO Clientes (nombre, telefono, correo, direccion) VALUES
('Carlos Pérez','3001112233','carlos@gmail.com','Calle 10'),
('María López','3002223344','maria@gmail.com','Calle 20'),
('Juan Gómez','3003334455','juan@gmail.com','Calle 30'),
('Ana Torres','3004445566','ana@gmail.com','Calle 40'),
('Luis Rodríguez','3005556677','luis@gmail.com','Calle 50'),
('Paula Díaz','3006667788','paula@gmail.com','Calle 60'),
('Andrés Ruiz','3007778899','andres@gmail.com','Calle 70'),
('Laura Castro','3008889900','laura@gmail.com','Calle 80'),
('Pedro Ramírez','3009990011','pedro@gmail.com','Calle 90'),
('Marta Sánchez','3010001122','marta@gmail.com','Calle 100');


INSERT INTO Empleados (nombre, cargo, salario) VALUES
('Ricardo González','Cajero',1200),
('Sofía Herrera','Vendedora',1500),
('José Morales','Bodeguero',1100),
('Carmen Díaz','Gerente',3000),
('Felipe Rojas','Vendedor',1400),
('Daniel Castro','Seguridad',1000),
('Juliana Nieto','Cajera',1200),
('David Pérez','Vendedor',1350),
('Natalia Ruiz','Bodeguera',1100),
('Santiago Ortiz','Administrador',2500);

INSERT INTO Categorias (nombre_categoria, descripcion) VALUES
('Fútbol','Productos de fútbol'),
('Baloncesto','Productos de baloncesto'),
('Tenis','Ropa y accesorios de tenis'),
('Natación','Accesorios de natación'),
('Gym','Pesas y accesorios de gimnasio'),
('Ciclismo','Artículos de ciclismo'),
('Running','Zapatos de running'),
('Boxeo','Accesorios de boxeo'),
('Camping','Artículos para acampar'),
('Básicos','Ropa deportiva general');

INSERT INTO Productos (nombre_producto, precio, stock, id_categoria) VALUES
('Balón de fútbol Adidas',80000,50,1),
('Zapatos Nike Futbol',250000,30,1),
('Balón de baloncesto Spalding',90000,40,2),
('Raqueta Wilson',180000,20,3),
('Gafas de natación Arena',60000,50,4),
('Mancuernas 10kg',70000,25,5),
('Bicicleta montaña GW',1200000,10,6),
('Zapatos Running Adidas',300000,35,7),
('Guantes de box Everlast',100000,15,8),
('Carpa Coleman',450000,8,9);

INSERT INTO Ventas (fecha, id_cliente, id_empleado) VALUES
('2025-09-01',1,1),
('2025-09-01',2,2),
('2025-09-02',3,3),
('2025-09-02',4,4),
('2025-09-03',5,5),
('2025-09-03',6,6),
('2025-09-04',7,7),
('2025-09-04',8,8),
('2025-09-05',9,9),
('2025-09-05',10,10);

INSERT INTO DetalleVenta (id_venta, id_producto, cantidad, subtotal) VALUES
(1,1,2,160000),
(2,2,1,250000),
(3,3,1,90000),
(4,4,2,360000),
(5,5,3,180000),
(6,6,1,70000),
(7,7,1,1200000),
(8,8,2,600000),
(9,9,1,100000),
(10,10,1,450000);

INSERT INTO Proveedores (nombre, telefono, correo, direccion) VALUES
('Deportes Colombia','3101112233','deportescol@gmail.com','Calle 5'),
('SportLine','3102223344','sportline@gmail.com','Calle 6'),
('Nike Colombia','3103334455','nikecol@gmail.com','Calle 7'),
('Adidas Colombia','3104445566','adidascol@gmail.com','Calle 8'),
('Arena Sports','3105556677','arena@gmail.com','Calle 9'),
('Everlast','3106667788','everlast@gmail.com','Calle 10'),
('Spalding','3107778899','spalding@gmail.com','Calle 11'),
('Coleman','3108889900','coleman@gmail.com','Calle 12'),
('GW Bikes','3109990011','gw@gmail.com','Calle 13'),
('Wilson','3110001122','wilson@gmail.com','Calle 14');

CREATE VIEW Reporte_VentasPorCliente AS
SELECT c.nombre, COUNT(v.id_venta) AS total_compras, SUM(d.subtotal) AS gasto_total
FROM Clientes c
JOIN Ventas v ON c.id_cliente = v.id_cliente
JOIN DetalleVenta d ON v.id_venta = d.id_venta
GROUP BY c.nombre;

CREATE VIEW Reporte_ProductosMasVendidos AS
SELECT p.nombre_producto, SUM(d.cantidad) AS total_vendido
FROM Productos p
JOIN DetalleVenta d ON p.id_producto = d.id_producto
GROUP BY p.nombre_producto
ORDER BY total_vendido DESC;

CREATE VIEW Reporte_VentasPorEmpleado AS
SELECT e.nombre, COUNT(v.id_venta) AS total_ventas, SUM(d.subtotal) AS total_recaudado
FROM Empleados e
JOIN Ventas v ON e.id_empleado = v.id_empleado
JOIN DetalleVenta d ON v.id_venta = d.id_venta
GROUP BY e.nombre;

CREATE VIEW Reporte_StockProductos AS
SELECT nombre_producto, stock
FROM Productos
ORDER BY stock ASC;

CREATE VIEW Reporte_ClientesVIP AS
SELECT c.nombre, SUM(d.subtotal) AS gasto_total
FROM Clientes c
JOIN Ventas v ON c.id_cliente = v.id_cliente
JOIN DetalleVenta d ON v.id_venta = d.id_venta
GROUP BY c.nombre
ORDER BY gasto_total DESC
LIMIT 5;