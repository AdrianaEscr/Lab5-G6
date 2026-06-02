CREATE DATABASE Universidad;
USE Universidad;

-- 1. Crear la tabla de Profesores
CREATE TABLE Profesor (
    id_profesor INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    especialidad VARCHAR(100),
    -- Integridad de Entidad
    PRIMARY KEY (id_profesor)
);

-- 2. Crear la tabla de Alumnos
CREATE TABLE Alumno (
    id_alumno INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    -- Integridad de Dominio / Usuario (los créditos no pueden ser negativos)
    creditos_disponibles INT DEFAULT 0 CHECK (creditos_disponibles >= 0),
    PRIMARY KEY (id_alumno)
);

-- 3. Crear la tabla de Cursos
-- Relación 1:N con Profesor (usando tu columna 'docente')
CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT,
    nombre_curso VARCHAR(100) NOT NULL,
    creditos INT CHECK (creditos > 0), -- Integridad de Usuario
    docente INT,                       -- Esta es la FK que apunta a Profesor
    PRIMARY KEY (id_curso),
    -- Integridad Referencial
    CONSTRAINT fk_curso_profesor
        FOREIGN KEY (docente)
        REFERENCES Profesor(id_profesor)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 4. Crear la tabla asociativa Matrícula
-- Relación M:N entre Alumno y Curso (usando 'estudiante' y 'curso')
CREATE TABLE Matricula (
    id_matricula INT AUTO_INCREMENT,
    estudiante INT NOT NULL,           -- Esta es la FK que apunta a Alumno
    curso INT NOT NULL,                -- Esta es la FK que apunta a Curso
    fecha_matricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_matricula),
    -- Integridad Referencial con Alumno (estudiante)
    CONSTRAINT fk_matricula_alumno
        FOREIGN KEY (estudiante)
        REFERENCES Alumno(id_alumno)
        ON DELETE CASCADE,
    -- Integridad Referencial con Curso (curso)
    CONSTRAINT fk_matricula_curso
        FOREIGN KEY (curso)
        REFERENCES Curso(id_curso)
        ON DELETE CASCADE
);

-- 1.Inserción de datos validos
INSERT INTO Profesor (nombre, apellido, especialidad)
VALUES ('Alan', 'Turing', 'Computación');
INSERT INTO Profesor (nombre, apellido, especialidad) 
VALUES ('Andrés', 'Silva', 'Ciberseguridad y Redes');
INSERT INTO Alumno (nombre, apellido, correo_electronico, creditos_disponibles)
VALUES ('Ada', 'Lovelace',  'ada.l@unmsm.edu.pe', 8);
INSERT INTO Alumno (nombre, apellido, correo_electronico, creditos_disponibles) 
VALUES ('Mateo', 'Quispe', 'mateo.q@unmsm.edu.pe',10);
INSERT INTO Curso (nombre_curso, creditos, docente)
VALUES ('Algoritmos 1', 5, 1);
INSERT INTO Curso (nombre_curso, creditos, docente) 
VALUES ('Seguridad en Redes y Sistemas', 4, 2);
INSERT INTO Matricula (estudiante, curso, fecha_matricula)
VALUES (2, 1, '2026-03-15 08:30:00');
INSERT INTO Matricula (estudiante, curso, fecha_matricula)
VALUES (1, 2, '2026-03-15 08:45:00');

-- 2. Forzamiento de errores
/**
-- a. Error de Integridad Referencial
-- Intentar matricular a un alumno en un curso que NO existe (id_curso = 99)
INSERT INTO Matricula (id_alumno, id_curso) 
VALUES (1, 99);
-- b. Error de Dominio (CHECK)
-- Insertar un curso con créditos negativos
INSERT INTO Curso (nombre_curso, creditos, docente) 
VALUES ('Metodos Numericos', -10, 1);
-- Insertar un alumno con creditos disponibles negativos
INSERT INTO Alumno (nombre, apellido, correo_electronico, creditos_disponibles) 
VALUES ('Estudiante', 'Deudor','deudor@unmsm.edu.pe',  -5);
-- c. Error de Unicidad (UNIQUE)
INSERT INTO Alumno (nombre, apellido, correo_electronico, creditos_disponibles) 
VALUES ('Ada', 'Lara', 'ada.l@unmsm.edu.pe', 15);
*/
-- 3.Comportamiento ante borrado
-- 3.1 Probamos la configuracion ON DELETE SET NULL 
DELETE FROM Profesor WHERE id_profesor = 1;
-- Consultamos el curso
SELECT * FROM Curso;
-- 3.2 Se prueba la configuración ON DELETE CASCADE
DELETE FROM Curso WHERE id_curso = 1;
SELECT*FROM Matricula;

