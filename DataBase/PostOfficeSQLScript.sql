-- MySQL Script generated by MySQL Workbench
-- Fri Mar 22 15:10:54 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PostOffice
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PostOffice
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PostOffice` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `PostOffice` ;

-- -----------------------------------------------------
-- Table `PostOffice`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `Fname` VARCHAR(25) NOT NULL,
  `MInit` VARCHAR(1) NOT NULL,
  `Lname` VARCHAR(25) NOT NULL,
  `Email` VARCHAR(60) NOT NULL,
  `MobileNumber` VARCHAR(20) NOT NULL,
  `HouseNumber` VARCHAR(10) NOT NULL,
  `Street` VARCHAR(40) NOT NULL,
  `ZipCode` VARCHAR(10) NOT NULL,
  `City` VARCHAR(20) NOT NULL,
  `State` VARCHAR(20) NOT NULL,
  `Country` VARCHAR(20) NOT NULL,
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC),
  PRIMARY KEY (`CustomerID`, `Email`),
  UNIQUE INDEX `MobileNumber_UNIQUE` (`MobileNumber` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 10001;


-- -----------------------------------------------------
-- Table `PostOffice`.`Package State`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Package State` (
  `PackageStateID` INT NOT NULL AUTO_INCREMENT,
  `State` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`PackageStateID`),
  UNIQUE INDEX `PackageStateID_UNIQUE` (`PackageStateID` ASC),
  UNIQUE INDEX `State_UNIQUE` (`State` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `PostOffice`.`Payment type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Payment type` (
  `typeID` INT NOT NULL AUTO_INCREMENT,
  `PaymentTypeName` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`typeID`),
  UNIQUE INDEX `Name_UNIQUE` (`PaymentTypeName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `PostOffice`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Location` (
  `LocationID` INT NOT NULL AUTO_INCREMENT,
  `Hours` VARCHAR(10) NOT NULL,
  `BuildingNumber` VARCHAR(10) NOT NULL,
  `Street` VARCHAR(40) NOT NULL,
  `ZipCode` VARCHAR(10) NOT NULL,
  `City` VARCHAR(20) NOT NULL,
  `State` VARCHAR(20) NOT NULL,
  `Country` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`LocationID`),
  UNIQUE INDEX `LocationID_UNIQUE` (`LocationID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 101;


-- -----------------------------------------------------
-- Table `PostOffice`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Roles` (
  `RolesID` INT NOT NULL AUTO_INCREMENT,
  `RoleName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`RolesID`),
  UNIQUE INDEX `RolesID_UNIQUE` (`RolesID` ASC),
  UNIQUE INDEX `RoleName_UNIQUE` (`RoleName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `PostOffice`.`Authentication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Authentication` (
  `AuthenticationID` INT NOT NULL AUTO_INCREMENT,
  `AuthenticationLevel` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`AuthenticationID`),
  UNIQUE INDEX `AUTHID_UNIQUE` (`AuthenticationID` ASC),
  UNIQUE INDEX `AUTHLevel_UNIQUE` (`AuthenticationLevel` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `PostOffice`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Employee` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `LocationID` INT NOT NULL,
  `RoleID` INT NOT NULL,
  `AuthID` INT NOT NULL,
  `Fname` VARCHAR(25) NOT NULL,
  `MInit` VARCHAR(1) NOT NULL,
  `Lname` VARCHAR(25) NOT NULL,
  `MobliePhone` INT NOT NULL,
  `WorkPhone` INT NULL,
  `Wage` INT NOT NULL,
  `HiredOn` DATE NOT NULL,
  `WorkEmail` VARCHAR(60) NOT NULL,
  `PersonalEmail` VARCHAR(60) NULL,
  `HouseNumber` VARCHAR(10) NOT NULL,
  `Street` VARCHAR(40) NOT NULL,
  `ZipCode` VARCHAR(10) NOT NULL,
  `City` VARCHAR(20) NOT NULL,
  `State` VARCHAR(20) NOT NULL,
  `Country` VARCHAR(20) NOT NULL,
  `CurrentlyEmployed` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `EmployeesID_UNIQUE` (`EmployeeID` ASC),
  INDEX `fk_Employee_Location1_idx` (`LocationID` ASC),
  INDEX `fk_Employee_Roles1_idx` (`RoleID` ASC),
  UNIQUE INDEX `MobliePhone_UNIQUE` (`MobliePhone` ASC),
  UNIQUE INDEX `WorkEmail_UNIQUE` (`WorkEmail` ASC),
  UNIQUE INDEX `PersonalEmail_UNIQUE` (`PersonalEmail` ASC),
  INDEX `fk_Employee_AUTH1_idx` (`AuthID` ASC),
  UNIQUE INDEX `WorkPhone_UNIQUE` (`WorkPhone` ASC),
  CONSTRAINT `fk_Employee_Location1`
    FOREIGN KEY (`LocationID`)
    REFERENCES `PostOffice`.`Location` (`LocationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Employee_Roles1`
    FOREIGN KEY (`RoleID`)
    REFERENCES `PostOffice`.`Roles` (`RolesID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Employee_AUTH1`
    FOREIGN KEY (`AuthID`)
    REFERENCES `PostOffice`.`Authentication` (`AuthenticationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 10001;


-- -----------------------------------------------------
-- Table `PostOffice`.`Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Transactions` (
  `TransactionID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `DateOfSale` DATETIME NOT NULL,
  `TotalPrice` DOUBLE UNSIGNED NOT NULL,
  `FirstFourCC` VARCHAR(4) NULL,
  `FnameCC` VARCHAR(25) NULL,
  `LnameCC` VARCHAR(25) NULL,
  `MInitCC` VARCHAR(1) NULL,
  `PaymentTypeID` INT NOT NULL,
  `EmployeeID` INT NULL,
  PRIMARY KEY (`TransactionID`),
  UNIQUE INDEX `TransactionID_UNIQUE` (`TransactionID` ASC),
  INDEX `fk_Online Transactions_Customer1_idx` (`CustomerID` ASC),
  INDEX `fk_Transactions_Payment type1_idx` (`PaymentTypeID` ASC),
  INDEX `fk_Transactions_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Online Transactions_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `PostOffice`.`Customer` (`CustomerID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Transactions_Payment type1`
    FOREIGN KEY (`PaymentTypeID`)
    REFERENCES `PostOffice`.`Payment type` (`typeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Transactions_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `PostOffice`.`Employee` (`EmployeeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 10001;


#if PaymentTypeID -> cash then only allow null CC info, else require.
DROP TRIGGER IF EXISTS InsertPaymentTypeNULLS
DROP TRIGGER IF EXISTS UpdatePaymentTypeNULLS
DELIMITER //
CREATE TRIGGER InsertPaymentTypeNULLS BEFORE INSERT ON `PostOffice`.`Transactions`
FOR EACH ROW BEGIN
  DECLARE typeName VARCHAR(15);
  SELECT PaymentTypeName INTO typeName FROM `PostOffice`.`Payment type` WHERE typeID = NEW.PaymentTypeID;
  IF typeName = 'cash' AND (NEW.FirstFourCC IS NOT NULL OR NEW.FnameCC IS NOT NULL OR NEW.LnameCC IS NOT NULL OR NEW.MInitCC IS NOT NULL) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'payment type is cash but got CC information';
  END IF;
  IF typeName != 'cash' AND (NEW.FirstFourCC IS NULL OR NEW.FnameCC IS NULL OR NEW.LnameCC IS NULL OR NEW.MInitCC IS NULL) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'payment type is not cash but some CC information is missing';
  END IF;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER UpdatePaymentTypeNULLS BEFORE UPDATE ON `PostOffice`.`Transactions`
FOR EACH ROW BEGIN
  DECLARE typeName VARCHAR(15);
  SELECT PaymentTypeName INTO typeName FROM `PostOffice`.`Payment type` WHERE typeID = NEW.PaymentTypeID;
  IF typeName = 'cash' AND (NEW.FirstFourCC IS NOT NULL OR NEW.FnameCC IS NOT NULL OR NEW.LnameCC IS NOT NULL OR NEW.MInitCC IS NOT NULL) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'payment type is cash but got CC information';
  END IF;
  IF typeName != 'cash' AND (NEW.FirstFourCC IS NULL OR NEW.FnameCC IS NULL OR NEW.LnameCC IS NULL OR NEW.MInitCC IS NULL) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'payment type is not cash yet some CC information is missing';
  END IF;
END//
DELIMITER ;

-- -----------------------------------------------------
-- Table `PostOffice`.`Package`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Package` (
  `PackageID` INT NOT NULL AUTO_INCREMENT,
  `TransactionID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `SendToHouseNumber` VARCHAR(10) NOT NULL,
  `SendToStreet` VARCHAR(40) NOT NULL,
  `SendToZipCode` VARCHAR(10) NOT NULL,
  `SendToCity` VARCHAR(20) NOT NULL,
  `SendToState` VARCHAR(20) NOT NULL,
  `SendToCountry` VARCHAR(20) NOT NULL,
  `PackageWeight` DOUBLE UNSIGNED NOT NULL,
  `PackageSize` DOUBLE UNSIGNED NOT NULL,
  `SentDate` DATE NOT NULL,
  `ETA` DATE NOT NULL,
  `PackageStateID` INT NOT NULL,
  `Subscribed` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`PackageID`),
  UNIQUE INDEX `PackageID_UNIQUE` (`PackageID` ASC),
  INDEX `fk_Package_Customer1_idx` (`CustomerID` ASC),
  INDEX `fk_Package_Package State1_idx` (`PackageStateID` ASC),
  INDEX `fk_Package_Transactions1_idx` (`TransactionID` ASC),
  CONSTRAINT `fk_Package_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `PostOffice`.`Customer` (`CustomerID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Package_Package State1`
    FOREIGN KEY (`PackageStateID`)
    REFERENCES `PostOffice`.`Package State` (`PackageStateID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Package_Transactions1`
    FOREIGN KEY (`TransactionID`)
    REFERENCES `PostOffice`.`Transactions` (`TransactionID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 10001;


-- -----------------------------------------------------
-- Table `PostOffice`.`Trucks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Trucks` (
  `TruckID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`TruckID`),
  INDEX `fk_Trucks_Employee1_idx` (`EmployeeID` ASC),
  UNIQUE INDEX `TruckID_UNIQUE` (`TruckID` ASC),
  CONSTRAINT `fk_Trucks_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `PostOffice`.`Employee` (`EmployeeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 101;


-- -----------------------------------------------------
-- Table `PostOffice`.`Tracking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Tracking` (
  `PackageID` INT NOT NULL,
  `TruckID` INT NOT NULL,
  `HandlerID` INT NOT NULL,
  `CurrentLocationID` INT NOT NULL,
  `GoingToHouseNumber` VARCHAR(10) NULL,
  `GoingToStreet` VARCHAR(40) NULL,
  `GoingToZipCode` VARCHAR(10) NULL,
  `GoingToCity` VARCHAR(20) NULL,
  `GoingToState` VARCHAR(20) NULL,
  `GoingToCountry` VARCHAR(20) NULL,
  `GoingToLocationID` INT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`PackageID`),
  INDEX `fk_Tracking_Trucks1_idx` (`TruckID` ASC),
  INDEX `fk_Tracking_Employee1_idx` (`HandlerID` ASC),
  INDEX `fk_Tracking_Location1_idx` (`CurrentLocationID` ASC),
  INDEX `fk_Tracking_Location2_idx` (`GoingToLocationID` ASC),
  CONSTRAINT `fk_Tracking_Package1`
    FOREIGN KEY (`PackageID`)
    REFERENCES `PostOffice`.`Package` (`PackageID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Trucks1`
    FOREIGN KEY (`TruckID`)
    REFERENCES `PostOffice`.`Trucks` (`TruckID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Employee1`
    FOREIGN KEY (`HandlerID`)
    REFERENCES `PostOffice`.`Employee` (`EmployeeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Location1`
    FOREIGN KEY (`CurrentLocationID`)
    REFERENCES `PostOffice`.`Location` (`LocationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Location2`
    FOREIGN KEY (`GoingToLocationID`)
    REFERENCES `PostOffice`.`Location` (`LocationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 10001;

-- -----------------------------------------------------
-- Table `PostOffice`.`Online Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Online Products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(20) NOT NULL,
  `Stock` INT UNSIGNED NOT NULL,
  `Price` DOUBLE UNSIGNED NOT NULL,
  `ReStockDate` DATE NOT NULL,
  `Available` TINYINT(1) NOT NULL DEFAULT 1,
  `ImagePath` VARCHAR(100) NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE INDEX `ProductID_UNIQUE` (`ProductID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `PostOffice`.`Order Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Order Details` (
  `ProductID` INT NOT NULL,
  `TransactionID` INT NOT NULL,
  `Quantity` INT UNSIGNED NOT NULL,
  `UnitPrice` DOUBLE UNSIGNED NOT NULL,
  PRIMARY KEY (`ProductID`, `TransactionID`),
  INDEX `fk_Online Products_has_Online Transactions_Online Transacti_idx` (`TransactionID` ASC),
  INDEX `fk_Online Products_has_Online Transactions_Online Products1_idx` (`ProductID` ASC),
  CONSTRAINT `fk_Online Products_has_Online Transactions_Online Products1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `PostOffice`.`Online Products` (`ProductID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Online Products_has_Online Transactions_Online Transactions1`
    FOREIGN KEY (`TransactionID`)
    REFERENCES `PostOffice`.`Transactions` (`TransactionID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PostOffice`.`CustomerLogin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`CustomerLogin` (
  `CustomerEmail` VARCHAR(60) NOT NULL,
  `CustomerPassword` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`CustomerEmail`),
  INDEX `fk_CustomerLogin_Customer1_idx` (`CustomerEmail` ASC),
  UNIQUE INDEX `Customer_Email_UNIQUE` (`CustomerEmail` ASC),
  CONSTRAINT `fk_CustomerLogin_Customer1`
    FOREIGN KEY (`CustomerEmail`)
    REFERENCES `PostOffice`.`Customer` (`Email`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PostOffice`.`EmployeeLogin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`EmployeeLogin` (
  `EmployeeID` INT NOT NULL,
  `EmployeePassword` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `EmployeeID_UNIQUE` (`EmployeeID` ASC),
  CONSTRAINT `fk_EmployeeLogin_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `PostOffice`.`Employee` (`EmployeeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
