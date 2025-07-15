CREATE DATABASE EPS_DB;
USE EPS_DB;

-- Tabla: Paciente
CREATE TABLE Paciente (
    paciente_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    fecha_nacimiento DATE,
    direccion VARCHAR(100)
);

-- Tabla: Medico
CREATE TABLE Medico (
    medico_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    telefono VARCHAR(20)
);

-- Tabla: Especialidad
CREATE TABLE Especialidad (
    especialidad_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Pivote: Medico_Especialidad
CREATE TABLE Medico_Especialidad (
    medico_id INT,
    especialidad_id INT,
    PRIMARY KEY (medico_id, especialidad_id),
    FOREIGN KEY (medico_id) REFERENCES Medico(medico_id),
    FOREIGN KEY (especialidad_id) REFERENCES Especialidad(especialidad_id)
);

-- Tabla: Sede
CREATE TABLE Sede (
    sede_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100)
);

-- Tabla: Cita
CREATE TABLE Cita (
    cita_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    medico_id INT,
    sede_id INT,
    fecha DATE,
    hora TIME,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES Medico(medico_id),
    FOREIGN KEY (sede_id) REFERENCES Sede(sede_id)
);

-- Tabla: Tratamiento
CREATE TABLE Tratamiento (
    tratamiento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Pivote: Paciente_Tratamiento
CREATE TABLE Paciente_Tratamiento (
    paciente_id INT,
    tratamiento_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (paciente_id, tratamiento_id),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id),
    FOREIGN KEY (tratamiento_id) REFERENCES Tratamiento(tratamiento_id)
);

-- Tabla: Factura
CREATE TABLE Factura (
    factura_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    cita_id INT,
    total DECIMAL(10,2),
    fecha_emision DATE,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id),
    FOREIGN KEY (cita_id) REFERENCES Cita(cita_id)
);


SELECT CONCAT(nombre, ' ', apellido) AS NombreCompleto FROM Paciente;

DELIMITER //
CREATE PROCEDURE InsertarCita(
    IN p_paciente_id INT,
    IN p_medico_id INT,
    IN p_sede_id INT,
    IN p_fecha DATE,
    IN p_hora TIME
)
BEGIN
    INSERT INTO Cita(paciente_id, medico_id, sede_id, fecha, hora)
    VALUES (p_paciente_id, p_medico_id, p_sede_id, p_fecha, p_hora);
END;
//
DELIMITER ;


SELECT * FROM Cita WHERE paciente_id = 1;

SELECT m.nombre, m.apellido, e.nombre AS especialidad
FROM Medico m
JOIN Medico_Especialidad me ON m.medico_id = me.medico_id
JOIN Especialidad e ON me.especialidad_id = e.especialidad_id;


UPDATE Paciente SET direccion = 'Nueva Dirección 123' WHERE paciente_id = 1;
UPDATE Medico SET telefono = '3123456789' WHERE medico_id = 2;
UPDATE Factura SET total = total * 1.05 WHERE factura_id = 1;

DELETE FROM Paciente WHERE paciente_id = 5;
ALTER TABLE Paciente ADD correo VARCHAR(100);
TRUNCATE TABLE Factura;
DROP TABLE Paciente_Tratamiento;
SELECT nombre, apellido FROM Paciente
WHERE paciente_id IN (
    SELECT paciente_id FROM Cita
    GROUP BY paciente_id
    HAVING COUNT(*) > 1
);