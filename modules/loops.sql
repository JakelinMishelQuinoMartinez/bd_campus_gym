USE campuslands_gym;

-- =================================================== LOOP
-- Procedimiento que usa LOOP para insertar planes de entrenamiento
DELIMITER //
CREATE PROCEDURE crear_planes_automaticos()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE nombre_plan VARCHAR(50);
    
    loop_principal: LOOP
        SET nombre_plan = CONCAT('Plan Automático ', i);
        
        -- Insertar si no existe
        IF NOT EXISTS (SELECT 1 FROM planes_entrenamientos WHERE nombre = nombre_plan) THEN
            INSERT INTO planes_entrenamientos (nombre) VALUES (nombre_plan);
        END IF;
        
        SET i = i + 1;
        
        -- Salir del loop cuando i sea mayor que 5
        IF i > 5 THEN
            LEAVE loop_principal;
        END IF;
    END LOOP loop_principal;
    
    SELECT 'Planes automáticos creados exitosamente' AS mensaje;
END //
DELIMITER ;

-- Ejecutar el procedimiento
CALL crear_planes_automaticos();

-- =================================================== LOOP con condición de salida
-- Procedimiento para asignar socios a planes aleatorios
DELIMITER //
CREATE PROCEDURE asignar_socios_aleatorios()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE socio_id INT;
    DECLARE plan_id INT;
    DECLARE entrenador_id INT;
    DECLARE sede_id INT;
    
    DECLARE cur_socios CURSOR FOR SELECT id FROM socios;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur_socios;
    
    socio_loop: LOOP
        FETCH cur_socios INTO socio_id;
        IF done THEN
            LEAVE socio_loop;
        END IF;
        
        -- Obtener valores aleatorios
        SET plan_id = 1 + FLOOR(RAND() * 8); -- 1-8
        SET entrenador_id = 1 + FLOOR(RAND() * 10); -- 1-10
        SET sede_id = 1 + FLOOR(RAND() * 5); -- 1-5
        
        -- Insertar asignación
        INSERT INTO socio_plan_entrenadores (socio_id, plan_entrenamiento_id, entrenador_id, sede_id)
        VALUES (socio_id, plan_id, entrenador_id, sede_id);
        
    END LOOP socio_loop;
    
    CLOSE cur_socios;
    
    SELECT 'Socios asignados aleatoriamente' AS mensaje;
END //
DELIMITER ;

-- Ejecutar el procedimiento
-- CALL asignar_socios_aleatorios();