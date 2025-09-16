CREATE DATABASE RestauranteDB;
USE RestauranteDB;

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
CREATE PROCEDURE crear_tabla_mesas()
BEGIN
    CREATE TABLE IF NOT EXISTS Mesas (
        idMesa INT AUTO_INCREMENT PRIMARY KEY,
        numeroMesa INT NOT NULL UNIQUE,
        capacidad INT CHECK (capacidad > 0),
        ubicacion VARCHAR(50)
    );
END //
DELIMITER ;

CALL crear_tabla_mesas();

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
CREATE PROCEDURE crear_tabla_platos()
BEGIN
    CREATE TABLE IF NOT EXISTS Platos (
        idPlato INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        precio DECIMAL(10,2) CHECK (precio > 0),
        idCategoria INT,
        FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
    );
END //
DELIMITER ;

CALL crear_tabla_platos();

DELIMITER //
CREATE PROCEDURE crear_tabla_pedidos()
BEGIN
    CREATE TABLE IF NOT EXISTS Pedidos (
        idPedido INT AUTO_INCREMENT PRIMARY KEY,
        idCliente INT,
        idEmpleado INT,
        idMesa INT,
        fecha DATETIME DEFAULT NOW(),
        FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
        FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado),
        FOREIGN KEY (idMesa) REFERENCES Mesas(idMesa)
    );
END //
DELIMITER ;

CALL crear_tabla_pedidos();

DELIMITER //
CREATE PROCEDURE crear_tabla_detalle_pedidos()
BEGIN
    CREATE TABLE IF NOT EXISTS DetallePedidos (
        idDetalle INT AUTO_INCREMENT PRIMARY KEY,
        idPedido INT,
        idPlato INT,
        cantidad INT CHECK (cantidad > 0),
        FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido),
        FOREIGN KEY (idPlato) REFERENCES Platos(idPlato)
    );
END //
DELIMITER ;

CALL crear_tabla_detalle_pedidos();

INSERT INTO Clientes (nombre, telefono, email, direccion) VALUES
('Juan Pérez', '3001111111', 'juan@mail.com', 'Calle 1'),
('Ana Gómez', '3002222222', 'ana@mail.com', 'Calle 2'),
('Luis Martínez', '3003333333', 'luis@mail.com', 'Calle 3'),
('Marta López', '3004444444', 'marta@mail.com', 'Calle 4'),
('Carlos Ruiz', '3005555555', 'carlos@mail.com', 'Calle 5'),
('Lucía Torres', '3006666666', 'lucia@mail.com', 'Calle 6'),
('Andrés Rojas', '3007777777', 'andres@mail.com', 'Calle 7'),
('María Fernanda', '3008888888', 'maria@mail.com', 'Calle 8'),
('Pedro Sánchez', '3009999999', 'pedro@mail.com', 'Calle 9'),
('Laura Castro', '3010000000', 'laura@mail.com', 'Calle 10');

INSERT INTO Mesas (numeroMesa, capacidad, ubicacion) VALUES
(1, 2, 'Terraza'),
(2, 4, 'Interior'),
(3, 6, 'VIP'),
(4, 2, 'Bar'),
(5, 8, 'Salón Principal'),
(6, 4, 'Terraza'),
(7, 6, 'VIP'),
(8, 2, 'Interior'),
(9, 10, 'Salón Principal'),
(10, 4, 'Terraza');

INSERT INTO Empleados (nombre, puesto, telefono, salario) VALUES
('José Herrera', 'Mesero', '3101111111', 1200.00),
('Carolina Díaz', 'Mesero', '3102222222', 1200.00),
('David Ramírez', 'Chef', '3103333333', 2000.00),
('Sofía Méndez', 'Cocinero', '3104444444', 1500.00),
('Fernando Cruz', 'Administrador', '3105555555', 2500.00),
('Paula Rincón', 'Mesero', '3106666666', 1200.00),
('Santiago Vargas', 'Cocinero', '3107777777', 1500.00),
('Natalia Moreno', 'Mesero', '3108888888', 1200.00),
('Ricardo Castillo', 'Chef', '3109999999', 2000.00),
('Camila López', 'Mesero', '3110000000', 1200.00);

INSERT INTO Categorias (nombreCategoria) VALUES
('Entradas'),
('Sopas'),
('Platos Fuertes'),
('Postres'),
('Bebidas'),
('Ensaladas'),
('Mariscos'),
('Carnes'),
('Pastas'),
('Vegetariano');

INSERT INTO Platos (nombre, precio, idCategoria) VALUES
('Ensalada César', 15000, 6),
('Sopa de Pollo', 12000, 2),
('Filete de Res', 28000, 8),
('Spaghetti Bolognesa', 22000, 9),
('Camarones al Ajillo', 30000, 7),
('Lasaña Vegetariana', 20000, 10),
('Pollo a la Plancha', 25000, 3),
('Helado Vainilla', 8000, 4),
('Jugo Natural', 7000, 5),
('Cerveza', 9000, 5);

INSERT INTO Pedidos (idCliente, idEmpleado, idMesa, fecha) VALUES
(1, 1, 1, NOW()),
(2, 2, 2, NOW()),
(3, 3, 3, NOW()),
(4, 4, 4, NOW()),
(5, 5, 5, NOW()),
(6, 6, 6, NOW()),
(7, 7, 7, NOW()),
(8, 8, 8, NOW()),
(9, 9, 9, NOW()),
(10, 10, 10, NOW());

INSERT INTO DetallePedidos (idPedido, idPlato, cantidad) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1),
(6, 6, 2),
(7, 7, 1),
(8, 8, 3),
(9, 9, 4),
(10, 10, 2);

CREATE VIEW Reporte_Ventas_Cliente AS
SELECT c.nombre, SUM(dp.cantidad * p.precio) AS TotalGastado
FROM Clientes c
JOIN Pedidos pe ON c.idCliente = pe.idCliente
JOIN DetallePedidos dp ON pe.idPedido = dp.idPedido
JOIN Platos p ON dp.idPlato = p.idPlato
GROUP BY c.nombre;

CREATE VIEW Reporte_Platos_Mas_Vendidos AS
SELECT p.nombre, SUM(dp.cantidad) AS TotalVendido
FROM Platos p
JOIN DetallePedidos dp ON p.idPlato = dp.idPlato
GROUP BY p.nombre
ORDER BY TotalVendido DESC;

CREATE VIEW Reporte_Ventas_Categoria AS
SELECT cat.nombreCategoria, SUM(dp.cantidad * p.precio) AS TotalCategoria
FROM Categorias cat
JOIN Platos p ON cat.idCategoria = p.idCategoria
JOIN DetallePedidos dp ON p.idPlato = dp.idPlato
GROUP BY cat.nombreCategoria;

CREATE VIEW Reporte_Empleados_Pedidos AS
SELECT e.nombre, COUNT(pe.idPedido) AS PedidosAtendidos
FROM Empleados e
JOIN Pedidos pe ON e.idEmpleado = pe.idEmpleado
GROUP BY e.nombre
ORDER BY PedidosAtendidos DESC;

CREATE VIEW Reporte_Mesas_Uso AS
SELECT m.numeroMesa, COUNT(pe.idPedido) AS VecesUsada
FROM Mesas m
JOIN Pedidos pe ON m.idMesa = pe.idMesa
GROUP BY m.numeroMesa
ORDER BY VecesUsada DESC;
