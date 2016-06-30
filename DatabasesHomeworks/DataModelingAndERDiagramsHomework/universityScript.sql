-- MySQL Script generated by MySQL Workbench
-- 05/31/16 13:36:51
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8mb4 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`Courses` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`Professors` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Titles` VARCHAR(45) NULL,
  `Courses_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Professors_Courses1_idx` (`Courses_Id` ASC),
  CONSTRAINT `fk_Professors_Courses1`
    FOREIGN KEY (`Courses_Id`)
    REFERENCES `university`.`Courses` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`departments` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Courses_Id` INT NOT NULL,
  `Professors_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_departments_Courses1_idx` (`Courses_Id` ASC),
  INDEX `fk_departments_Professors1_idx` (`Professors_Id` ASC),
  CONSTRAINT `fk_departments_Courses1`
    FOREIGN KEY (`Courses_Id`)
    REFERENCES `university`.`Courses` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_departments_Professors1`
    FOREIGN KEY (`Professors_Id`)
    REFERENCES `university`.`Professors` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`faculties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`faculties` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `departments_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_faculties_departments1_idx` (`departments_Id` ASC),
  CONSTRAINT `fk_faculties_departments1`
    FOREIGN KEY (`departments_Id`)
    REFERENCES `university`.`departments` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `university`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`Students` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `faculties_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `faculties_Id`),
  INDEX `fk_Students_faculties1_idx` (`faculties_Id` ASC),
  CONSTRAINT `fk_Students_faculties1`
    FOREIGN KEY (`faculties_Id`)
    REFERENCES `university`.`faculties` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Courses_has_Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`Courses_has_Students` (
  `Courses_Id` INT NOT NULL,
  `Students_Id` INT NOT NULL,
  `Students_faculties_Id` INT NOT NULL,
  PRIMARY KEY (`Courses_Id`, `Students_Id`, `Students_faculties_Id`),
  INDEX `fk_Courses_has_Students_Students1_idx` (`Students_Id` ASC, `Students_faculties_Id` ASC),
  INDEX `fk_Courses_has_Students_Courses1_idx` (`Courses_Id` ASC),
  CONSTRAINT `fk_Courses_has_Students_Courses1`
    FOREIGN KEY (`Courses_Id`)
    REFERENCES `university`.`Courses` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_has_Students_Students1`
    FOREIGN KEY (`Students_Id` , `Students_faculties_Id`)
    REFERENCES `university`.`Students` (`Id` , `faculties_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;