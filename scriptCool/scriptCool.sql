-- MySQL Script generated by MySQL Workbench
-- Mon May 10 04:49:15 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coolcream
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `coolcream` ;

-- -----------------------------------------------------
-- Schema coolcream
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coolcream` DEFAULT CHARACTER SET utf8 ;
USE `coolcream` ;

-- -----------------------------------------------------
-- Table `coolcream`.`brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coolcream`.`brand` ;

CREATE TABLE IF NOT EXISTS `coolcream`.`brand` (
  `brand_id` INT NOT NULL,
  `brand_name` VARCHAR(45) NOT NULL,
  `brand_image` VARCHAR(200) NULL,
  PRIMARY KEY (`brand_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolcream`.`size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coolcream`.`size` ;

CREATE TABLE IF NOT EXISTS `coolcream`.`size` (
  `size_id` INT NOT NULL,
  `size_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`size_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolcream`.`icecream`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coolcream`.`icecream` ;

CREATE TABLE IF NOT EXISTS `coolcream`.`icecream` (
  `icecream_id` INT NOT NULL,
  `icecream_name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `lastday` DATE NOT NULL,
  `image` VARCHAR(100) NOT NULL,
  `brand_brand_id` INT NOT NULL,
  `size_size_id` INT NOT NULL,
  PRIMARY KEY (`icecream_id`, `brand_brand_id`, `size_size_id`),
  UNIQUE INDEX `product_name_UNIQUE` (`icecream_name` ASC) VISIBLE,
  INDEX `fk_icecream_brand1_idx` (`brand_brand_id` ASC) VISIBLE,
  INDEX `fk_icecream_size1_idx` (`size_size_id` ASC) VISIBLE,
  CONSTRAINT `fk_icecream_brand1`
    FOREIGN KEY (`brand_brand_id`)
    REFERENCES `coolcream`.`brand` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_icecream_size1`
    FOREIGN KEY (`size_size_id`)
    REFERENCES `coolcream`.`size` (`size_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolcream`.`topping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coolcream`.`topping` ;

CREATE TABLE IF NOT EXISTS `coolcream`.`topping` (
  `topping_id` INT NOT NULL,
  `topping_name` VARCHAR(45) NOT NULL,
  `topping_image` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`topping_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coolcream`.`icecream_has_topping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coolcream`.`icecream_has_topping` ;

CREATE TABLE IF NOT EXISTS `coolcream`.`icecream_has_topping` (
  `has_topping_id` INT NOT NULL,
  `topping_id` INT NOT NULL,
  `icecream_id` INT NOT NULL,
  INDEX `fk_icecream_has_topping_topping1_idx` (`topping_id` ASC) VISIBLE,
  INDEX `fk_icecream_has_topping_icecream_idx` (`icecream_id` ASC) VISIBLE,
  PRIMARY KEY (`has_topping_id`, `topping_id`, `icecream_id`),
  CONSTRAINT `fk_icecream_has_topping_icecream`
    FOREIGN KEY (`icecream_id`)
    REFERENCES `coolcream`.`icecream` (`icecream_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_icecream_has_topping_topping1`
    FOREIGN KEY (`topping_id`)
    REFERENCES `coolcream`.`topping` (`topping_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `coolcream`.`brand`
