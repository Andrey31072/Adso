CREATE DATABASE Aerolinea;
USE Aerolinea;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) UNIQUE,
    correo VARCHAR(100) UNIQUE,
    pasaporte VARCHAR(20) UNIQUE
);

CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2) CHECK (salario >= 0)
);

CREATE TABLE Aeropuertos (
    id_aeropuerto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100),
    pais VARCHAR(100)
);

CREATE TABLE Aviones (
    id_avion INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    capacidad INT CHECK (capacidad > 0),
    fabricante VARCHAR(100)
);

CREATE TABLE Vuelos (
    id_vuelo INT AUTO_INCREMENT PRIMARY KEY,
    numero_vuelo VARCHAR(20) UNIQUE,
    id_avion INT,
    id_aeropuerto_origen INT,
    id_aeropuerto_destino INT,
    fecha DATE,
    hora TIME,
    FOREIGN KEY (id_avion) REFERENCES Aviones(id_avion),
    FOREIGN KEY (id_aeropuerto_origen) REFERENCES Aeropuertos(id_aeropuerto),
    FOREIGN KEY (id_aeropuerto_destino) REFERENCES Aeropuertos(id_aeropuerto)
);

CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_vuelo INT,
    fecha_reserva DATE,
    estado ENUM('Confirmada','Cancelada','Pendiente'),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_vuelo) REFERENCES Vuelos(id_vuelo)
);

CREATE TABLE Boletos (
    id_boleto INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    asiento VARCHAR(10),
    precio DECIMAL(10,2) CHECK (precio > 0),
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);

DELIMITER //
CREATE PROCEDURE InsertarCliente(IN p_nombre VARCHAR(100), IN p_telefono VARCHAR(20), IN p_correo VARCHAR(100), IN p_pasaporte VARCHAR(20))
BEGIN
    IF p_nombre = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre no puede estar vacío';
    ELSE
        INSERT INTO Clientes(nombre, telefono, correo, pasaporte)
        VALUES (p_nombre, p_telefono, p_correo, p_pasaporte);
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertarVuelo(IN p_numero VARCHAR(20), IN p_avion INT, IN p_origen INT, IN p_destino INT, IN p_fecha DATE, IN p_hora TIME)
BEGIN
    IF p_origen = p_destino THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El origen y destino no pueden ser iguales';
    ELSE
        INSERT INTO Vuelos(numero_vuelo, id_avion, id_aeropuerto_origen, id_aeropuerto_destino, fecha, hora)
        VALUES (p_numero, p_avion, p_origen, p_destino, p_fecha, p_hora);
    END IF;
END;
//
DELIMITER ;

INSERT INTO Clientes  VALUES
('Carlos Pérez','3001112233','carlos@gmail.com','P001'),
('María López','3002223344','maria@gmail.com','P002'),
('Juan Gómez','3003334455','juan@gmail.com','P003'),
('Ana Torres','3004445566','ana@gmail.com','P004'),
('Luis Rodríguez','3005556677','luis@gmail.com','P005'),
('Paula Díaz','3006667788','paula@gmail.com','P006'),
('Andrés Ruiz','3007778899','andres@gmail.com','P007'),
('Laura Castro','3008889900','laura@gmail.com','P008'),
('Pedro Ramírez','3009990011','pedro@gmail.com','P009'),
('Marta Sánchez','3010001122','marta@gmail.com','P010');

INSERT INTO Empleados  VALUES
('Ricardo González','Piloto',8000),
('Sofía Herrera','Copiloto',6000),
('José Morales','Azafato',3000),
('Carmen Díaz','Azafata',3000),
('Felipe Rojas','Tierra',2000),
('Daniel Castro','Mecánico',3500),
('Juliana Nieto','Atención al cliente',2500),
('David Pérez','Piloto',8500),
('Natalia Ruiz','Azafata',3200),
('Santiago Ortiz','Administrador',5000);

