CREATE DATABASE TiendaDB;
USE TiendaDB;

DELIMITER //
CREATE PROCEDURE crear_tabla_clientes()
BEGIN
    CREATE TABLE IF NOT EXISTS Clientes (
        idCliente INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        telefono VARCHAR(15) UNIQUE,
        email VARCHAR(100) UNIQUE,
        direccion VARCHAR(150)
    );
END //
DELIMITER ;
CALL crear_tabla_clientes();

DELIMITER //
CREATE PROCEDURE crear_tabla_categorias()
BEGIN
    CREATE TABLE IF NOT EXISTS Categorias (
        idCategoria INT AUTO_INCREMENT PRIMARY KEY,
        nombreCategoria VARCHAR(50) NOT NULL UNIQUE
    );
END //
DELIMITER ;
CALL crear_tabla_categorias();

DELIMITER //
CREATE PROCEDURE crear_tabla_productos()
BEGIN
    CREATE TABLE IF NOT EXISTS Productos (
        idProducto INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        precio DECIMAL(10,2) CHECK (precio > 0),
        stock INT CHECK (stock >= 0),
        idCategoria INT,
        FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
    );
END //
DELIMITER ;
CALL crear_tabla_productos();

DELIMITER //
CREATE PROCEDURE crear_tabla_empleados()
BEGIN
    CREATE TABLE IF NOT EXISTS Empleados (
        idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        puesto VARCHAR(50) NOT NULL,
        telefono VARCHAR(15) UNIQUE,
        salario DECIMAL(10,2) CHECK (salario >= 0)
    );
END //
DELIMITER ;
CALL crear_tabla_empleados();

DELIMITER //
CREATE PROCEDURE crear_tabla_ventas()
BEGIN
    CREATE TABLE IF NOT EXISTS Ventas (
        idVenta INT AUTO_INCREMENT PRIMARY KEY,
        idCliente INT,
        idEmpleado INT,
        fecha DATETIME DEFAULT NOW(),
        FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
        FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado)
    );
END //
DELIMITER ;
CALL crear_tabla_ventas();

DELIMITER //
CREATE PROCEDURE crear_tabla_detalleventas()
BEGIN
    CREATE TABLE IF NOT EXISTS DetalleVentas (
        idDetalle INT AUTO_INCREMENT PRIMARY KEY,
        idVenta INT,
        idProducto INT,
        cantidad INT CHECK (cantidad > 0),
        FOREIGN KEY (idVenta) REFERENCES Ventas(idVenta),
        FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
    );
END //
DELIMITER ;
CALL crear_tabla_detalleventas();

DELIMITER //
CREATE PROCEDURE crear_tabla_proveedores()
BEGIN
    CREATE TABLE IF NOT EXISTS Proveedores (
        idProveedor INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        telefono VARCHAR(15) UNIQUE,
        email VARCHAR(100) UNIQUE,
        direccion VARCHAR(150)
    );
END //
DELIMITER ;
CALL crear_tabla_proveedores();

INSERT INTO Clientes (nombre, telefono, email, direccion) VALUES
('Juan Pérez','3001111111','juan@mail.com','Calle 1'),
('Ana Gómez','3002222222','ana@mail.com','Calle 2'),
('Luis Martínez','3003333333','luis@mail.com','Calle 3'),
('Marta López','3004444444','marta@mail.com','Calle 4'),
('Carlos Ruiz','3005555555','carlos@mail.com','Calle 5'),
('Lucía Torres','3006666666','lucia@mail.com','Calle 6'),
('Andrés Rojas','3007777777','andres@mail.com','Calle 7'),
('María Fernanda','3008888888','maria@mail.com','Calle 8'),
('Pedro Sánchez','3009999999','pedro@mail.com','Calle 9'),
('Laura Castro','3010000000','laura@mail.com','Calle 10');


INSERT INTO Categorias (nombreCategoria) VALUES
('Bebidas'),
('Lácteos'),
('Carnes'),
('Frutas'),
('Verduras'),
('Snacks'),
('Aseo'),
('Electrónica'),
('Ropa'),
('Panadería');

