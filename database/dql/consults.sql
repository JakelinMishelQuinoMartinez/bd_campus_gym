USE campuslands_gym;

-- =================================================== 1. CONSULTA CON IN
-- Mostrar socios con planes específicos (principiante, intermedio)
SELECT s.nombres, s.apellidos, p.nombre AS plan
FROM socios s
JOIN socio_plan_entrenadores spe ON s.id = spe.socio_id
JOIN planes_entrenamientos p ON spe.plan_entrenamiento_id = p.id
WHERE p.id IN (1, 2, 3);

-- =================================================== 2. CONSULTA CON INNER JOIN (múltiples tablas)
-- Mostrar información completa de socios con sus entrenadores y sedes
SELECT 
    s.nombres AS Socio,
    s.apellidos AS Apellidos,
    p.nombre AS Plan,
    e.nombre AS Entrenador,
    sd.nombre AS Sede,
    c.nombre AS Ciudad
FROM socios s
INNER JOIN socio_plan_entrenadores spe ON s.id = spe.socio_id
INNER JOIN planes_entrenamientos p ON spe.plan_entrenamiento_id = p.id
INNER JOIN entrenadores e ON spe.entrenador_id = e.id
INNER JOIN sedes sd ON spe.sede_id = sd.id
INNER JOIN ciudades c ON sd.id_ciudad = c.id;