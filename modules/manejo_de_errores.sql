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

-- =================================================== MANEJO DE ERRORES (transacción)
-- Procedimiento con transacción
DELIMITER //
CREATE PROCEDURE asignar_socio_plan_seguro(
    IN p_socio_id INT,
    IN p_plan_id INT,
    IN p_entrenador_id INT,
    IN p_sede_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en la transacción. Operación cancelada.' AS mensaje_error;
    END;
    
    START TRANSACTION;
    
    -- Verificar que el socio existe
    IF NOT EXISTS (SELECT 1 FROM socios WHERE id = p_socio_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El socio no existe';
    END IF;
    
    -- Verificar que el plan existe
    IF NOT EXISTS (SELECT 1 FROM planes_entrenamientos WHERE id = p_plan_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El plan no existe';
    END IF;
    
    -- Verificar que el entrenador existe
    IF NOT EXISTS (SELECT 1 FROM entrenadores WHERE id = p_entrenador_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El entrenador no existe';
    END IF;
    
    -- Verificar que la sede existe
    IF NOT EXISTS (SELECT 1 FROM sedes WHERE id = p_sede_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La sede no existe';
    END IF;
    
    -- Insertar la asignación
    INSERT INTO socio_plan_entrenadores (socio_id, plan_entrenamiento_id, entrenador_id, sede_id)
    VALUES (p_socio_id, p_plan_id, p_entrenador_id, p_sede_id);
    
    COMMIT;
    SELECT 'Asignación realizada con éxito' AS mensaje_exito;
    
END //
DELIMITER ;

-- Probar el procedimiento
CALL asignar_socio_plan_seguro(1, 1, 1, 1); -- Exitoso
CALL asignar_socio_plan_seguro(99, 1, 1, 1); -- Error (socio no existe)
