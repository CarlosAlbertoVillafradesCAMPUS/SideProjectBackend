CREATE DATABASE sideProject;
USE sideProject;
CREATE TABLE `usuario`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `usuario` TEXT NOT NULL,
    `password` TEXT NOT NULL,
    `fechaRegistro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `rol` TEXT NOT NULL,
    `genero` TEXT NOT NULL,
    `estado` BOOLEAN NOT NULL,
    `telefono` TEXT NOT NULL,
    `correo` TEXT NOT NULL,
    `ciudad` TEXT NOT NULL
);
CREATE TABLE `cv`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `foto` TEXT NOT NULL,
    `nombre` VARCHAR(70) NOT NULL,
    `palabrasClave` JSON NOT NULL,
    `acercaDeMi` TEXT NOT NULL,
    `skills` JSON NOT NULL,
    `idUsuario` INT NOT NULL,
    `idioma` TEXT NOT NULL,
    `nivelIdioma` TEXT NOT NULL,
    `estado` BOOLEAN NOT NULL,
    `accesoEditar` BOOLEAN NOT NULL,
    `github` TEXT NOT NULL,
    `linkedin` TEXT NOT NULL,
    CONSTRAINT `cv_idusuario_foreign` FOREIGN KEY(`idUsuario`) REFERENCES `usuario`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE `experiencia`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `cargo` VARCHAR(150) NOT NULL,
    `empresa` VARCHAR(80) NOT NULL,
    `descripcionLogros` VARCHAR(300) NOT NULL,
    `fecha` DATE NOT NULL,
    `idCv` INT NOT NULL,
    CONSTRAINT `experiencia_idcv_foreign` FOREIGN KEY(`idCv`) REFERENCES `cv`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `educacion`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `titulo` TEXT NOT NULL,
    `institucion` TEXT NOT NULL,
    `fecha` TEXT NOT NULL,
    `tipo` INT NOT NULL,
    `idCv` INT NOT NULL,
    CONSTRAINT `educacion_idcv_foreign` FOREIGN KEY(`idCv`) REFERENCES `cv`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE `softSkills`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `compentencia` TEXT NOT NULL,
    `idCv` INT NOT NULL,
    CONSTRAINT `softskills_idcv_foreign` FOREIGN KEY(`idCv`) REFERENCES `cv`(`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO usuario (usuario, password, rol, genero, estado, telefono, correo, ciudad)
VALUES ('usuario1', 'password1', 'admin', 'masculino', 1, '3123456789', 'usuario1@example.com', 'Floridablanca'),
       ('usuario2', 'password2', 'usuario', 'femenino', 1, '3102345678', 'usuario2@example.com', 'Bucaramanga');