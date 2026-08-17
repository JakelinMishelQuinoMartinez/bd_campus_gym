USE campuslands_gym;

-- =================================================== BUCLE WHILE
-- Crear un procedimiento que inserte socios de prueba
DELIMITER //
CREATE PROCEDURE insertar_socios_prueba(IN cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE nombre_random VARCHAR(60);
    DECLARE apellido_random VARCHAR(60);
    DECLARE telefono_random VARCHAR(15);
    
    WHILE i <= cantidad DO
        SET nombre_random = CONCAT('Socio_Prueba_', i);
        SET apellido_random = CONCAT('Apellido_', i);
        SET telefono_random = CONCAT('311', LPAD(i, 7, '0'));
        
        INSERT INTO socios (nombres, apellidos, telefono) 
        VALUES (nombre_random, apellido_random, telefono_random);
        
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Ejecutar el procedimiento
CALL insertar_socios_prueba(5);

-- =================================================== BUCLE REPEAT
-- Crear un procedimiento que actualice el nombre de los planes
DELIMITER //
CREATE PROCEDURE actualizar_planes()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE plan_id INT;
    DECLARE plan_nombre VARCHAR(120);
    DECLARE contador INT DEFAULT 1;
    
    DECLARE cur CURSOR FOR SELECT id, nombre FROM planes_entrenamientos;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    REPEAT
        FETCH cur INTO plan_id, plan_nombre;
        IF NOT done THEN
            UPDATE planes_entrenamientos 
            SET nombre = CONCAT(plan_nombre, ' - V', contador)
            WHERE id = plan_id;
            SET contador = contador + 1;
        END IF;
    UNTIL done END REPEAT;
    
    CLOSE cur;
END //
DELIMITER ;

-- Ejecutar el procedimiento
CALL actualizar_planes();

-- Restaurar nombres originales
USE campuslands_gym;

-- Usar WHERE con la clave primaria
UPDATE planes_entrenamientos 
SET nombre = REPLACE(nombre, ' - V1', '') 
WHERE id = 1;

UPDATE planes_entrenamientos 
SET nombre = REPLACE(nombre, ' - V2', '') 
WHERE id = 2;

UPDATE planes_entrenamientos 
SET nombre = REPLACE(nombre, ' - V3', '') 
WHERE id = 3;