INSERT INTO Aeropuertos  VALUES
('El Dorado','Bogotá','Colombia'),
('JFK','Nueva York','EEUU'),
('Barajas','Madrid','España'),
('Ezeiza','Buenos Aires','Argentina'),
('Heathrow','Londres','Reino Unido'),
('Charles de Gaulle','París','Francia'),
('Guarulhos','Sao Paulo','Brasil'),
('Benito Juárez','Ciudad de México','México'),
('Haneda','Tokio','Japón'),
('Changi','Singapur','Singapur');

INSERT INTO Aviones  VALUES
('Boeing 737',180,'Boeing'),
('Airbus A320',200,'Airbus'),
('Boeing 777',350,'Boeing'),
('Airbus A330',300,'Airbus'),
('Boeing 747',400,'Boeing'),
('Airbus A380',500,'Airbus'),
('Embraer 190',100,'Embraer'),
('ATR 72',70,'ATR'),
('Boeing 787',330,'Boeing'),
('Airbus A350',350,'Airbus');

INSERT INTO Vuelos VALUES
('AV100',1,1,2,'2025-09-01','08:00:00'),
('AV101',2,2,3,'2025-09-01','09:00:00'),
('AV102',3,3,4,'2025-09-02','10:00:00'),
('AV103',4,4,5,'2025-09-02','11:00:00'),
('AV104',5,5,6,'2025-09-03','12:00:00'),
('AV105',6,6,7,'2025-09-03','13:00:00'),
('AV106',7,7,8,'2025-09-04','14:00:00'),
('AV107',8,8,9,'2025-09-04','15:00:00'),
('AV108',9,9,10,'2025-09-05','16:00:00'),
('AV109',10,10,1,'2025-09-05','17:00:00');

INSERT INTO Reservas VALUES
(1,1,'2025-08-20','Confirmada'),
(2,2,'2025-08-21','Confirmada'),
(3,3,'2025-08-22','Pendiente'),
(4,4,'2025-08-23','Confirmada'),
(5,5,'2025-08-24','Cancelada'),
(6,6,'2025-08-25','Confirmada'),
(7,7,'2025-08-26','Pendiente'),
(8,8,'2025-08-27','Confirmada'),
(9,9,'2025-08-28','Confirmada'),
(10,10,'2025-08-29','Confirmada');

INSERT INTO Boletos VALUES
(1,'1A',500),
(2,'2B',600),
(3,'3C',700),
(4,'4D',800),
(5,'5E',900),
(6,'6F',1000),
(7,'7G',650),
(8,'8H',750),
(9,'9I',850),
(10,'10J',950);


CREATE VIEW Reporte_ReservasPorCliente AS
SELECT c.nombre, COUNT(r.id_reserva) AS total_reservas
FROM Clientes c
JOIN Reservas r ON c.id_cliente = r.id_cliente
GROUP BY c.nombre;

CREATE VIEW Reporte_VuelosPorOrigen AS
SELECT a.nombre AS aeropuerto_origen, COUNT(v.id_vuelo) AS total_vuelos
FROM Aeropuertos a
JOIN Vuelos v ON a.id_aeropuerto = v.id_aeropuerto_origen
GROUP BY a.nombre;

CREATE VIEW Reporte_IngresosPorVuelo AS
SELECT v.numero_vuelo, SUM(b.precio) AS ingresos
FROM Vuelos v
JOIN Reservas r ON v.id_vuelo = r.id_vuelo
JOIN Boletos b ON r.id_reserva = b.id_reserva
GROUP BY v.numero_vuelo;

CREATE VIEW Reporte_ClientesVIP AS
SELECT c.nombre, SUM(b.precio) AS gasto_total
FROM Clientes c
JOIN Reservas r ON c.id_cliente = r.id_cliente
JOIN Boletos b ON r.id_reserva = b.id_reserva
GROUP BY c.nombre
ORDER BY gasto_total DESC
LIMIT 5;

CREATE VIEW Reporte_OcupacionAviones AS
SELECT av.modelo, COUNT(b.id_boleto) AS boletos_vendidos
FROM Aviones av
JOIN Vuelos v ON av.id_avion = v.id_avion
JOIN Reservas r ON v.id_vuelo = r.id_vuelo
JOIN Boletos b ON r.id_reserva = b.id_reserva
GROUP BY av.modelo;