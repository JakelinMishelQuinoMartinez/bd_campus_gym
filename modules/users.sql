USE campuslands_gym;

-- =================================================== VERIFICAR POLÍTICA DE CONTRASEÑAS
SHOW VARIABLES LIKE 'validate_password%';

-- =================================================== USAR CONTRASEÑAS SEGURAS
-- Crear usuario normal
CREATE USER IF NOT EXISTS 'usuario_gym'@'localhost' IDENTIFIED BY 'GymUser2024!';

-- Crear usuario administrador
CREATE USER IF NOT EXISTS 'admin_gym'@'localhost' IDENTIFIED BY 'AdminGym2024#';

-- Crear usuario consultor
CREATE USER IF NOT EXISTS 'consultor_gym'@'localhost' IDENTIFIED BY 'ConsulGym2024$';

-- =================================================== ASIGNAR PERMISOS
-- Asignar permisos básicos al usuario normal
GRANT SELECT, INSERT ON campuslands_gym.socios TO 'usuario_gym'@'localhost';
GRANT SELECT ON campuslands_gym.entrenadores TO 'usuario_gym'@'localhost';
GRANT SELECT ON campuslands_gym.planes_entrenamientos TO 'usuario_gym'@'localhost';
GRANT SELECT ON campuslands_gym.sedes TO 'usuario_gym'@'localhost';

-- =================================================== VER PRIVILEGIOS DE UN USUARIO
SHOW GRANTS FOR 'usuario_gym'@'localhost';