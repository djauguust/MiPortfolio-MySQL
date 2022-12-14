-- MySQL Script generated by MySQL Workbench
-- Thu Sep 29 12:19:32 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Persona` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Provincia` VARCHAR(45) NOT NULL,
  `País` VARCHAR(45) NOT NULL,
  `Banner` VARCHAR(45) NOT NULL,
  `FotoPerfil` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Contrasenia` VARCHAR(45) NOT NULL,
  `Título` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(140) NOT NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Proyecto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Proyecto` (
  `idProyecto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha` DATE NULL,
  `Enlace` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(450) NOT NULL,
  PRIMARY KEY (`idProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Realizo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Realizo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Realizo` (
  `Persona_idPersona` INT NOT NULL,
  `Proyecto_idProyecto` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Proyecto_idProyecto`),
  CONSTRAINT `fk_Persona_has_Proyecto_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Proyecto_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyecto`)
    REFERENCES `mydb`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Persona_has_Proyecto_Proyecto1_idx` ON `mydb`.`Realizo` (`Proyecto_idProyecto` ASC) VISIBLE;

CREATE INDEX `fk_Persona_has_Proyecto_Persona_idx` ON `mydb`.`Realizo` (`Persona_idPersona` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Habilidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Habilidad` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Habilidad` (
  `idHabilidad` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHabilidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tiene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tiene` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tiene` (
  `Persona_idPersona` INT NOT NULL,
  `Habilidad_idHabilidad` INT NOT NULL,
  `Porcentaje` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Habilidad_idHabilidad`),
  CONSTRAINT `fk_Persona_has_Habilidad_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Habilidad_Habilidad1`
    FOREIGN KEY (`Habilidad_idHabilidad`)
    REFERENCES `mydb`.`Habilidad` (`idHabilidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Persona_has_Habilidad_Habilidad1_idx` ON `mydb`.`Tiene` (`Habilidad_idHabilidad` ASC) VISIBLE;

CREATE INDEX `fk_Persona_has_Habilidad_Persona1_idx` ON `mydb`.`Tiene` (`Persona_idPersona` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Institución`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Institución` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Institución` (
  `idInstitución` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Logo` VARCHAR(100) NULL,
  PRIMARY KEY (`idInstitución`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Educo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Educo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Educo` (
  `Persona_idPersona` INT NOT NULL,
  `Institución_idInstitución` INT NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `Desde` DATE NOT NULL,
  `Hasta` DATE NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Institución_idInstitución`),
  CONSTRAINT `fk_Persona_has_Institución_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Institución_Institución1`
    FOREIGN KEY (`Institución_idInstitución`)
    REFERENCES `mydb`.`Institución` (`idInstitución`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Persona_has_Institución_Institución1_idx` ON `mydb`.`Educo` (`Institución_idInstitución` ASC) VISIBLE;

CREATE INDEX `fk_Persona_has_Institución_Persona1_idx` ON `mydb`.`Educo` (`Persona_idPersona` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Organización`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Organización` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Organización` (
  `idOrganización` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Logo` VARCHAR(100) NULL,
  PRIMARY KEY (`idOrganización`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Trabajo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Trabajo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Trabajo` (
  `Persona_idPersona` INT NOT NULL,
  `Organización_idOrganización` INT NOT NULL,
  `Puesto` VARCHAR(45) NOT NULL,
  `Desde` DATE NOT NULL,
  `Hasta` DATE NOT NULL,
  `Descripción` VARCHAR(140) NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Organización_idOrganización`),
  CONSTRAINT `fk_Persona_has_Organización_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Organización_Organización1`
    FOREIGN KEY (`Organización_idOrganización`)
    REFERENCES `mydb`.`Organización` (`idOrganización`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Persona_has_Organización_Organización1_idx` ON `mydb`.`Trabajo` (`Organización_idOrganización` ASC) VISIBLE;

CREATE INDEX `fk_Persona_has_Organización_Persona1_idx` ON `mydb`.`Trabajo` (`Persona_idPersona` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Inserción de Personas
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('1', 'Augusto', 'Brito', 'Tucumán', 'Argentina', 'Ubicación1', 'UbicaciónA', 'email', 'contraseña', 'Ingeniero en Computación', 'Descripción1');
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('2', 'Nicolas', 'Deleo', 'Tucumán', 'Argentina', 'Ubicación2', 'UbicaciónB', 'email2', 'contraseña2', 'Ingeniero en Computación', 'Descripción2');
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('3', 'Alejandro', 'Gonzalez', 'Tucumán', 'Argentina', 'Ubicación3', 'UbicaciónC', 'email3', 'contraseña3', 'Ingeniero Electrónico', 'Descripción3');
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('4', 'Alejandro', 'Mirabal', 'Tucumán', 'Argentina', 'Ubicación4', 'UbicaciónD', 'email4', 'contraseña4', 'Ingeniero Eléctrico', 'Descripción4');
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('5', 'Germán', 'Gritti', 'Tucumán', 'Argentina', 'Ubicación5', 'UbicaciónE', 'email5', 'contraseña5', 'Ingeniero Civil', 'Descripción5');
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('6', 'Javier', 'Rivas', 'Capital Federal', 'Argentina', 'Ubicación6', 'UbicaciónF', 'email6', 'contraseña6', 'Ingeniero Industrial', 'Descripción6');
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('7', 'Lucas', 'Rueda', 'Tucumán', 'Argentina', 'Ubicación7', 'UbicaciónG', 'email7', 'contraseña7', 'Full Stack Senior', 'Descripción7');
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('8', 'Solana', 'Mikulas', 'Miami', 'Estados Unidos', 'Ubicación8', 'UbicaciónH', 'email8', 'contraseña8', 'Licenciada en Comunicación', 'Descripción8');
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('9', 'María José', 'Manca', 'Tucumán', 'Argentina', 'Ubicación9', 'UbicaciónI', 'email9', 'contraseña9', 'Licenciada en Nutrición', 'Descripción9');
INSERT INTO `Persona` (`idPersona`, `Nombre`, `Apellido`, `Provincia`, `País`, `Banner`, `FotoPerfil`, `Email`, `Contrasenia`, `Título`, `Descripción`)
VALUES ('10', 'Constanza', 'González', 'Tucumán', 'Argentina', 'Ubicación10', 'UbicaciónJ', 'email10', 'contraseña10', 'Enfermera', 'Descripción10');

 SELECT * FROM Persona;

-- Inserción de Institucións y Organizaciónes

INSERT INTO `Institución` (`idInstitución`, `Nombre`, `Logo`)
VALUES ('1', 'Universidad Nacional de Tucuman', 'url1');
INSERT INTO `Institución` (`idInstitución`, `Nombre`, `Logo`)
VALUES ('2', 'Facultad Regional Tecnológica', 'url2');
INSERT INTO `Institución` (`idInstitución`, `Nombre`, `Logo`)
VALUES ('3', 'Argentina Programa', 'url3');
INSERT INTO `Institución` (`idInstitución`, `Nombre`, `Logo`)
VALUES ('4', 'Universidad Santos Tomas de Aquino', 'url4');
INSERT INTO `Institución` (`idInstitución`, `Nombre`, `Logo`)
VALUES ('5', 'Universidad San Pablo-T', 'url5');
INSERT INTO `Organización` (`idOrganización`, `Nombre`, `Logo`)
VALUES ('1', 'Red Carlos V', 'url1');
INSERT INTO `Organización` (`idOrganización`, `Nombre`, `Logo`)
VALUES ('2', 'Subsidio de Salud', 'url2');
INSERT INTO `Organización` (`idOrganización`, `Nombre`, `Logo`)
VALUES ('3', 'GiganetSC', 'url3');
INSERT INTO `Organización` (`idOrganización`, `Nombre`, `Logo`)
VALUES ('4', 'Telconet', 'url4');
INSERT INTO `Organización` (`idOrganización`, `Nombre`, `Logo`)
VALUES ('5', 'Entropy', 'url5');

SELECT * FROM Organización;
SELECT * FROM Institución;

-- Inserción de Proyectos y Habilidades
INSERT INTO `Proyecto` (`idProyecto`, `Nombre`, `Fecha`, `Enlace`, `Descripción`)
VALUES ('1', 'Mi Portfolio', '2022-01-01', 'url1', 'descripción1');
INSERT INTO `Proyecto` (`idProyecto`, `Nombre`, `Fecha`, `Enlace`, `Descripción`)
VALUES ('2', 'Buscador de Gifs', '2022-01-02', 'url2', 'descripción2');
INSERT INTO `Proyecto` (`idProyecto`, `Nombre`, `Fecha`, `Enlace`, `Descripción`)
VALUES ('3', 'Following', '2022-01-3', 'url3', 'descripción3');
INSERT INTO `Proyecto` (`idProyecto`, `Nombre`, `Fecha`, `Enlace`, `Descripción`)
VALUES ('4', 'Task - List', '2022-01-4', 'url4', 'descripción4');
INSERT INTO `Proyecto` ( `Nombre`, `Fecha`, `Enlace`, `Descripción`)
VALUES ('Weasley Clock', '2022-01-5', 'url5', 'descripción5');

INSERT INTO `Habilidad` (`idHabilidad`, `Nombre`)
VALUES ('1', 'Comunicación');
INSERT INTO `Habilidad` (`idHabilidad`, `Nombre`)
VALUES ('2', 'Trabajo Equipo');
INSERT INTO `Habilidad` (`idHabilidad`, `Nombre`)
VALUES ('3', 'Inglés');
INSERT INTO `Habilidad` (`idHabilidad`, `Nombre`)
VALUES ('4', 'Español');
INSERT INTO `Habilidad` (`idHabilidad`, `Nombre`)
VALUES ('5', 'Liderazgo');

SELECT * FROM Proyecto;
SELECT * FROM Habilidad;

-- Inserción de 2 líneas por unión
INSERT INTO `Trabajo` (`Persona_idPersona`, `Organización_idOrganización`, `Puesto`, `Desde`, `Hasta`, `Descripción`)
VALUES ('1', '1', 'Responsable IT', '2021-12-20', '2022-08-09', 'Descripción1');
INSERT INTO `Trabajo` (`Persona_idPersona`, `Organización_idOrganización`, `Puesto`, `Desde`, `Hasta`, `Descripción`)
VALUES ('1', '2', 'Mesa de Ayuda', '2021-05-17', '2022-12-17', 'Descripción2');

SELECT Persona.Nombre, Persona.Apellido, Organización.Nombre, Trabajo.Puesto, Trabajo.Desde, Trabajo.Hasta, Trabajo.Descripción 
FROM ( Persona INNER JOIN Trabajo ON idPersona = Persona_idPersona ) INNER JOIN Organización ON idOrganización = Organización_idOrganización; 

INSERT INTO `Realizo` (`Persona_idPersona`, `Proyecto_idProyecto`)
VALUES ('1', '1');
INSERT INTO `Realizo` (`Persona_idPersona`, `Proyecto_idProyecto`)
VALUES ('1', '2');

SELECT * FROM `Realizo`;

INSERT INTO `Educo` (`Persona_idPersona`, `Institución_idInstitución`, `Titulo`, `Desde`, `Hasta`)
VALUES ('1', '1', 'Ingeniero En Computación', '2012-01-01', '2022-12-31');
INSERT INTO `Educo` (`Persona_idPersona`, `Institución_idInstitución`, `Titulo`, `Desde`, `Hasta`)
VALUES ('1', '3', 'Full Stack Jr', '2022-02-01', '2022-10-31');

SELECT Persona.Nombre, Institución.Nombre, Educo.Titulo, Educo.Desde, Educo.Hasta FROM ( Persona INNER JOIN Educo ON idPersona = Persona_idPersona ) INNER JOIN Institución ON idInstitución = Institución_idInstitución ;

INSERT INTO `Tiene` (`Persona_idPersona`, `Habilidad_idHabilidad`, `Porcentaje`)
VALUES ('1', '3', '85');
INSERT INTO `Tiene` (`Persona_idPersona`, `Habilidad_idHabilidad`, `Porcentaje`)
VALUES ('4', '2', '60');

SELECT Persona.Nombre, Persona.Apellido, Habilidad.Nombre AS 'Habilidad', Tiene.Porcentaje FROM ( Persona INNER JOIN Tiene ON idPersona = Persona_idPersona ) INNER JOIN Habilidad ON idHabilidad = Habilidad_idHabilidad;

