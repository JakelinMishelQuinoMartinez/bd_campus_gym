USE campuslands_gym;

-- =================================================== DATOS PARA CIUDADES
INSERT INTO ciudades (nombre) VALUES 
('Bogotá'), 
('Medellín'), 
('Cali'), 
('Barranquilla'), 
('Cartagena');

-- =================================================== DATOS PARA SEDES
INSERT INTO sedes (nombre, id_ciudad) VALUES 
('Sede Norte Bogotá', 1), 
('Sede Sur Bogotá', 1), 
('Sede Centro Medellín', 2), 
('Sede Occidente Cali', 3), 
('Sede Puerto Barranquilla', 4);

-- =================================================== DATOS PARA SOCIOS
INSERT INTO socios (nombres, apellidos, telefono) VALUES 
('Carlos', 'Gómez', '3101234567'),
('Ana', 'Martínez', '3209876543'),
('Luis', 'Rodríguez', '3114567890'),
('María', 'Pérez', '3156789012'),
('Jorge', 'Díaz', '3123456789'),
('Sofía', 'López', '3198765432'),
('Diego', 'Fernández', '3187654321'),
('Laura', 'Romero', '3176543210'),
('Andrés', 'Torres', '3165432109'),
('Valentina', 'Castro', '3143210987');

-- =================================================== DATOS PARA PLANES DE ENTRENAMIENTO
INSERT INTO planes_entrenamientos (nombre) VALUES 
('Plan Principiante'), 
('Plan Intermedio'), 
('Plan Avanzado'), 
('Plan Hipertrofia'), 
('Plan Definición'), 
('Plan Powerlifting'), 
('Plan CrossFit'), 
('Plan Natación');

-- =================================================== DATOS PARA ESPECIALIDADES
INSERT INTO especialidades (nombre) VALUES 
('Musculación'), 
('Cardio'), 
('CrossFit'), 
('Natación'), 
('Yoga'), 
('Powerlifting'), 
('Rehabilitación');

-- =================================================== DATOS PARA ENTRENADORES
INSERT INTO entrenadores (nombre, especialidad_id) VALUES 
('Juan Carlos Ramírez', 1),
('María Fernanda González', 2),
('Pedro Pablo Álvarez', 3),
('Carolina Jiménez', 4),
('Roberto Sánchez', 5),
('Andrea Torres', 6),
('Felipe Castro', 7),
('Daniela Rincón', 1),
('Oscar Herrera', 2),
('Luisa Franco', 3);