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