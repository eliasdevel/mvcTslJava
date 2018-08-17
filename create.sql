-- MySQL Script generated by MySQL Workbench
-- qui 16 ago 2018 15:18:30 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`states`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`states` ;

CREATE TABLE IF NOT EXISTS `mydb`.`states` (
  `id` VARCHAR(2) NOT NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`citys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`citys` ;

CREATE TABLE IF NOT EXISTS `mydb`.`citys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `state_id` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_citys_states1_idx` (`state_id` ASC),
  CONSTRAINT `fk_citys_states1`
    FOREIGN KEY (`state_id`)
    REFERENCES `mydb`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`addresses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`addresses` (
  `id` INT NOT NULL,
  `street` VARCHAR(200) NULL,
  `cep` VARCHAR(9) NULL,
  `hint` VARCHAR(200) NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_addresses_citys1_idx` (`city_id` ASC),
  CONSTRAINT `fk_addresses_citys1`
    FOREIGN KEY (`city_id`)
    REFERENCES `mydb`.`citys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `password` VARCHAR(20) NULL,
  `email` VARCHAR(200) NULL,
  `type` CHAR NULL,
  `cpf` VARCHAR(15) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_addresses1_idx` (`address_id` ASC),
  CONSTRAINT `fk_users_addresses1`
    FOREIGN KEY (`address_id`)
    REFERENCES `mydb`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`phones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`phones` ;

CREATE TABLE IF NOT EXISTS `mydb`.`phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `phone` VARCHAR(20) NULL,
  INDEX `fk_phones_usuario_idx` (`user_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_phones_usuario`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`categories` ;

CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`products` ;

CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL,
  `description` VARCHAR(200) NULL,
  `name` VARCHAR(100) NULL,
  `price` DECIMAL NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_products_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`images` ;

CREATE TABLE IF NOT EXISTS `mydb`.`images` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `label` VARCHAR(200) NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_images_products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_images_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`orders` ;

CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`, `products_id`),
  INDEX `fk_users_has_products_products1_idx` (`products_id` ASC),
  INDEX `fk_users_has_products_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_users_has_products_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`entry` ;

CREATE TABLE IF NOT EXISTS `mydb`.`entry` (
  `id` INT NOT NULL,
  `note_number` INT NULL,
  `description` VARCHAR(200) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_entry_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_entry_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movimentations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`movimentations` ;

CREATE TABLE IF NOT EXISTS `mydb`.`movimentations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `entry_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  `quantity` VARCHAR(45) NULL,
  `price_paid` DECIMAL NULL,
  PRIMARY KEY (`id`, `entry_id`, `products_id`),
  INDEX `fk_entry_has_products_products1_idx` (`products_id` ASC),
  INDEX `fk_entry_has_products_entry1_idx` (`entry_id` ASC),
  CONSTRAINT `fk_entry_has_products_entry1`
    FOREIGN KEY (`entry_id`)
    REFERENCES `mydb`.`entry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entry_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;