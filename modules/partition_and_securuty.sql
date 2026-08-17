USE campuslands_gym;

-- =================================================== PARTICIONAMIENTO DE TABLAS
-- Crear una tabla particionada para auditoría (por rango de fechas)
CREATE TABLE IF NOT EXISTS auditoria_entrenadores_particionada (
    id INT NOT NULL,
    entrenador_id INT NOT NULL,
    fecha_asignacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    mensaje VARCHAR(255)
)
PARTITION BY RANGE (YEAR(fecha_asignacion)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p_futuro VALUES LESS THAN MAXVALUE
);

-- Insertar datos de ejemplo
INSERT INTO auditoria_entrenadores_particionada (id, entrenador_id, fecha_asignacion, mensaje)
VALUES 
(1, 1, '2024-01-15', 'Asignación exitosa'),
(2, 2, '2024-06-20', 'Asignación exitosa'),
(3, 3, '2025-01-10', 'Asignación exitosa');

-- Consultar para ver el particionamiento
SELECT * FROM auditoria_entrenadores_particionada;

-- Ver en qué partición están los datos
SELECT 
    PARTITION_NAME,
    TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'auditoria_entrenadores_particionada'
AND TABLE_SCHEMA = 'campuslands_gym';