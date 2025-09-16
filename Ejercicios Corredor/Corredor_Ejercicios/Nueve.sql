CREATE DATABASE Universidad;
USE Universidad;

DELIMITER //

CREATE PROCEDURE CrearTablaEstudiantes()
BEGIN
    CREATE TABLE IF NOT EXISTS Estudiantes (
        id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        correo VARCHAR(100) UNIQUE,
        telefono VARCHAR(20),
        fecha_nacimiento DATE
    );
END;
//

CREATE PROCEDURE CrearTablaProfesores()
BEGIN
    CREATE TABLE IF NOT EXISTS Profesores (
        id_profesor INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        correo VARCHAR(100) UNIQUE,
        especialidad VARCHAR(100)
    );
END;
//

CREATE PROCEDURE CrearTablaFacultades()
BEGIN
    CREATE TABLE IF NOT EXISTS Facultades (
        id_facultad INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        edificio VARCHAR(50)
    );
END;
//

CREATE PROCEDURE CrearTablaDepartamentos()
BEGIN
    CREATE TABLE IF NOT EXISTS Departamentos (
        id_departamento INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        id_facultad INT,
        FOREIGN KEY (id_facultad) REFERENCES Facultades(id_facultad)
    );
END;
//

CREATE PROCEDURE CrearTablaCursos()
BEGIN
    CREATE TABLE IF NOT EXISTS Cursos (
        id_curso INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        creditos INT CHECK (creditos > 0),
        id_departamento INT,
        id_profesor INT,
        FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),
        FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor)
    );
END;
//

CREATE PROCEDURE CrearTablaMatriculas()
BEGIN
    CREATE TABLE IF NOT EXISTS Matriculas (
        id_matricula INT AUTO_INCREMENT PRIMARY KEY,
        id_estudiante INT,
        id_curso INT,
        fecha DATE,
        FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
        FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
    );
END;
//

CREATE PROCEDURE CrearTablaCalificaciones()
BEGIN
    CREATE TABLE IF NOT EXISTS Calificaciones (
        id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
        id_matricula INT,
        nota DECIMAL(4,2) CHECK (nota >= 0 AND nota <= 5),
        observaciones VARCHAR(200),
        FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula)
    );
END;
//
DELIMITER ;

CALL CrearTablaEstudiantes();
CALL CrearTablaProfesores();
CALL CrearTablaFacultades();
CALL CrearTablaDepartamentos();
CALL CrearTablaCursos();
CALL CrearTablaMatriculas();
CALL CrearTablaCalificaciones();


INSERT INTO Estudiantes VALUES
('Carlos Pérez','carlos@uni.edu','3001112233','2000-01-01'),
('María López','maria@uni.edu','3002223344','1999-02-15'),
('Juan Gómez','juan@uni.edu','3003334455','2001-03-20'),
('Ana Torres','ana@uni.edu','3004445566','2002-04-10'),
('Luis Rodríguez','luis@uni.edu','3005556677','2000-05-30'),
('Paula Díaz','paula@uni.edu','3006667788','1998-06-25'),
('Andrés Ruiz','andres@uni.edu','3007778899','1999-07-07'),
('Laura Castro','laura@uni.edu','3008889900','2001-08-12'),
('Pedro Ramírez','pedro@uni.edu','3009990011','2000-09-18'),
('Marta Sánchez','marta@uni.edu','3010001122','1998-10-22');


INSERT INTO Profesores  VALUES
('Ricardo González','ricardo@uni.edu','Matemáticas'),
('Sofía Herrera','sofia@uni.edu','Física'),
('José Morales','jose@uni.edu','Química'),
('Carmen Díaz','carmen@uni.edu','Historia'),
('Felipe Rojas','felipe@uni.edu','Literatura'),
('Daniel Castro','daniel@uni.edu','Ingeniería'),
('Juliana Nieto','juliana@uni.edu','Biología'),
('David Pérez','david@uni.edu','Economía'),
('Natalia Ruiz','natalia@uni.edu','Informática'),
('Santiago Ortiz','santiago@uni.edu','Filosofía');

INSERT INTO Facultades  VALUES
('Ciencias Exactas','A1'),
('Ciencias Sociales','B1'),
('Ingeniería','C1'),
('Humanidades','D1'),
('Economía','E1'),
('Artes','F1'),
('Derecho','G1'),
('Salud','H1'),
('Educación','I1'),
('Deportes','J1');

INSERT INTO Departamentos VALUES
('Matemáticas',1),
('Física',1),
('Química',1),
('Historia',4),
('Literatura',4),
('Ingeniería de Sistemas',3),
('Biología',8),
('Economía Aplicada',5),
('Derecho Penal',7),
('Educación Física',10);

INSERT INTO Cursos VALUES
('Cálculo I',4,1,1),
('Física I',3,2,2),
('Química General',3,3,3),
('Historia Universal',2,4,4),
('Literatura Hispanoamericana',2,5,5),
('Programación I',4,6,9),
('Biología Celular',3,7,7),
('Microeconomía',3,8,8),
('Derecho Constitucional',3,9,10),
('Entrenamiento Deportivo',2,10,6);

-- Matriculas
INSERT INTO Matriculas VALUES
(1,1,'2025-01-15'),
(2,2,'2025-01-16'),
(3,3,'2025-01-17'),
(4,4,'2025-01-18'),
(5,5,'2025-01-19'),
(6,6,'2025-01-20'),
(7,7,'2025-01-21'),
(8,8,'2025-01-22'),
(9,9,'2025-01-23'),
(10,10,'2025-01-24');

-- Calificaciones
INSERT INTO Calificaciones VALUES
(1,4.5,'Excelente'),
(2,3.2,'Aceptable'),
(3,2.8,'Debe mejorar'),
(4,4.0,'Bien'),
(5,3.5,'Regular'),
(6,4.8,'Excelente'),
(7,2.5,'Insuficiente'),
(8,3.9,'Bien'),
(9,4.2,'Muy bien'),
(10,5.0,'Sobresaliente');


CREATE VIEW Reporte_MatriculasPorEstudiante AS
SELECT e.nombre AS estudiante, COUNT(m.id_matricula) AS total_matriculas
FROM Estudiantes e
JOIN Matriculas m ON e.id_estudiante = m.id_estudiante
GROUP BY e.nombre;


CREATE VIEW Reporte_CursosPorDepartamento AS
SELECT d.nombre AS departamento, COUNT(c.id_curso) AS total_cursos
FROM Departamentos d
JOIN Cursos c ON d.id_departamento = c.id_departamento
GROUP BY d.nombre;


CREATE VIEW Reporte_PromedioNotasPorCurso AS
SELECT c.nombre AS curso, AVG(cal.nota) AS promedio
FROM Cursos c
JOIN Matriculas m ON c.id_curso = m.id_curso
JOIN Calificaciones cal ON m.id_matricula = cal.id_matricula
GROUP BY c.nombre;


CREATE VIEW Reporte_CursosPorProfesor AS
SELECT p.nombre AS profesor, COUNT(c.id_curso) AS cursos_dictados
FROM Profesores p
JOIN Cursos c ON p.id_profesor = c.id_profesor
GROUP BY p.nombre;


CREATE VIEW Reporte_EstudiantesDestacados AS
SELECT e.nombre, cal.nota
FROM Estudiantes e
JOIN Matriculas m ON e.id_estudiante = m.id_estudiante
JOIN Calificaciones cal ON m.id_matricula = cal.id_matricula
WHERE cal.nota >= 4.5;