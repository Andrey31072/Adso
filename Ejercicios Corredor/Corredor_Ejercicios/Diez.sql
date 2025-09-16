CREATE DATABASE Escuela;
USE Escuela;

DELIMITER //

CREATE PROCEDURE CrearTablaEstudiantes()
BEGIN
    CREATE TABLE IF NOT EXISTS Estudiantes (
        id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        edad INT CHECK (edad > 4),
        correo VARCHAR(100) UNIQUE,
        telefono VARCHAR(20)
    );
END;
//

CREATE PROCEDURE CrearTablaProfesores()
BEGIN
    CREATE TABLE IF NOT EXISTS Profesores (
        id_profesor INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        especialidad VARCHAR(100) NOT NULL,
        correo VARCHAR(100) UNIQUE
    );
END;
//

CREATE PROCEDURE CrearTablaGrados()
BEGIN
    CREATE TABLE IF NOT EXISTS Grados (
        id_grado INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        nivel VARCHAR(50) NOT NULL
    );
END;
//

CREATE PROCEDURE CrearTablaMaterias()
BEGIN
    CREATE TABLE IF NOT EXISTS Materias (
        id_materia INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        intensidad_horaria INT CHECK (intensidad_horaria > 0),
        id_profesor INT,
        FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor)
    );
END;
//

CREATE PROCEDURE CrearTablaCursos()
BEGIN
    CREATE TABLE IF NOT EXISTS Cursos (
        id_curso INT AUTO_INCREMENT PRIMARY KEY,
        id_grado INT,
        id_materia INT,
        FOREIGN KEY (id_grado) REFERENCES Grados(id_grado),
        FOREIGN KEY (id_materia) REFERENCES Materias(id_materia)
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
        nota DECIMAL(3,1) CHECK (nota >= 0 AND nota <= 5),
        observacion VARCHAR(200),
        FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula)
    );
END;
//
DELIMITER ;

CALL CrearTablaEstudiantes();
CALL CrearTablaProfesores();
CALL CrearTablaGrados();
CALL CrearTablaMaterias();
CALL CrearTablaCursos();
CALL CrearTablaMatriculas();
CALL CrearTablaCalificaciones();

INSERT INTO Estudiantes VALUES
('Juan Pérez',12,'juan@escuela.com','3001111111'),
('María López',13,'maria@escuela.com','3002222222'),
('Carlos Gómez',14,'carlos@escuela.com','3003333333'),
('Ana Torres',12,'ana@escuela.com','3004444444'),
('Luis Rodríguez',15,'luis@escuela.com','3005555555'),
('Laura Castro',13,'laura@escuela.com','3006666666'),
('Pedro Ramírez',12,'pedro@escuela.com','3007777777'),
('Paula Díaz',14,'paula@escuela.com','3008888888'),
('Andrés Ruiz',13,'andres@escuela.com','3009999999'),
('Marta Sánchez',12,'marta@escuela.com','3010000000');

INSERT INTO Profesores VALUES
('Ricardo González','Matemáticas','ricardo@escuela.com'),
('Sofía Herrera','Ciencias Naturales','sofia@escuela.com'),
('José Morales','Historia','jose@escuela.com'),
('Carmen Díaz','Español','carmen@escuela.com'),
('Felipe Rojas','Inglés','felipe@escuela.com'),
('Daniel Castro','Educación Física','daniel@escuela.com'),
('Juliana Nieto','Arte','juliana@escuela.com'),
('David Pérez','Tecnología','david@escuela.com'),
('Natalia Ruiz','Ética','natalia@escuela.com'),
('Santiago Ortiz','Música','santiago@escuela.com');

INSERT INTO Grados VALUES
('1A','Primaria'),
('2A','Primaria'),
('3A','Primaria'),
('4A','Primaria'),
('5A','Primaria'),
('6A','Secundaria'),
('7A','Secundaria'),
('8A','Secundaria'),
('9A','Secundaria'),
('10A','Secundaria');

INSERT INTO Materias VALUES
('Matemáticas',5,1),
('Ciencias Naturales',4,2),
('Historia',3,3),
('Español',4,4),
('Inglés',3,5),
('Educación Física',2,6),
('Arte',2,7),
('Tecnología',3,8),
('Ética',2,9),
('Música',2,10);


INSERT INTO Cursos VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);


INSERT INTO Matriculas VALUES
(1,1,'2025-01-10'),
(2,2,'2025-01-11'),
(3,3,'2025-01-12'),
(4,4,'2025-01-13'),
(5,5,'2025-01-14'),
(6,6,'2025-01-15'),
(7,7,'2025-01-16'),
(8,8,'2025-01-17'),
(9,9,'2025-01-18'),
(10,10,'2025-01-19');


INSERT INTO Calificaciones VALUES
(1,4.5,'Excelente'),
(2,3.8,'Muy bien'),
(3,2.9,'Debe mejorar'),
(4,4.0,'Bien'),
(5,3.2,'Aceptable'),
(6,4.7,'Sobresaliente'),
(7,2.5,'Deficiente'),
(8,3.9,'Correcto'),
(9,4.1,'Muy bien'),
(10,5.0,'Perfecto');

CREATE VIEW Reporte_EstudiantesPorGrado AS
SELECT g.nombre AS grado, COUNT(m.id_matricula) AS total_estudiantes
FROM Grados g
JOIN Cursos c ON g.id_grado = c.id_grado
JOIN Matriculas m ON c.id_curso = m.id_curso
GROUP BY g.nombre;

CREATE VIEW Reporte_PromedioNotasMateria AS
SELECT mat.nombre AS materia, AVG(cal.nota) AS promedio
FROM Materias mat
JOIN Cursos c ON mat.id_materia = c.id_materia
JOIN Matriculas m ON c.id_curso = m.id_curso
JOIN Calificaciones cal ON m.id_matricula = cal.id_matricula
GROUP BY mat.nombre;

CREATE VIEW Reporte_MateriasPorProfesor AS
SELECT p.nombre AS profesor, COUNT(mat.id_materia) AS total_materias
FROM Profesores p
JOIN Materias mat ON p.id_profesor = mat.id_profesor
GROUP BY p.nombre;

CREATE VIEW Reporte_EstudiantesDestacados AS
SELECT e.nombre, cal.nota
FROM Estudiantes e
JOIN Matriculas m ON e.id_estudiante = m.id_estudiante
JOIN Calificaciones cal ON m.id_matricula = cal.id_matricula
WHERE cal.nota >= 4.5;

CREATE VIEW Reporte_CursosPorGrado AS
SELECT g.nombre AS grado, COUNT(c.id_curso) AS total_cursos
FROM Grados g
JOIN Cursos c ON g.id_grado = c.id_grado
GROUP BY g.nombre;