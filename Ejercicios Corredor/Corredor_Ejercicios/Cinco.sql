CREATE DATABASE EfectyDB;
USE EfectyDB;



DELIMITER //


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
        cargo VARCHAR(50) NOT NULL,
        telefono VARCHAR(15),
        sucursal VARCHAR(100)
    );
END//


CREATE PROCEDURE CrearTablaSucursal()
BEGIN
    CREATE TABLE IF NOT EXISTS Sucursal(
        idSucursal INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        direccion VARCHAR(150) NOT NULL,
        telefono VARCHAR(15)
    );
END//


CREATE PROCEDURE CrearTablaGiro()
BEGIN
    CREATE TABLE IF NOT EXISTS Giro(
        idGiro INT AUTO_INCREMENT PRIMARY KEY,
        monto DECIMAL(10,2) CHECK(monto > 0),
        fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        estado ENUM('Enviado','Pagado','Cancelado') DEFAULT 'Enviado',
        idClienteEmisor INT,
        idClienteReceptor INT,
        idEmpleado INT,
        FOREIGN KEY (idClienteEmisor) REFERENCES Cliente(idCliente),
        FOREIGN KEY (idClienteReceptor) REFERENCES Cliente(idCliente),
        FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
    );
END//

CREATE PROCEDURE CrearTablaPagoServicio()
BEGIN
    CREATE TABLE IF NOT EXISTS PagoServicio(
        idPago INT AUTO_INCREMENT PRIMARY KEY,
        servicio VARCHAR(100) NOT NULL,
        referencia VARCHAR(50) NOT NULL,
        monto DECIMAL(10,2) CHECK(monto > 0),
        fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        idCliente INT,
        FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
    );
END//

CREATE PROCEDURE CrearTablaTransaccion()
BEGIN
    CREATE TABLE IF NOT EXISTS Transaccion(
        idTransaccion INT AUTO_INCREMENT PRIMARY KEY,
        tipo ENUM('Giro','Pago Servicio') NOT NULL,
        monto DECIMAL(10,2) CHECK(monto > 0),
        fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        idCliente INT,
        FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
    );
END//

CREATE PROCEDURE CrearTablaAuditoria()
BEGIN
    CREATE TABLE IF NOT EXISTS Auditoria(
        idAuditoria INT AUTO_INCREMENT PRIMARY KEY,
        descripcion TEXT NOT NULL,
        fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        usuario VARCHAR(50) NOT NULL
    );
END//

DELIMITER ;

CALL CrearTablaCliente();
CALL CrearTablaEmpleado();
CALL CrearTablaSucursal();
CALL CrearTablaGiro();
CALL CrearTablaPagoServicio();
CALL CrearTablaTransaccion();
CALL CrearTablaAuditoria();


INSERT INTO Cliente VALUES
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

INSERT INTO Empleado VALUES
('Marta Silva','Cajera','3101111111','Sucursal Norte'),
('José Herrera','Asesor','3102222222','Sucursal Norte'),
('Claudia Ruiz','Supervisor','3103333333','Sucursal Centro'),
('Felipe González','Cajero','3104444444','Sucursal Centro'),
('Diana Torres','Asesora','3105555555','Sucursal Sur'),
('Ricardo Morales','Gerente','3106666666','Sucursal Sur'),
('Carolina Rojas','Cajera','3107777777','Sucursal Occidente'),
('Hugo Martínez','Asesor','3108888888','Sucursal Occidente'),
('Natalia López','Cajera','3109999999','Sucursal Oriente'),
('Miguel Ángel','Supervisor','3110000000','Sucursal Oriente');


INSERT INTO Sucursal VALUES
('Sucursal Norte','Cra 10 #10-20','3201111111'),
('Sucursal Centro','Av 15 #30-40','3202222222'),
('Sucursal Sur','Calle 80 #20-30','3203333333'),
('Sucursal Occidente','Cra 50 #60-70','3204444444'),
('Sucursal Oriente','Av 100 #25-35','3205555555'),
('Sucursal Chapinero','Cra 12 #34-56','3206666666'),
('Sucursal Teusaquillo','Av 60 #70-20','3207777777'),
('Sucursal Usaquén','Cra 25 #12-50','3208888888'),
('Sucursal Kennedy','Av 90 #30-40','3209999999'),
('Sucursal Suba','Cra 40 #50-60','3210000000');


INSERT INTO Giro VALUES
(50000,1,2,1,'Enviado'),
(120000,3,4,2,'Pagado'),
(75000,5,6,3,'Enviado'),
(200000,7,8,4,'Pagado'),
(90000,9,10,5,'Enviado'),
(150000,2,3,6,'Cancelado'),
(300000,4,5,7,'Pagado'),
(100000,6,7,8,'Enviado'),
(220000,8,9,9,'Pagado'),
(180000,10,1,10,'Enviado');

INSERT INTO PagoServicio VALUES
('Energía','REF1001',60000,1),
('Agua','REF1002',45000,2),
('Internet','REF1003',80000,3),
('Gas','REF1004',50000,4),
('Teléfono','REF1005',40000,5),
('Televisión','REF1006',55000,6),
('Impuestos','REF1007',120000,7),
('Seguridad','REF1008',70000,8),
('Parqueadero','REF1009',35000,9),
('EPS','REF1010',95000,10);

INSERT INTO Transaccion VALUES
('Giro',50000,1),
('Giro',120000,3),
('Pago Servicio',60000,1),
('Pago Servicio',45000,2),
('Giro',75000,5),
('Pago Servicio',80000,3),
('Giro',200000,7),
('Pago Servicio',50000,4),
('Pago Servicio',40000,5),
('Giro',90000,9);

INSERT INTO Auditoria VALUES
('Creación de cliente Juan Pérez','admin'),
('Creación de cliente Ana Gómez','admin'),
('Registro de giro #1','empleado1'),
('Pago de servicio #1','empleado2'),
('Creación de sucursal Norte','admin'),
('Modificación de cliente Pedro Sánchez','empleado3'),
('Cancelación de giro #6','empleado4'),
('Registro de auditoría sistema','system'),
('Pago de servicio #7','empleado2'),
('Creación de cliente Andrés Gómez','admin');


CREATE VIEW Reporte_GirosCliente AS
SELECT c.nombre, COUNT(g.idGiro) AS total_giros, SUM(g.monto) AS monto_total
FROM Cliente c
JOIN Giro g ON c.idCliente = g.idClienteEmisor
GROUP BY c.idCliente;


CREATE VIEW Reporte_PagosServicios AS
SELECT servicio, COUNT(idPago) AS total_pagos, SUM(monto) AS monto_total
FROM PagoServicio
GROUP BY servicio;


CREATE VIEW Reporte_TransaccionesCliente AS
SELECT c.nombre, COUNT(t.idTransaccion) AS num_transacciones, SUM(t.monto) AS monto_total
FROM Cliente c
JOIN Transaccion t ON c.idCliente = t.idCliente
GROUP BY c.idCliente;


CREATE VIEW Reporte_GirosEmpleado AS
SELECT e.nombre, COUNT(g.idGiro) AS total_giros, SUM(g.monto) AS monto_total
FROM Empleado e
JOIN Giro g ON e.idEmpleado = g.idEmpleado
GROUP BY e.idEmpleado;


CREATE VIEW Reporte_Auditoria AS
SELECT usuario, COUNT(idAuditoria) AS acciones, MAX(fecha) AS ultima_accion
FROM Auditoria
GROUP BY usuario;
