CREATE DATABASE TransporteMaritimoDB;
USE TransporteMaritimoDB;


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
CREATE PROCEDURE crear_tabla_barcos()
BEGIN
    CREATE TABLE IF NOT EXISTS Barcos (
        idBarco INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        capacidad INT CHECK (capacidad > 0),
        tipo VARCHAR(50),
        estado ENUM('Disponible','En Mantenimiento','En Ruta') DEFAULT 'Disponible'
    );
END //
DELIMITER ;
CALL crear_tabla_barcos();

DELIMITER //
CREATE PROCEDURE crear_tabla_puertos()
BEGIN
    CREATE TABLE IF NOT EXISTS Puertos (
        idPuerto INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        ciudad VARCHAR(100),
        pais VARCHAR(100)
    );
END //
DELIMITER ;
CALL crear_tabla_puertos();

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
CREATE PROCEDURE crear_tabla_rutas()
BEGIN
    CREATE TABLE IF NOT EXISTS Rutas (
        idRuta INT AUTO_INCREMENT PRIMARY KEY,
        origen INT,
        destino INT,
        distancia DECIMAL(10,2) CHECK (distancia > 0),
        FOREIGN KEY (origen) REFERENCES Puertos(idPuerto),
        FOREIGN KEY (destino) REFERENCES Puertos(idPuerto)
    );
END //
DELIMITER ;
CALL crear_tabla_rutas();

DELIMITER //
CREATE PROCEDURE crear_tabla_viajes()
BEGIN
    CREATE TABLE IF NOT EXISTS Viajes (
        idViaje INT AUTO_INCREMENT PRIMARY KEY,
        idBarco INT,
        idRuta INT,
        fechaSalida DATETIME,
        fechaLlegada DATETIME,
        FOREIGN KEY (idBarco) REFERENCES Barcos(idBarco),
        FOREIGN KEY (idRuta) REFERENCES Rutas(idRuta)
    );
END //
DELIMITER ;
CALL crear_tabla_viajes();

DELIMITER //
CREATE PROCEDURE crear_tabla_cargas()
BEGIN
    CREATE TABLE IF NOT EXISTS Cargas (
        idCarga INT AUTO_INCREMENT PRIMARY KEY,
        idViaje INT,
        idCliente INT,
        descripcion VARCHAR(200),
        peso DECIMAL(10,2) CHECK (peso > 0),
        FOREIGN KEY (idViaje) REFERENCES Viajes(idViaje),
        FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
    );
END //
DELIMITER ;
CALL crear_tabla_cargas();

INSERT INTO Clientes VALUES
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


INSERT INTO Barcos VALUES
('Titanic II', 500, 'Carga', 'Disponible'),
('Poseidón', 300, 'Pasajeros', 'En Ruta'),
('Neptuno', 450, 'Carga', 'Disponible'),
('Atlántico', 200, 'Pesquero', 'Disponible'),
('Mar del Sur', 600, 'Carga', 'En Ruta'),
('Caribeño', 250, 'Pasajeros', 'Disponible'),
('Océano Azul', 700, 'Carga', 'Disponible'),
('Tridente', 400, 'Carga', 'En Mantenimiento'),
('Sirena', 150, 'Pesquero', 'Disponible'),
('Hércules', 800, 'Carga', 'Disponible');


INSERT INTO Puertos VALUES
('Puerto de Cartagena','Cartagena','Colombia'),
('Puerto de Barranquilla','Barranquilla','Colombia'),
('Puerto de Miami','Miami','USA'),
('Puerto de Valencia','Valencia','España'),
('Puerto de Santos','Santos','Brasil'),
('Puerto de Shanghái','Shanghái','China'),
('Puerto de Tokio','Tokio','Japón'),
('Puerto de Panamá','Ciudad de Panamá','Panamá'),
('Puerto de Hamburgo','Hamburgo','Alemania'),
('Puerto de Buenos Aires','Buenos Aires','Argentina');

