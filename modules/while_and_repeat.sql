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