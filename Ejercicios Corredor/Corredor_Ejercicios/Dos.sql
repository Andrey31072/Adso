CREATE DATABASE hospital_ambulancia;
USE hospital_ambulancia;


DELIMITER //
CREATE PROCEDURE Crear_Hospital()
BEGIN
  CREATE TABLE IF NOT EXISTS Hospital (
    idHospital INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    telefono VARCHAR(15) NOT NULL
  );
END //
DELIMITER ;
CALL Crear_Hospital();


DELIMITER //
CREATE PROCEDURE Crear_Ambulancia()
BEGIN
  CREATE TABLE IF NOT EXISTS Ambulancia (
    idAmbulancia INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    tipo ENUM('Básica','Avanzada') NOT NULL,
    estado ENUM('Disponible','Ocupada') DEFAULT 'Disponible',
    idHospital INT,
    FOREIGN KEY(idHospital) REFERENCES Hospital(idHospital)
  );
END //
DELIMITER ;
CALL Crear_Ambulancia();


DELIMITER //
CREATE PROCEDURE Crear_Conductor()
BEGIN
  CREATE TABLE IF NOT EXISTS Conductor (
    idConductor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    licencia VARCHAR(15) UNIQUE NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    idHospital INT,
    FOREIGN KEY(idHospital) REFERENCES Hospital(idHospital)
  );
END //
DELIMITER ;
CALL Crear_Conductor();


DELIMITER //
CREATE PROCEDURE Crear_Paciente()
BEGIN
  CREATE TABLE IF NOT EXISTS Paciente (
    idPaciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT CHECK(edad > 0 AND edad < 120),
    direccion VARCHAR(150),
    telefono VARCHAR(15)
  );
END //
DELIMITER ;
CALL Crear_Paciente();

DELIMITER //
CREATE PROCEDURE Crear_SolicitudAmbulancia()
BEGIN
  CREATE TABLE IF NOT EXISTS SolicitudAmbulancia (
    idSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME DEFAULT NOW(),
    motivo VARCHAR(200) NOT NULL,
    idPaciente INT,
    idHospital INT,
    FOREIGN KEY(idPaciente) REFERENCES Paciente(idPaciente),
    FOREIGN KEY(idHospital) REFERENCES Hospital(idHospital)
  );
END //
DELIMITER ;
CALL Crear_SolicitudAmbulancia();

DELIMITER //
CREATE PROCEDURE Crear_Recorrido()
BEGIN
  CREATE TABLE IF NOT EXISTS Recorrido (
    idRecorrido INT AUTO_INCREMENT PRIMARY KEY,
    idAmbulancia INT,
    idConductor INT,
    idSolicitud INT,
    kmRecorridos DECIMAL(6,2) CHECK(kmRecorridos >= 0 AND kmRecorridos <= 400),
    FOREIGN KEY(idAmbulancia) REFERENCES Ambulancia(idAmbulancia),
    FOREIGN KEY(idConductor) REFERENCES Conductor(idConductor),
    FOREIGN KEY(idSolicitud) REFERENCES SolicitudAmbulancia(idSolicitud)
  );
END //
DELIMITER ;
CALL Crear_Recorrido();

DELIMITER //
CREATE PROCEDURE Crear_Emergencia()
BEGIN
  CREATE TABLE IF NOT EXISTS Emergencia (
    idEmergencia INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    nivelGravedad ENUM('Leve','Moderada','Grave') NOT NULL,
    idSolicitud INT,
    FOREIGN KEY(idSolicitud) REFERENCES SolicitudAmbulancia(idSolicitud)
  );
END //
DELIMITER ;
CALL Crear_Emergencia();

INSERT INTO Hospital VALUES
('Hospital Central','Calle 10 #20-30','3101111111'),
('Hospital Norte','Av 15 #45-12','3102222222'),
('Hospital Sur','Calle 100 #25-60','3103333333'),
('Hospital Occidente','Cra 70 #80-90','3104444444'),
('Hospital Oriente','Av 80 #10-15','3105555555'),
('Clínica Salud','Cra 12 #34-56','3106666666'),
('Clínica Vida','Av 60 #70-20','3107777777'),
('Hospital Infantil','Cra 25 #12-50','3108888888'),
('Hospital Militar','Av 90 #30-40','3109999999'),
('Hospital Universitario','Cra 40 #50-60','3110000000');

INSERT INTO Ambulancia  VALUES
('ABC123','Básica','Disponible',1),
('XYZ789','Avanzada','Disponible',1),
('JKL456','Básica','Ocupada',2),
('MNO321','Avanzada','Disponible',2),
('QWE654','Básica','Disponible',3),
('RTY987','Avanzada','Disponible',3),
('UIO741','Básica','Ocupada',4),
('PAS963','Avanzada','Disponible',4),
('DFG852','Básica','Disponible',5),
('HJK159','Avanzada','Disponible',5);

INSERT INTO Conductor  VALUES
('Carlos Pérez','LIC123','3001111111',1),
('María Gómez','LIC456','3002222222',1),
('Juan Rodríguez','LIC789','3003333333',2),
('Ana Martínez','LIC321','3004444444',2),
('Luis Torres','LIC654','3005555555',3),
('Laura Sánchez','LIC987','3006666666',3),
('Pedro Ramírez','LIC741','3007777777',4),
('Sofía Díaz','LIC852','3008888888',4),
('Andrés Castro','LIC963','3009999999',5),
('Valentina Ríos','LIC159','3010000000',5);

INSERT INTO Paciente VALUES
('Jorge Herrera',45,'Cra 12 #45-60','3111111111'),
('Camila López',30,'Av 15 #12-34','3112222222'),
('Felipe García',55,'Calle 100 #25-60','3113333333'),
('Diana Moreno',28,'Cra 70 #80-90','3114444444'),
('Sebastián Álvarez',65,'Av 80 #10-15','3115555555'),
('Paula Vargas',19,'Cra 12 #34-56','3116666666'),
('Miguel Castro',40,'Av 60 #70-20','3117777777'),
('Lucía Romero',33,'Cra 25 #12-50','3118888888'),
('Ricardo Silva',50,'Av 90 #30-40','3119999999'),
('Manuela Ortiz',22,'Cra 40 #50-60','3120000000');

INSERT INTO SolicitudAmbulancia VALUES
('Accidente de tránsito',1,1),
('Infarto',2,1),
('Caída grave',3,2),
('Quemadura',4,2),
('Dificultad respiratoria',5,3),
('Parto de urgencia',6,3),
('Herida por arma blanca',7,4),
('Convulsiones',8,4),
('Golpe en la cabeza',9,5),
('Hipertensión severa',10,5);

INSERT INTO Recorrido VALUES
(1,1,1,12.5),
(2,2,2,8.3),
(3,3,3,15.0),
(4,4,4,22.7),
(5,5,5,9.8),
(6,6,6,18.4),
(7,7,7,25.6),
(8,8,8,14.2),
(9,9,9,19.9),
(10,10,10,30.0);

INSERT INTO Emergencia VALUES
('Accidente de tránsito','Grave',1),
('Infarto','Grave',2),
('Caída grave','Moderada',3),
('Quemadura','Moderada',4),
('Dificultad respiratoria','Grave',5),
('Parto de urgencia','Grave',6),
('Herida por arma blanca','Grave',7),
('Convulsiones','Moderada',8),
('Golpe en la cabeza','Leve',9),
('Hipertensión severa','Moderada',10);
