CREATE DATABASE TiendaRopaDB;
USE TiendaRopaDB;


DELIMITER//


CREATE PROCEDURE CrearTablaCliente()
BEGIN
    CREATE TABLE IF NOT EXISTS Cliente(
        idCliente INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        documento VARCHAR(20) UNIQUE NOT NULL,
        telefono VARCHAR(15),
        direccion VARCHAR(150)
    );
END//

CREATE PROCEDURE CrearTablaEmpleado()
BEGIN
    CREATE TABLE IF NOT EXISTS Empleado(
        idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        cargo ENUM('Cajero','Vendedor','Gerente','Almacén') NOT NULL,
        telefono VARCHAR(15),
        salario DECIMAL(10,2) CHECK(salario > 0)
    );
END//


CREATE PROCEDURE CrearTablaCategoria()
BEGIN
    CREATE TABLE IF NOT EXISTS Categoria(
        idCategoria INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) UNIQUE NOT NULL,
        descripcion VARCHAR(150)
    );
END//


CREATE PROCEDURE CrearTablaProducto()
BEGIN
    CREATE TABLE IF NOT EXISTS Producto(
        idProducto INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        precio DECIMAL(10,2) CHECK(precio > 0),
        stock INT CHECK(stock >= 0),
        idCategoria INT,
        FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
    );
END//


CREATE PROCEDURE CrearTablaVenta()
BEGIN
    CREATE TABLE IF NOT EXISTS Venta(
        idVenta INT AUTO_INCREMENT PRIMARY KEY,
        fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        idCliente INT,
        idEmpleado INT,
        FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
        FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
    );
END//


CREATE PROCEDURE CrearTablaDetalleVenta()
BEGIN
    CREATE TABLE IF NOT EXISTS DetalleVenta(
        idDetalle INT AUTO_INCREMENT PRIMARY KEY,
        idVenta INT,
        idProducto INT,
        cantidad INT CHECK(cantidad > 0),
        subtotal DECIMAL(10,2) CHECK(subtotal >= 0),
        FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
        FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
    );
END//


CREATE PROCEDURE CrearTablaProveedor()
BEGIN
    CREATE TABLE IF NOT EXISTS Proveedor(
        idProveedor INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        telefono VARCHAR(15),
        direccion VARCHAR(150),
        productoSuministra VARCHAR(100)
    );
END//

DELIMITER ;

CALL CrearTablaCliente();
CALL CrearTablaEmpleado();
CALL CrearTablaCategoria();
CALL CrearTablaProducto();
CALL CrearTablaVenta();
CALL CrearTablaDetalleVenta();
CALL CrearTablaProveedor();

INSERT INTO Cliente(nombre,documento,telefono,direccion) VALUES
('Juan Pérez','1001','3001111111','Cra 10 #20-30'),
('Ana Gómez','1002','3002222222','Av 15 #25-60'),
('Luis Torres','1003','3003333333','Calle 80 #12-15'),
('María López','1004','3004444444','Cra 50 #70-90'),
('Pedro Sánchez','1005','3005555555','Av 30 #40-50'),
('Laura Díaz','1006','3006666666','Cra 60 #15-25'),
('Carlos Ríos','1007','3007777777','Av 70 #10-15'),
('Camila Ruiz','1008','3008888888','Cra 80 #20-30'),
('Sofía Castro','1009','3009999999','Calle 100 #12-40'),
('Andrés Gómez','1010','3010000000','Cra 90 #30-40');


INSERT INTO Empleado(nombre,cargo,telefono,salario) VALUES
('Marta Silva','Cajero','3101111111',1500000),
('José Herrera','Vendedor','3102222222',1200000),
('Claudia Ruiz','Gerente','3103333333',3000000),
('Felipe González','Cajero','3104444444',1500000),
('Diana Torres','Vendedor','3105555555',1300000),
('Ricardo Morales','Almacén','3106666666',1400000),
('Carolina Rojas','Cajero','3107777777',1500000),
('Hugo Martínez','Vendedor','3108888888',1250000),
('Natalia López','Almacén','3109999999',1350000),
('Miguel Ángel','Vendedor','3110000000',1280000);

