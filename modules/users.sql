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

-- =================================================== ASIGNAR PERMISOS DE ADMIN
-- Admin tiene todos los permisos sobre todas las tablas
GRANT ALL PRIVILEGES ON campuslands_gym.* TO 'admin_gym'@'localhost';

-- =================================================== PRIVILEGIOS SOBRE COLUMNAS
-- Otorgar permisos solo sobre columnas específicas
GRANT SELECT (nombres, apellidos) ON campuslands_gym.socios TO 'consultor_gym'@'localhost';
GRANT SELECT (nombre) ON campuslands_gym.entrenadores TO 'consultor_gym'@'localhost';
GRANT SELECT (nombre) ON campuslands_gym.sedes TO 'consultor_gym'@'localhost';

-- Verificar permisos
SHOW GRANTS FOR 'consultor_gym'@'localhost';