-- Crear la base de datos
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