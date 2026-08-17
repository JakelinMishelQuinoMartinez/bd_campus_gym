USE campuslands_gym;

-- =================================================== MANEJO DE ERRORES (código específico)
-- Procedimiento con manejo de errores
DELIMITER //
CREATE PROCEDURE insertar_socio_seguro(
    IN p_nombres VARCHAR(60),
    IN p_apellidos VARCHAR(60),
    IN p_telefono VARCHAR(15)
)
BEGIN
    DECLARE EXIT HANDLER FOR 1048 -- Error de columna NOT NULL
    BEGIN
        SELECT 'Error: El teléfono no puede ser NULL' AS mensaje_error;
    END;
    
    DECLARE EXIT HANDLER FOR 1062 -- Error de clave duplicada (si hubiera unique)
    BEGIN
        SELECT 'Error: Ya existe un socio con estos datos' AS mensaje_error;
    END;
    
    DECLARE EXIT HANDLER FOR 1364 -- Error de campo sin valor por defecto
    BEGIN
        SELECT 'Error: Faltan campos obligatorios' AS mensaje_error;
    END;
    
    -- Intento de inserción
    INSERT INTO socios (nombres, apellidos, telefono) 
    VALUES (p_nombres, p_apellidos, p_telefono);
    
    SELECT 'Socio insertado correctamente' AS mensaje_exito;
END //
DELIMITER ;

-- Probar con diferentes casos
CALL insertar_socio_seguro('Prueba', 'Error', '3214567890'); -- Exitoso
CALL insertar_socio_seguro('Prueba2', 'Error2', NULL); -- Error 1048
