USE campuslands_gym;

-- =================================================== EVENTO: reporte diario - cantidad de socios por entrenador
CREATE TABLE IF NOT EXISTS reportes_diarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_reporte DATE,
    entrenador_nombre VARCHAR(120),
    cantidad_socios INT
);

DELIMITER //
CREATE EVENT IF NOT EXISTS reporte_diario_socios
ON SCHEDULE EVERY 1 DAY 
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    -- Insertar nuevo reporte
    INSERT INTO reportes_diarios (fecha_reporte, entrenador_nombre, cantidad_socios)
    SELECT 
        CURDATE() AS fecha,
        e.nombre,
        COUNT(spe.socio_id) AS total_socios
    FROM entrenadores e
    LEFT JOIN socio_plan_entrenadores spe ON e.id = spe.entrenador_id
    GROUP BY e.id;
END //
DELIMITER ;


-- =================================================== TRIGGER: verificar disponibilidad de entrenador antes de asignación
DELIMITER //
CREATE TRIGGER verificar_disponibilidad_entrenador
BEFORE INSERT ON socio_plan_entrenadores
FOR EACH ROW
BEGIN
    DECLARE conteo_socios INT;
    DECLARE mensaje_error VARCHAR(255);
    
    -- Verificar si el entrenador tiene más de 3 socios asignados
    SELECT COUNT(*) INTO conteo_socios
    FROM socio_plan_entrenadores
    WHERE entrenador_id = NEW.entrenador_id;
    
    -- Si el entrenador tiene 3 o más socios, no permitir nueva asignación
    IF conteo_socios >= 3 THEN
        SET mensaje_error = CONCAT('El entrenador ', NEW.entrenador_id, ' ya tiene 3 socios asignados. No se puede asignar más.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mensaje_error;
    END IF;
    
    -- Registrar en auditoría
    INSERT INTO auditoria_entrenadores (entrenador_id, mensaje)
    VALUES (NEW.entrenador_id, CONCAT('Nueva asignación verificada. Socios actuales: ', conteo_socios));
    
END //
DELIMITER ;