INSERT INTO Categoria(nombre,descripcion) VALUES
('Camisas','Camisas de hombre y mujer'),
('Pantalones','Pantalones casuales y formales'),
('Zapatos','Zapatos deportivos y elegantes'),
('Accesorios','Correas, bufandas, etc.'),
('Chaquetas','Chaquetas de cuero y tela'),
('Vestidos','Vestidos de fiesta y casuales'),
('Deportivo','Ropa deportiva variada'),
('Formal','Trajes y camisas elegantes'),
('Ropa interior','Para hombre y mujer'),
('Niños','Ropa para niños');

INSERT INTO Producto(nombre,precio,stock,idCategoria) VALUES
('Camisa Blanca',45000,20,1),
('Camisa Azul',48000,15,1),
('Pantalón Negro',80000,25,2),
('Pantalón Jeans',75000,30,2),
('Zapatos Negros',120000,10,3),
('Zapatillas Deportivas',95000,18,3),
('Correa Cuero',40000,12,4),
('Chaqueta Cuero',200000,5,5),
('Vestido Rojo',150000,8,6),
('Traje Formal',350000,4,8);

INSERT INTO Venta(idCliente,idEmpleado) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);

INSERT INTO DetalleVenta(idVenta,idProducto,cantidad,subtotal) VALUES
(1,1,2,90000),(2,3,1,80000),(3,4,2,150000),
(4,5,1,120000),(5,6,1,95000),(6,7,3,120000),
(7,8,1,200000),(8,9,1,150000),(9,2,2,96000),(10,10,1,350000);

INSERT INTO Proveedor(nombre,telefono,direccion,productoSuministra) VALUES
('Textiles Bogotá','3201111111','Cra 10 #20-30','Camisas'),
('Moda Jeans','3202222222','Av 15 #25-60','Pantalones'),
('Calzado Express','3203333333','Calle 80 #12-15','Zapatos'),
('Accesorios & Moda','3204444444','Cra 50 #70-90','Accesorios'),
('Leather Pro','3205555555','Av 30 #40-50','Chaquetas'),
('Fiesta Dress','3206666666','Cra 60 #15-25','Vestidos'),
('Deportivo Ya','3207777777','Av 70 #10-15','Ropa deportiva'),
('Elegance Style','3208888888','Cra 80 #20-30','Ropa formal'),
('Kids Fashion','3209999999','Calle 100 #12-40','Ropa niños'),
('Ropa Intima Pro','3210000000','Cra 90 #30-40','Ropa interior');

CREATE VIEW Reporte_VentasCliente AS
SELECT c.nombre, COUNT(v.idVenta) AS total_compras, SUM(d.subtotal) AS monto_total
FROM Cliente c
JOIN Venta v ON c.idCliente = v.idCliente
JOIN DetalleVenta d ON v.idVenta = d.idVenta
GROUP BY c.idCliente;

CREATE VIEW Reporte_ProductosVendidos AS
SELECT p.nombre, SUM(d.cantidad) AS total_vendido, SUM(d.subtotal) AS ingresos
FROM Producto p
JOIN DetalleVenta d ON p.idProducto = d.idProducto
GROUP BY p.idProducto
ORDER BY total_vendido DESC;

CREATE VIEW Reporte_VentasEmpleado AS
SELECT e.nombre, COUNT(v.idVenta) AS ventas_realizadas, SUM(d.subtotal) AS ingresos_generados
FROM Empleado e
JOIN Venta v ON e.idEmpleado = v.idEmpleado
JOIN DetalleVenta d ON v.idVenta = d.idVenta
GROUP BY e.idEmpleado;

CREATE VIEW Reporte_StockBajo AS
SELECT nombre, stock
FROM Producto
WHERE stock < 10;

CREATE VIEW Reporte_CategoriasVendidas AS
SELECT c.nombre, SUM(d.cantidad) AS cantidad_total, SUM(d.subtotal) AS ingresos
FROM Categoria c
JOIN Producto p ON c.idCategoria = p.idCategoria
JOIN DetalleVenta d ON p.idProducto = d.idProducto
GROUP BY c.idCategoria
ORDER BY ingresos DESC;