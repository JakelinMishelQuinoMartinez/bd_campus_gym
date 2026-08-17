USE campuslands_gym;

-- =================================================== FUNCIÓN SIMPLE
-- Calcular comisión del entrenador (10% del costo del plan)
-- Asumimos que los planes tienen un costo asociado
ALTER TABLE planes_entrenamientos ADD COLUMN costo DECIMAL(10,2) DEFAULT 100.00;

UPDATE planes_entrenamientos SET costo = 100.00 WHERE id = 1;
UPDATE planes_entrenamientos SET costo = 150.00 WHERE id = 2;
UPDATE planes_entrenamientos SET costo = 200.00 WHERE id = 3;
UPDATE planes_entrenamientos SET costo = 250.00 WHERE id = 4;
UPDATE planes_entrenamientos SET costo = 300.00 WHERE id = 5;

DELIMITER //
CREATE FUNCTION calcular_comision_entrenador(
    p_socio_id INT,
    p_comision_porcentaje DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE costo_plan DECIMAL(10,2);
    DECLARE comision DECIMAL(10,2);
    
    -- Obtener el costo del plan del socio
    SELECT p.costo INTO costo_plan
    FROM socio_plan_entrenadores spe
    JOIN planes_entrenamientos p ON spe.plan_entrenamiento_id = p.id
    WHERE spe.socio_id = p_socio_id
    LIMIT 1;
    
    -- Calcular comisión
    SET comision = costo_plan * (p_comision_porcentaje / 100);
    
    RETURN comision;
END //
DELIMITER ;

-- Probar función simple
SELECT calcular_comision_entrenador(1, 10) AS comision_entrenador;

-- =================================================== FUNCIÓN CON CONDICIONES
DELIMITER //
CREATE FUNCTION clasificar_socio(p_socio_id INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE cantidad_planes INT;
    DECLARE clasificacion VARCHAR(20);
    
    -- Contar planes del socio
    SELECT COUNT(*) INTO cantidad_planes
    FROM socio_plan_entrenadores
    WHERE socio_id = p_socio_id;
    
    -- Clasificar según cantidad de planes
    IF cantidad_planes = 0 THEN
        SET clasificacion = 'Inactivo';
    ELSEIF cantidad_planes = 1 THEN
        SET clasificacion = 'Principiante';
    ELSEIF cantidad_planes = 2 THEN
        SET clasificacion = 'Regular';
    ELSE
        SET clasificacion = 'VIP';
    END IF;
    
    RETURN clasificacion;
END //
DELIMITER ;

-- Probar función con condiciones
SELECT 
    nombres, 
    apellidos,
    clasificar_socio(id) AS clasificacion
FROM socios;


-- =================================================== FUNCIÓN CON BUCLES
DELIMITER //
CREATE FUNCTION contar_socios_entrenador(p_entrenador_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE contador INT DEFAULT 0;
    DECLARE done INT DEFAULT 0;
    DECLARE socio_id INT;
    DECLARE total_socios INT DEFAULT 0;
    
    DECLARE cur_socios CURSOR FOR 
        SELECT DISTINCT socio_id 
        FROM socio_plan_entrenadores 
        WHERE entrenador_id = p_entrenador_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur_socios;
    
    contar_loop: LOOP
        FETCH cur_socios INTO socio_id;
        IF done THEN
            LEAVE contar_loop;
        END IF;
        SET total_socios = total_socios + 1;
    END LOOP contar_loop;
    
    CLOSE cur_socios;
    RETURN total_socios;
END //
DELIMITER ;

-- Probar función con bucles
SELECT 
    nombre AS entrenador,
    contar_socios_entrenador(id) AS total_socios
FROM entrenadores;