USE campuslands_gym;

-- =================================================== CASE EN CONSULTA
-- Clasificar socios por rango de edad (asumimos edad basada en ID)
SELECT 
    nombres,
    apellidos,
    id,
    CASE 
        WHEN id BETWEEN 1 AND 3 THEN 'Joven (18-25)'
        WHEN id BETWEEN 4 AND 6 THEN 'Adulto (26-40)'
        WHEN id BETWEEN 7 AND 9 THEN 'Adulto mayor (41+)'
        ELSE 'Edad no determinada'
    END AS rango_edad
FROM socios;

-- =================================================== CASE EN PROCEDIMIENTO
-- Procedimiento para asignar plan según tipo de socio
DELIMITER //
CREATE PROCEDURE asignar_plan_segun_socio(IN socio_id INT)
BEGIN
    DECLARE tipo VARCHAR(20);
    
    -- Determinar tipo de socio (ejemplo: basado en cantidad de planes)
    SELECT 
        CASE 
            WHEN COUNT(spe.id) = 0 THEN 'Nuevo'
            WHEN COUNT(spe.id) = 1 THEN 'Regular'
            ELSE 'VIP'
        END INTO tipo
    FROM socios s
    LEFT JOIN socio_plan_entrenadores spe ON s.id = spe.socio_id
    WHERE s.id = socio_id;
    
    -- Mostrar resultado
    SELECT CONCAT('El socio ', socio_id, ' es de tipo: ', tipo) AS mensaje;
END //
DELIMITER ;

-- Ejecutar procedimiento
CALL asignar_plan_segun_socio(1);
CALL asignar_plan_segun_socio(3);