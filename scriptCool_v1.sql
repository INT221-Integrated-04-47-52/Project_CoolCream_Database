-- MySQL Script generated by MySQL Workbench
-- Fri Apr 23 21:58:12 2021
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
-- Table `mydb`.`brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`brand` ;

CREATE TABLE IF NOT EXISTS `mydb`.`brand` (
  `brand_id` INT NOT NULL,
  `brand_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`brand_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`product` ;

CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `product_code` INT NOT NULL,
  `product_name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `last_sale` DATE NOT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`product_code`, `brand_id`),
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE,
  INDEX `fk_product_brand_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_brand`
    FOREIGN KEY (`brand_id`)
    REFERENCES `mydb`.`brand` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`size` ;

CREATE TABLE IF NOT EXISTS `mydb`.`size` (
  `size_code` INT NOT NULL,
  `size_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`size_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`topping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`topping` ;

CREATE TABLE IF NOT EXISTS `mydb`.`topping` (
  `topping_id` INT NOT NULL,
  `topping_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`topping_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_has_size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`product_has_size` ;

CREATE TABLE IF NOT EXISTS `mydb`.`product_has_size` (
  `size_code` INT NOT NULL,
  `product_code` INT NOT NULL,
  PRIMARY KEY (`size_code`, `product_code`),
  INDEX `fk_size_has_product_product1_idx` (`product_code` ASC) VISIBLE,
  INDEX `fk_size_has_product_size1_idx` (`size_code` ASC) VISIBLE,
  CONSTRAINT `fk_size_has_product_size1`
    FOREIGN KEY (`size_code`)
    REFERENCES `mydb`.`size` (`size_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_size_has_product_product1`
    FOREIGN KEY (`product_code`)
    REFERENCES `mydb`.`product` (`product_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_has_topping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`product_has_topping` ;

CREATE TABLE IF NOT EXISTS `mydb`.`product_has_topping` (
  `product_code` INT NOT NULL,
  `topping_id` INT NOT NULL,
  PRIMARY KEY (`product_code`, `topping_id`),
  INDEX `fk_product_has_topping_topping1_idx` (`topping_id` ASC) VISIBLE,
  INDEX `fk_product_has_topping_product1_idx` (`product_code` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_topping_product1`
    FOREIGN KEY (`product_code`)
    REFERENCES `mydb`.`product` (`product_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_topping_topping1`
    FOREIGN KEY (`topping_id`)
    REFERENCES `mydb`.`topping` (`topping_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `mydb`.`brand` (`brand_id`, `brand_name`) VALUES ('1001', 'Baskin Robbins');
INSERT INTO `mydb`.`brand` (`brand_id`, `brand_name`) VALUES ('1002', 'Ben&Jerry’s');
INSERT INTO `mydb`.`brand` (`brand_id`, `brand_name`) VALUES ('1003', 'Dairy Queen');
INSERT INTO `mydb`.`brand` (`brand_id`, `brand_name`) VALUES ('1004', 'Suzukien');
INSERT INTO `mydb`.`brand` (`brand_id`, `brand_name`) VALUES ('1005', 'Swensens');
INSERT INTO `mydb`.`brand` (`brand_id`, `brand_name`) VALUES ('1006', 'Umm Milk');

INSERT INTO `mydb`.`size` (`size_code`, `size_type`) VALUES ('2001', 's');
INSERT INTO `mydb`.`size` (`size_code`, `size_type`) VALUES ('2002', 'm');
INSERT INTO `mydb`.`size` (`size_code`, `size_type`) VALUES ('2003', 'l');
INSERT INTO `mydb`.`size` (`size_code`, `size_type`) VALUES ('2004', 'xl');

INSERT INTO `mydb`.`topping` (`topping_id`, `topping_name`) VALUES ('3001', 'Almond');
INSERT INTO `mydb`.`topping` (`topping_id`, `topping_name`) VALUES ('3002', 'Brownie');
INSERT INTO `mydb`.`topping` (`topping_id`, `topping_name`) VALUES ('3003', 'Chocolate ball');
INSERT INTO `mydb`.`topping` (`topping_id`, `topping_name`) VALUES ('3004', 'Chocolate chip');
INSERT INTO `mydb`.`topping` (`topping_id`, `topping_name`) VALUES ('3005', 'Cookie crumble');
INSERT INTO `mydb`.`topping` (`topping_id`, `topping_name`) VALUES ('3006', 'Oreo');
INSERT INTO `mydb`.`topping` (`topping_id`, `topping_name`) VALUES ('3007', 'Rainbow');
INSERT INTO `mydb`.`topping` (`topping_id`, `topping_name`) VALUES ('3008', 'Sticky rice');

