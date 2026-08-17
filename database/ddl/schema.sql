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

-- =================================================== SEDES
CREATE TABLE IF NOT EXISTS sedes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(120) NOT NULL,
    id_ciudad INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id)
);

-- =================================================== PLANES_ENTRENAMIENTO
CREATE TABLE IF NOT EXISTS planes_entrenamientos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(120) NOT NULL
);

-- =================================================== ESPECIALIDADES
CREATE TABLE IF NOT EXISTS especialidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(120) NOT NULL
);