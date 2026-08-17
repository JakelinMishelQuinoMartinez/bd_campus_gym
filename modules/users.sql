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