INSERT INTO Productos (nombre, precio, stock, idCategoria) VALUES
('Coca-Cola', 3000, 50, 1),
('Leche Entera', 4000, 40, 2),
('Pollo Entero', 15000, 20, 3),
('Manzanas', 5000, 30, 4),
('Tomates', 2000, 25, 5),
('Papas Fritas', 2500, 60, 6),
('Jabón en Barra', 1500, 100, 7),
('Audífonos', 35000, 15, 8),
('Camiseta', 20000, 25, 9),
('Pan Tajado', 3500, 35, 10);

INSERT INTO Empleados (nombre, puesto, telefono, salario) VALUES
('José Herrera','Cajero','3101111111',1200.00),
('Carolina Díaz','Vendedor','3102222222',1500.00),
('David Ramírez','Supervisor','3103333333',2000.00),
('Sofía Méndez','Cajero','3104444444',1200.00),
('Fernando Cruz','Administrador','3105555555',2500.00),
('Paula Rincón','Vendedor','3106666666',1500.00),
('Santiago Vargas','Cajero','3107777777',1200.00),
('Natalia Moreno','Vendedor','3108888888',1500.00),
('Ricardo Castillo','Supervisor','3109999999',2000.00),
('Camila López','Vendedor','3110000000',1500.00);

INSERT INTO Ventas (idCliente, idEmpleado, fecha) VALUES
(1,1,NOW()), (2,2,NOW()), (3,3,NOW()), (4,4,NOW()), (5,5,NOW()),
(6,6,NOW()), (7,7,NOW()), (8,8,NOW()), (9,9,NOW()), (10,10,NOW());

INSERT INTO DetalleVentas (idVenta, idProducto, cantidad) VALUES
(1,1,2), (2,2,1), (3,3,1), (4,4,5), (5,5,3),
(6,6,4), (7,7,2), (8,8,1), (9,9,2), (10,10,3);

INSERT INTO Proveedores (nombre, telefono, email, direccion) VALUES
('Distribuidora Bebidas','3201111111','bebidas@mail.com','Av 1'),
('Distribuidora Lácteos','3202222222','lacteos@mail.com','Av 2'),
('Carnes del Norte','3203333333','carnes@mail.com','Av 3'),
('Frutas del Valle','3204444444','frutas@mail.com','Av 4'),
('Verduras Frescas','3205555555','verduras@mail.com','Av 5'),
('Snacks Express','3206666666','snacks@mail.com','Av 6'),
('Aseo Hogar','3207777777','aseo@mail.com','Av 7'),
('Tech Import','3208888888','tech@mail.com','Av 8'),
('Moda Joven','3209999999','ropa@mail.com','Av 9'),
('Panadería El Trigo','3210000000','pan@mail.com','Av 10');

CREATE VIEW Reporte_Ventas_Cliente AS
SELECT c.nombre, SUM(dv.cantidad * p.precio) AS TotalGastado
FROM Clientes c
JOIN Ventas v ON c.idCliente = v.idCliente
JOIN DetalleVentas dv ON v.idVenta = dv.idVenta
JOIN Productos p ON dv.idProducto = p.idProducto
GROUP BY c.nombre;

CREATE VIEW Reporte_Productos_Mas_Vendidos AS
SELECT p.nombre, SUM(dv.cantidad) AS TotalVendido
FROM Productos p
JOIN DetalleVentas dv ON p.idProducto = dv.idProducto
GROUP BY p.nombre
ORDER BY TotalVendido DESC;

CREATE VIEW Reporte_Ventas_Categoria AS
SELECT cat.nombreCategoria, SUM(dv.cantidad * p.precio) AS TotalCategoria
FROM Categorias cat
JOIN Productos p ON cat.idCategoria = p.idCategoria
JOIN DetalleVentas dv ON p.idProducto = dv.idProducto
JOIN Ventas v ON dv.idVenta = v.idVenta
GROUP BY cat.nombreCategoria;

CREATE VIEW Reporte_Empleados_Ventas AS
SELECT e.nombre, COUNT(v.idVenta) AS VentasAtendidas
FROM Empleados e
JOIN Ventas v ON e.idEmpleado = v.idEmpleado
GROUP BY e.nombre
ORDER BY VentasAtendidas DESC;

CREATE VIEW Reporte_Stock_Categoria AS
SELECT cat.nombreCategoria, SUM(p.stock) AS StockTotal
FROM Categorias cat
JOIN Productos p ON cat.idCategoria = p.idCategoria
GROUP BY cat.nombreCategoria;
