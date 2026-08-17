-- =================================================== CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS campuslands_gym;
USE campuslands_gym;

-- =================================================== SOCIOS
CREATE TABLE IF NOT EXISTS socios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

-- =================================================== CIUDADES
CREATE TABLE IF NOT EXISTS ciudades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(120) NOT NULL
);
