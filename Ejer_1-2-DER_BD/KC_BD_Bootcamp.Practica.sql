
-- Crear la tabla Alumno
CREATE TABLE alumno (
    alumno_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    email VARCHAR(255) not null unique,
    phone VARCHAR(20)
);

-- Crear tabla Bootcamp
CREATE TABLE bootcamp (
    bootcamp_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    fecha_inicio DATE,
    estado VARCHAR(255),
    fecha_fin DATE
 );
-- Crear tabla Profesores
CREATE TABLE profesor (
    profesor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    email VARCHAR(255) not null unique,
    phone VARCHAR(20)
);
 
-- Crear tabla Modulos
CREATE TABLE modulos (
    modulo_id SERIAL PRIMARY KEY,
    bootcamp_id INT not null,
    profesor_id INT not null,
    fecha_inio DATE,
    fecha_fin DATE
 FOREIGN KEY (bootcamp_id) REFERENCES bootcamp (bootcamp_id),
 FOREIGN KEY (profesor_id) REFERENCES profesor (profesor_id),
);
 
-- Crear tabla Matriculas (relacion entre alumnos y bootcamps)
CREATE TABLE matricula (
    matricula_id SERIAL PRIMARY KEY,
    bootcamp_id INT not null,
    alumno_id INT not null,
    fecha_matriculacion DATE,
 FOREIGN KEY (bootcamp_id) REFERENCES bootcamp (bootcamp_id),
 FOREIGN KEY (alumno_id) REFERENCES alumno (alumno_id),
);

-- Crear tabla Calificaciones
CREATE TABLE calificaciones (
    calificacion_id SERIAL PRIMARY KEY,
    alumno_id INT not null,
    modulo_id INT not null,
    notas DECIMAL(10, 2),
 FOREIGN KEY (alumno_id) REFERENCES alumno (alumno_id),
 FOREIGN KEY (modulo_id) REFERENCES modulos (modulo_id)
);

INSERT INTO alumno (nombre, apellidos, email, phone) VALUES
('Alonso', 'López', 'alonso.lopez@email.com', '976-777879'),
('Sara', 'Gutiérrez', 'sara.gutierrez@email.com', '980-818283');

INSERT INTO bootcamp (nombre, fecha_inicio, estado, fecha_fin) VALUES
('Big Data', DATE '2025-01-08', 'Cursando',DATE '2025-09-23'),
('AI', DATE '2024-01-16', 'Finalizado',DATE '2024-09-23');

INSERT INTO profesor (nombre, apellidos, email, phone) VALUES
('Julia', 'Pérez', 'julia.perez@email.com', '975-771849'),
('Pedro', 'Rodriguez', 'pedro.rodriguez@email.com', '940-815383');

INSERT INTO modulos (bootcamp_id, profesor_id, fecha_inicio, fecha_fin) VALUES
('1','1', DATE '2025-01-08',DATE '2025-09-23'),
('2','2' DATE '2024-01-16', DATE '2024-09-23');

INSERT INTO matricula (bootcamp_id, alumno_id, fecha_matriculacion) VALUES
('1','1',DATE '2024-10-23'),
('2','2', DATE '2023-09-18');

INSERT INTO calificaciones (alumno_id, modulo_id, notas) VALUES
('1','1','9.5'),
('2','2', '5.5');