-- 4.Agregamos más registros a la tabla Profesores
INSERT INTO Profesor(nombre, apellido, especialidad)
VALUES('Carlos', 'Mendoza', 'Inteligencia Artificial');
INSERT INTO Profesor(nombre, apellido, especialidad)
VALUES('Ana', 'Guzmán', 'Ciberseguridad');
INSERT INTO Profesor(nombre, apellido, especialidad)
VALUES('Luis', 'Rodríguez', 'Arquitectura de Software');
INSERT INTO Profesor(nombre, apellido, especialidad)
VALUES('Elena', 'Vargas', 'Ciencia de Datos');
INSERT INTO Profesor(nombre, apellido, especialidad)
VALUES('Roberto', 'Silva', 'Redes y Telecomunicaciones');

--

-- 5. Agregar nuevos alumnos
-- Se registran nuevos alumnos en la tabla Alumno.
INSERT INTO Alumno(nombre, apellido, correo_electronico, creditos_disponibles)
VALUES('Pablo', 'Lovera', 'plovera@unmsm.edu.pe', 12);

INSERT INTO Alumno(nombre, apellido, correo_electronico, creditos_disponibles)
VALUES('Raul', 'Espinoza', 'respinoza@unmsm.edu.pe', 15);

INSERT INTO Alumno(nombre, apellido, correo_electronico, creditos_disponibles)
VALUES('Maria', 'Trujillo', 'mtrujillo@unmsm.edu.pe', 10);

INSERT INTO Alumno(nombre, apellido, correo_electronico, creditos_disponibles)
VALUES('Karen', 'Mamani', 'kmamani@unmsm.edu.pe', 8);

-- Verificar alumnos registrados
SELECT * FROM Alumno;


-- 6. Agregar nuevos cursos
-- Se crean cursos y se asignan a profesores.
INSERT INTO Curso(nombre_curso, creditos, docente)
VALUES('Base de Datos', 4, 3);

INSERT INTO Curso(nombre_curso, creditos, docente)
VALUES('Inteligencia Artificial', 4, 3);

INSERT INTO Curso(nombre_curso, creditos, docente)
VALUES('Arquitectura de Software', 3, 5);

INSERT INTO Curso(nombre_curso, creditos, docente)
VALUES('Ciencia de Datos', 4, 6);

-- Verificar cursos registrados
SELECT * FROM Curso;


-- 7. Registrar matrículas
-- Se relacionan los alumnos con los cursos.
INSERT INTO Matricula(estudiante, curso)
VALUES(3,3);

INSERT INTO Matricula(estudiante, curso)
VALUES(4,4);

INSERT INTO Matricula(estudiante, curso)
VALUES(5,5);

INSERT INTO Matricula(estudiante, curso)
VALUES(6,6);

-- Verificar matrículas registradas
SELECT * FROM Matricula;


-- 8. INNER JOIN
-- Muestra qué alumnos están matriculados en cada curso.
SELECT
    c.nombre_curso AS Curso,
    a.nombre AS Nombre_Alumno,
    a.apellido AS Apellido_Alumno,
    m.fecha_matricula
FROM Matricula m
INNER JOIN Alumno a
    ON m.estudiante = a.id_alumno
INNER JOIN Curso c
    ON m.curso = c.id_curso
ORDER BY c.nombre_curso;

-- 9. Reporte General: Alumno, Curso y Profesor
-- Muestra qué alumno está en qué curso y quién lo dicta
SELECT
    a.nombre AS Alumno,
    c.nombre_curso AS Curso,
    CONCAT(p.nombre, ' ', p.apellido) AS Profesor
FROM Alumno a
JOIN Matricula m ON a.id_alumno = m.estudiante
JOIN Curso c ON m.curso = c.id_curso
LEFT JOIN Profesor p ON c.docente = p.id_profesor;

-- 10. Conteo de Alumnos por Curso
-- Muestra cuántos alumnos tiene cada curso
SELECT
    c.nombre_curso,
    COUNT(m.estudiante) AS total_inscritos
FROM Curso c
LEFT JOIN Matricula m ON c.id_curso = m.curso
GROUP BY c.id_curso, c.nombre_curso
HAVING total_inscritos > 0;

-- 11. Carga Académica de los Profesores
-- Muestra cuántos cursos dicta cada profesor
-- y la suma total de créditos que tiene a su cargo.
SELECT
    p.nombre,
    p.apellido,
    COUNT(c.id_curso) AS cantidad_cursos,
    SUM(c.creditos) AS total_creditos
FROM Profesor p
JOIN Curso c ON p.id_profesor = c.docente
GROUP BY p.id_profesor, p.nombre, p.apellido;

-- 12. Búsqueda de Alumnos "Fantasmas" (Subconsultas)
SELECT nombre, apellido, correo_electronico
FROM Alumno
WHERE id_alumno NOT IN (SELECT estudiante FROM Matricula);

-- 14. Alumnos inscritos en el último mes
SELECT
    a.nombre,
    a.apellido,
    c.nombre_curso,
    m.fecha_matricula
FROM Matricula m
JOIN Alumno a ON m.estudiante = a.id_alumno
JOIN Curso c ON m.curso = c.id_curso
WHERE m.fecha_matricula >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
ORDER BY m.fecha_matricula DESC;
