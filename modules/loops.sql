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