-- -----------------------------------------------------
START TRANSACTION;
USE `coolcream`;
INSERT INTO `coolcream`.`brand` (`brand_id`, `brand_name`, `brand_image`) VALUES (1001, 'Nestle', 'https://live.staticflickr.com/3215/2649630686_9637556654_b.jpg');
INSERT INTO `coolcream`.`brand` (`brand_id`, `brand_name`, `brand_image`) VALUES (1002, 'Swensens', 'https://img.wongnai.com/p/1920x0/2017/02/10/b54e558d7b654df48d949a00fd0ea9c4.jpg');
INSERT INTO `coolcream`.`brand` (`brand_id`, `brand_name`, `brand_image`) VALUES (1003, 'DairyQueen', 'https://www.dairyqueenthailand.com/assets/img/logo-dq.png');
INSERT INTO `coolcream`.`brand` (`brand_id`, `brand_name`, `brand_image`) VALUES (1004, 'Umm! Milk', 'https://privilege.ais.co.th/PrivImages/12032020_134705_9xt70rBrand.jpg');
INSERT INTO `coolcream`.`brand` (`brand_id`, `brand_name`, `brand_image`) VALUES (1005, 'Wall\'s', 'https://www.nicepng.com/png/detail/143-1432834_walls-logo-logotype-walls-ice-cream-logo-png.png');
INSERT INTO `coolcream`.`brand` (`brand_id`, `brand_name`, `brand_image`) VALUES (1006, 'Baskin Robbins', 'https://pbs.twimg.com/media/ESwUhPPUcAgMyFi.jpg');
INSERT INTO `coolcream`.`brand` (`brand_id`, `brand_name`, `brand_image`) VALUES (1007, 'Ben&Jerry???s', 'http://shoarmapancho.nl/images/BenJerry.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `coolcream`.`size`
-- -----------------------------------------------------
START TRANSACTION;
USE `coolcream`;
INSERT INTO `coolcream`.`size` (`size_id`, `size_type`) VALUES (2001, 'S');
INSERT INTO `coolcream`.`size` (`size_id`, `size_type`) VALUES (2002, 'M');
INSERT INTO `coolcream`.`size` (`size_id`, `size_type`) VALUES (2003, 'L');
INSERT INTO `coolcream`.`size` (`size_id`, `size_type`) VALUES (2004, 'XL');

COMMIT;


-- -----------------------------------------------------
-- Data for table `coolcream`.`icecream`
-- -----------------------------------------------------
START TRANSACTION;
USE `coolcream`;
INSERT INTO `coolcream`.`icecream` (`icecream_id`, `icecream_name`, `description`, `price`, `lastday`, `image`, `brand_brand_id`, `size_size_id`) VALUES (4001, 'Vanilla', 'Vanilla Icecream', 25, '2021-12-12', '4001-product-vanilla.jpeg', 1001, 2001);
INSERT INTO `coolcream`.`icecream` (`icecream_id`, `icecream_name`, `description`, `price`, `lastday`, `image`, `brand_brand_id`, `size_size_id`) VALUES (4002, 'Mango', 'Oak Rong Thong ice cream with rich and sweet. The authentic taste of Oak Rong Thong Mango.', 65, '2021-07-21', '4002-product-mango.jpeg', 1002, 2001);
INSERT INTO `coolcream`.`icecream` (`icecream_id`, `icecream_name`, `description`, `price`, `lastday`, `image`, `brand_brand_id`, `size_size_id`) VALUES (4003, 'Dark Chocolate Traffle', 'Chocolate ice cream, mixed with chocolate traffles', 50, '2022-01-22', '4003-product-dark-choc.jpeg', 1003, 2002);
INSERT INTO `coolcream`.`icecream` (`icecream_id`, `icecream_name`, `description`, `price`, `lastday`, `image`, `brand_brand_id`, `size_size_id`) VALUES (4004, 'Dreamsicle Dipped Cone- Kids', 'Our world-famous vanilla soft serve, dipped in a crunchy, creamy orange coating.', 15, '2021-06-15', '4004-product-dreamsicle.jpeg', 1004, 2002);
INSERT INTO `coolcream`.`icecream` (`icecream_id`, `icecream_name`, `description`, `price`, `lastday`, `image`, `brand_brand_id`, `size_size_id`) VALUES (4005, 'Butterfinger', 'Butterfinger candy pieces blended with creamy DQ vanilla soft serve to Blizzard Treat perfection', 45, '2022-08-20', '4005-product-butterfinger.jpeg', 1005, 2003);

COMMIT;


-- -----------------------------------------------------
-- Data for table `coolcream`.`topping`
-- -----------------------------------------------------
START TRANSACTION;
USE `coolcream`;
INSERT INTO `coolcream`.`topping` (`topping_id`, `topping_name`, `topping_image`) VALUES (3001, 'almond', 'https://cms.swensens1112.com/image/product/425/6066.jpg');
INSERT INTO `coolcream`.`topping` (`topping_id`, `topping_name`, `topping_image`) VALUES (3002, 'chocolate chip', 'https://cms.swensens1112.com/image/product/426/8744.jpg');
INSERT INTO `coolcream`.`topping` (`topping_id`, `topping_name`, `topping_image`) VALUES (3003, 'rainbow', 'https://cms.swensens1112.com/image/product/427/3711.jpg');
INSERT INTO `coolcream`.`topping` (`topping_id`, `topping_name`, `topping_image`) VALUES (3004, 'oreo', 'https://cms.swensens1112.com/image/product/427/3711.jpg');
INSERT INTO `coolcream`.`topping` (`topping_id`, `topping_name`, `topping_image`) VALUES (3005, 'cookie', 'https://cms.swensens1112.com/image/product/433/7449.jpg');
INSERT INTO `coolcream`.`topping` (`topping_id`, `topping_name`, `topping_image`) VALUES (3006, 'chocoball', 'https://cms.swensens1112.com/image/product/439/1513.jpg');
INSERT INTO `coolcream`.`topping` (`topping_id`, `topping_name`, `topping_image`) VALUES (3007, 'sticky rice', 'https://cms.swensens1112.com/image/product/444/7187.jpg');
INSERT INTO `coolcream`.`topping` (`topping_id`, `topping_name`, `topping_image`) VALUES (3008, 'cherry', 'https://cms.swensens1112.com/image/product/424/4386.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `coolcream`.`icecream_has_topping`
-- -----------------------------------------------------
START TRANSACTION;
USE `coolcream`;
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6001, 3001, 4001);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6002, 3002, 4001);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6003, 3001, 4002);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6004, 3003, 4002);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6005, 3005, 4002);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6006, 3008, 4002);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6007, 3003, 4003);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6008, 3004, 4003);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6009, 3007, 4003);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6010, 3001, 4004);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6011, 3006, 4004);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6012, 3003, 4005);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6013, 3004, 4005);
INSERT INTO `coolcream`.`icecream_has_topping` (`has_topping_id`, `topping_id`, `icecream_id`) VALUES (6014, 3006, 4005);

COMMIT;

