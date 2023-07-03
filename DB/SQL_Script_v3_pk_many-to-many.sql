-- MySQL Script generated by MySQL Workbench
-- Sun Jul  2 17:31:49 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FlatRent
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FlatRent
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FlatRent` DEFAULT CHARACTER SET utf8 ;
USE `FlatRent` ;

-- -----------------------------------------------------
-- Table `FlatRent`.`landlord`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`landlord` (
  `id_landlord` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(15) NOT NULL,
  `registration_date` DATE NOT NULL,
  `edit_date` DATE NOT NULL,
  PRIMARY KEY (`id_landlord`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`flat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`flat` (
  `id_flat` TINYINT NOT NULL AUTO_INCREMENT,
  `id_landlord` TINYINT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `add_date` DATE NOT NULL,
  `edit_date` DATE NOT NULL,
  `link_sites` VARCHAR(45) NOT NULL,
  `link_tenants` VARCHAR(45) NOT NULL,
  `comment` VARCHAR(300) NULL,
  PRIMARY KEY (`id_flat`),
  INDEX `landlord_idx` (`id_landlord` ASC) VISIBLE,
  CONSTRAINT `landlord`
    FOREIGN KEY (`id_landlord`)
    REFERENCES `FlatRent`.`landlord` (`id_landlord`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`source`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`source` (
  `id_source` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_source`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`flat_source`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`flat_source` (
  `id_flat_source` SMALLINT NOT NULL AUTO_INCREMENT,
  `id_flat` TINYINT NOT NULL,
  `id_source` TINYINT NOT NULL,
  PRIMARY KEY (`id_flat_source`),
  INDEX `source_idx` (`id_source` ASC) VISIBLE,
  CONSTRAINT `flat__id`
    FOREIGN KEY (`id_flat`)
    REFERENCES `FlatRent`.`flat` (`id_flat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `source__id`
    FOREIGN KEY (`id_source`)
    REFERENCES `FlatRent`.`source` (`id_source`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`discount` (
  `id_discount` TINYINT NOT NULL AUTO_INCREMENT,
  `nights_amount` TINYINT NOT NULL,
  `discount` TINYINT NOT NULL,
  PRIMARY KEY (`id_discount`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`flat_discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`flat_discount` (
  `id_flat_discount` SMALLINT NOT NULL AUTO_INCREMENT,
  `id_flat` TINYINT NOT NULL,
  `id_discount` TINYINT NOT NULL,
  PRIMARY KEY (`id_flat_discount`),
  INDEX `discount_idx` (`id_discount` ASC) VISIBLE,
  CONSTRAINT `flat_id`
    FOREIGN KEY (`id_flat`)
    REFERENCES `FlatRent`.`flat` (`id_flat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `discount_id`
    FOREIGN KEY (`id_discount`)
    REFERENCES `FlatRent`.`discount` (`id_discount`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`tenant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`tenant` (
  `phone` VARCHAR(20) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`phone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`status` (
  `id_status` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_status`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`booking` (
  `id_booking` SMALLINT NOT NULL AUTO_INCREMENT,
  `id_flat` TINYINT NOT NULL,
  `id_source` TINYINT NOT NULL,
  `id_status` TINYINT NOT NULL,
  `checkin_date` DATE NOT NULL,
  `checkout_date` DATE NOT NULL,
  `price` MEDIUMINT NOT NULL,
  `booking_date` DATETIME NOT NULL,
  `discount` TINYINT NULL,
  `comment` VARCHAR(300) NULL,
  PRIMARY KEY (`id_booking`),
  INDEX `flat_idx` (`id_flat` ASC) VISIBLE,
  INDEX `source_idx` (`id_source` ASC) VISIBLE,
  INDEX `status_idx` (`id_status` ASC) VISIBLE,
  CONSTRAINT `flat`
    FOREIGN KEY (`id_flat`)
    REFERENCES `FlatRent`.`flat` (`id_flat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `source`
    FOREIGN KEY (`id_source`)
    REFERENCES `FlatRent`.`source` (`id_source`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `status`
    FOREIGN KEY (`id_status`)
    REFERENCES `FlatRent`.`status` (`id_status`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`booking_tenant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`booking_tenant` (
  `id_booking_tenant` SMALLINT NOT NULL AUTO_INCREMENT,
  `id_booking` SMALLINT NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_booking_tenant`),
  INDEX `tenant_idx` (`phone` ASC) VISIBLE,
  CONSTRAINT `booking_id`
    FOREIGN KEY (`id_booking`)
    REFERENCES `FlatRent`.`booking` (`id_booking`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `tenant_id`
    FOREIGN KEY (`phone`)
    REFERENCES `FlatRent`.`tenant` (`phone`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlatRent`.`calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlatRent`.`calendar` (
  `date` DATE NOT NULL,
  `id_flat` TINYINT NOT NULL,
  `base_price` SMALLINT NOT NULL,
  `min_nights_amount` TINYINT NOT NULL,
  `is_available` TINYINT NOT NULL,
  PRIMARY KEY (`date`),
  INDEX `flat_idx` (`id_flat` ASC) VISIBLE,
  CONSTRAINT `flat___id`
    FOREIGN KEY (`id_flat`)
    REFERENCES `FlatRent`.`flat` (`id_flat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