INSERT INTO Empleados VALUES
('José Herrera','Capitán','3101111111',5000.00),
('Carolina Díaz','Marinero','3102222222',2500.00),
('David Ramírez','Mecánico','3103333333',3000.00),
('Sofía Méndez','Oficial','3104444444',2800.00),
('Fernando Cruz','Administrador','3105555555',4000.00),
('Paula Rincón','Marinero','3106666666',2500.00),
('Santiago Vargas','Cocinero','3107777777',2200.00),
('Natalia Moreno','Oficial','3108888888',2800.00),
('Ricardo Castillo','Capitán','3109999999',5000.00),
('Camila López','Marinero','3110000000',2500.00);

INSERT INTO Rutas VALUES
(1, 3, 2500),
(2, 4, 3500),
(3, 5, 4800),
(4, 6, 7000),
(5, 7, 9000),
(6, 8, 1200),
(7, 9, 11000),
(8, 10, 5000),
(9, 1, 8200),
(10, 2, 7600);


INSERT INTO Viajes VALUES
(1,1,NOW(),DATE_ADD(NOW(),INTERVAL 5 DAY)),
(2,2,NOW(),DATE_ADD(NOW(),INTERVAL 7 DAY)),
(3,3,NOW(),DATE_ADD(NOW(),INTERVAL 8 DAY)),
(4,4,NOW(),DATE_ADD(NOW(),INTERVAL 9 DAY)),
(5,5,NOW(),DATE_ADD(NOW(),INTERVAL 11 DAY)),
(6,6,NOW(),DATE_ADD(NOW(),INTERVAL 3 DAY)),
(7,7,NOW(),DATE_ADD(NOW(),INTERVAL 12 DAY)),
(8,8,NOW(),DATE_ADD(NOW(),INTERVAL 6 DAY)),
(9,9,NOW(),DATE_ADD(NOW(),INTERVAL 10 DAY)),
(10,10,NOW(),DATE_ADD(NOW(),INTERVAL 8 DAY));


INSERT INTO Cargas VALUES
(1,1,'Contenedor de ropa',1200),
(2,2,'Vehículos',5000),
(3,3,'Electrodomésticos',3000),
(4,4,'Alimentos',2000),
(5,5,'Maquinaria pesada',7000),
(6,6,'Medicamentos',1000),
(7,7,'Muebles',3500),
(8,8,'Textiles',1500),
(9,9,'Productos químicos',2500),
(10,10,'Material de construcción',8000);

CREATE VIEW Reporte_Carga_Cliente AS
SELECT c.nombre, SUM(ca.peso) AS TotalPeso
FROM Clientes c
JOIN Cargas ca ON c.idCliente = ca.idCliente
GROUP BY c.nombre;

CREATE VIEW Reporte_Barcos_Capacidad AS
SELECT nombre, capacidad, estado
FROM Barcos
ORDER BY capacidad DESC;

CREATE VIEW Reporte_Rutas_Largas AS
SELECT r.idRuta, p1.nombre AS Origen, p2.nombre AS Destino, r.distancia
FROM Rutas r
JOIN Puertos p1 ON r.origen = p1.idPuerto
JOIN Puertos p2 ON r.destino = p2.idPuerto
ORDER BY r.distancia DESC;

CREATE VIEW Reporte_Viajes_Barco AS
SELECT b.nombre AS Barco, COUNT(v.idViaje) AS TotalViajes
FROM Barcos b
JOIN Viajes v ON b.idBarco = v.idBarco
GROUP BY b.nombre;

CREATE VIEW Reporte_Carga_Puerto_Destino AS
SELECT p.nombre AS PuertoDestino, SUM(ca.peso) AS TotalCarga
FROM Cargas ca
JOIN Viajes v ON ca.idViaje = v.idViaje
JOIN Rutas r ON v.idRuta = r.idRuta
JOIN Puertos p ON r.destino = p.idPuerto
GROUP BY p.nombre
ORDER BY TotalCarga DESC;
