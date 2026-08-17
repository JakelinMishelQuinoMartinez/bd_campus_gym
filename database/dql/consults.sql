USE campuslands_gym;

-- =================================================== 1. CONSULTA CON IN
-- Mostrar socios con planes específicos (principiante, intermedio)
SELECT s.nombres, s.apellidos, p.nombre AS plan
FROM socios s
JOIN socio_plan_entrenadores spe ON s.id = spe.socio_id
JOIN planes_entrenamientos p ON spe.plan_entrenamiento_id = p.id
WHERE p.id IN (1, 2, 3);
