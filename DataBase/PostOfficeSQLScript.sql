-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema PostOffice
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PostOffice
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PostOffice` DEFAULT CHARACTER SET utf8 ;
USE `PostOffice` ;

-- -----------------------------------------------------
-- Table `PostOffice`.`Authentication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Authentication` (
  `AuthenticationID` INT(11) NOT NULL AUTO_INCREMENT,
  `AuthenticationLevel` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`AuthenticationID`),
  UNIQUE INDEX `AUTHID_UNIQUE` (`AuthenticationID` ASC),
  UNIQUE INDEX `AUTHLevel_UNIQUE` (`AuthenticationLevel` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Customer` (
  `CustomerID` INT(11) NOT NULL AUTO_INCREMENT,
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
  `TotalPackagesSent` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CustomerID`, `Email`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC),
  UNIQUE INDEX `MobileNumber_UNIQUE` (`MobileNumber` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 10124
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`CustomerLogin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`CustomerLogin` (
  `CustomerEmail` VARCHAR(60) NOT NULL,
  `CustomerPassword` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`CustomerEmail`),
  UNIQUE INDEX `Customer_Email_UNIQUE` (`CustomerEmail` ASC),
  INDEX `fk_CustomerLogin_Customer1_idx` (`CustomerEmail` ASC),
  CONSTRAINT `fk_CustomerLogin_Customer1`
    FOREIGN KEY (`CustomerEmail`)
    REFERENCES `PostOffice`.`Customer` (`Email`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Emails_to_send`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Emails_to_send` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mTo` VARCHAR(128) NOT NULL,
  `email_sent` BIT(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 10440
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Location` (
  `LocationID` INT(11) NOT NULL AUTO_INCREMENT,
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
AUTO_INCREMENT = 116
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Roles` (
  `RolesID` INT(11) NOT NULL AUTO_INCREMENT,
  `RoleName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`RolesID`),
  UNIQUE INDEX `RolesID_UNIQUE` (`RolesID` ASC),
  UNIQUE INDEX `RoleName_UNIQUE` (`RoleName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Employee` (
  `EmployeeID` INT(11) NOT NULL AUTO_INCREMENT,
  `LocationID` INT(11) NOT NULL,
  `RoleID` INT(11) NOT NULL,
  `AuthID` INT(11) NOT NULL,
  `Fname` VARCHAR(25) NOT NULL,
  `MInit` VARCHAR(1) NOT NULL,
  `Lname` VARCHAR(25) NOT NULL,
  `MobilePhone` VARCHAR(20) NOT NULL,
  `WorkPhone` VARCHAR(20) NULL DEFAULT NULL,
  `Wage` DOUBLE NOT NULL,
  `HiredOn` DATE NOT NULL,
  `WorkEmail` VARCHAR(60) NOT NULL,
  `PersonalEmail` VARCHAR(60) NULL DEFAULT NULL,
  `HouseNumber` VARCHAR(10) NOT NULL,
  `Street` VARCHAR(40) NOT NULL,
  `ZipCode` VARCHAR(10) NOT NULL,
  `City` VARCHAR(20) NOT NULL,
  `State` VARCHAR(20) NOT NULL,
  `Country` VARCHAR(20) NOT NULL,
  `CurrentlyEmployed` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `EmployeesID_UNIQUE` (`EmployeeID` ASC),
  UNIQUE INDEX `MobliePhone_UNIQUE` (`MobilePhone` ASC),
  UNIQUE INDEX `WorkEmail_UNIQUE` (`WorkEmail` ASC),
  UNIQUE INDEX `PersonalEmail_UNIQUE` (`PersonalEmail` ASC),
  UNIQUE INDEX `WorkPhone_UNIQUE` (`WorkPhone` ASC),
  INDEX `fk_Employee_Location1_idx` (`LocationID` ASC),
  INDEX `fk_Employee_Roles1_idx` (`RoleID` ASC),
  INDEX `fk_Employee_AUTH1_idx` (`AuthID` ASC),
  CONSTRAINT `fk_Employee_AUTH1`
    FOREIGN KEY (`AuthID`)
    REFERENCES `PostOffice`.`Authentication` (`AuthenticationID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Employee_Location1`
    FOREIGN KEY (`LocationID`)
    REFERENCES `PostOffice`.`Location` (`LocationID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Employee_Roles1`
    FOREIGN KEY (`RoleID`)
    REFERENCES `PostOffice`.`Roles` (`RolesID`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 10097
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`EmployeeLogin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`EmployeeLogin` (
  `EmployeeID` INT(11) NOT NULL,
  `EmployeePassword` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `EmployeeID_UNIQUE` (`EmployeeID` ASC),
  CONSTRAINT `fk_EmployeeLogin_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `PostOffice`.`Employee` (`EmployeeID`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Online Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Online Products` (
  `ProductID` INT(11) NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(30) NOT NULL,
  `Stock` INT(10) NOT NULL,
  `Price` DOUBLE UNSIGNED NOT NULL,
  `ReStockDate` DATE NOT NULL,
  `Available` TINYINT(1) NOT NULL DEFAULT '1',
  `ImagePath` VARCHAR(100) NULL DEFAULT NULL,
  `Description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE INDEX `ProductID_UNIQUE` (`ProductID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Payment type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Payment type` (
  `typeID` INT(11) NOT NULL AUTO_INCREMENT,
  `PaymentTypeName` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`typeID`),
  UNIQUE INDEX `Name_UNIQUE` (`PaymentTypeName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Transactions` (
  `TransactionID` INT(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` INT(11) NOT NULL,
  `DateOfSale` DATETIME NOT NULL,
  `TotalPrice` DOUBLE UNSIGNED NOT NULL,
  `FirstFourCC` VARCHAR(4) NULL DEFAULT NULL,
  `FnameCC` VARCHAR(25) NULL DEFAULT NULL,
  `LnameCC` VARCHAR(25) NULL DEFAULT NULL,
  `MInitCC` VARCHAR(1) NULL DEFAULT NULL,
  `PaymentTypeID` INT(11) NOT NULL,
  `EmployeeID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  UNIQUE INDEX `TransactionID_UNIQUE` (`TransactionID` ASC),
  INDEX `fk_Online Transactions_Customer1_idx` (`CustomerID` ASC),
  INDEX `fk_Transactions_Payment type1_idx` (`PaymentTypeID` ASC),
  INDEX `fk_Transactions_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Online Transactions_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `PostOffice`.`Customer` (`CustomerID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Transactions_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `PostOffice`.`Employee` (`EmployeeID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Transactions_Payment type1`
    FOREIGN KEY (`PaymentTypeID`)
    REFERENCES `PostOffice`.`Payment type` (`typeID`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 10532
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Order Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Order Details` (
  `ProductID` INT(11) NOT NULL,
  `TransactionID` INT(11) NOT NULL,
  `Quantity` INT(10) UNSIGNED NOT NULL,
  `UnitPrice` DOUBLE UNSIGNED NOT NULL,
  PRIMARY KEY (`ProductID`, `TransactionID`),
  INDEX `fk_Online Products_has_Online Transactions_Online Transacti_idx` (`TransactionID` ASC),
  INDEX `fk_Online Products_has_Online Transactions_Online Products1_idx` (`ProductID` ASC),
  CONSTRAINT `fk_Online Products_has_Online Transactions_Online Products1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `PostOffice`.`Online Products` (`ProductID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Online Products_has_Online Transactions_Online Transactions1`
    FOREIGN KEY (`TransactionID`)
    REFERENCES `PostOffice`.`Transactions` (`TransactionID`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Package State`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Package State` (
  `PackageStateID` INT(11) NOT NULL AUTO_INCREMENT,
  `State` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`PackageStateID`),
  UNIQUE INDEX `PackageStateID_UNIQUE` (`PackageStateID` ASC),
  UNIQUE INDEX `State_UNIQUE` (`State` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Package`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Package` (
  `PackageID` INT(11) NOT NULL AUTO_INCREMENT,
  `TransactionID` INT(11) NOT NULL,
  `CustomerID` INT(11) NOT NULL,
  `SendToHouseNumber` VARCHAR(10) NOT NULL,
  `SendToStreet` VARCHAR(40) NOT NULL,
  `SendToZipCode` VARCHAR(10) NOT NULL,
  `SendToCity` VARCHAR(20) NOT NULL,
  `SendToState` VARCHAR(20) NOT NULL,
  `SendToCountry` VARCHAR(20) NOT NULL,
  `PackageWeight` DOUBLE UNSIGNED NOT NULL,
  `PackageSize` DOUBLE UNSIGNED NOT NULL,
  `SentDate` DATETIME NOT NULL,
  `ETA` DATE NOT NULL,
  `PackageStateID` INT(11) NOT NULL,
  `Subscribed` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`PackageID`),
  UNIQUE INDEX `PackageID_UNIQUE` (`PackageID` ASC),
  INDEX `fk_Package_Customer1_idx` (`CustomerID` ASC),
  INDEX `fk_Package_Package State1_idx` (`PackageStateID` ASC),
  INDEX `fk_Package_Transactions1_idx` (`TransactionID` ASC),
  CONSTRAINT `fk_Package_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `PostOffice`.`Customer` (`CustomerID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Package_Package State1`
    FOREIGN KEY (`PackageStateID`)
    REFERENCES `PostOffice`.`Package State` (`PackageStateID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Package_Transactions1`
    FOREIGN KEY (`TransactionID`)
    REFERENCES `PostOffice`.`Transactions` (`TransactionID`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 10455
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Trucks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Trucks` (
  `TruckID` INT(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` INT(11) NOT NULL,
  PRIMARY KEY (`TruckID`),
  UNIQUE INDEX `TruckID_UNIQUE` (`TruckID` ASC),
  INDEX `fk_Trucks_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Trucks_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `PostOffice`.`Employee` (`EmployeeID`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 119
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`Tracking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`Tracking` (
  `ROW` INT(11) NOT NULL AUTO_INCREMENT,
  `PackageID` INT(11) NOT NULL,
  `TruckID` INT(11) NULL DEFAULT NULL,
  `HandlerID` INT(11) NOT NULL,
  `CurrentLocationID` INT(11) NULL DEFAULT NULL,
  `GoingToHouseNumber` VARCHAR(10) NULL DEFAULT NULL,
  `GoingToStreet` VARCHAR(40) NULL DEFAULT NULL,
  `GoingToZipCode` VARCHAR(10) NULL DEFAULT NULL,
  `GoingToCity` VARCHAR(20) NULL DEFAULT NULL,
  `GoingToState` VARCHAR(20) NULL DEFAULT NULL,
  `GoingToCountry` VARCHAR(20) NULL DEFAULT NULL,
  `GoingToLocationID` INT(11) NULL DEFAULT NULL,
  `Date` DATETIME NOT NULL,
  `Delivered` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ROW`),
  UNIQUE INDEX `ROW_UNIQUE` (`ROW` ASC),
  INDEX `fk_Tracking_Package1` (`PackageID` ASC),
  INDEX `fk_Tracking_Trucks1_idx` (`TruckID` ASC),
  INDEX `fk_Tracking_Employee1_idx` (`HandlerID` ASC),
  INDEX `fk_Tracking_Location1_idx` (`CurrentLocationID` ASC),
  INDEX `fk_Tracking_Location2_idx` (`GoingToLocationID` ASC),
  CONSTRAINT `fk_Tracking_Employee1`
    FOREIGN KEY (`HandlerID`)
    REFERENCES `PostOffice`.`Employee` (`EmployeeID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Location1`
    FOREIGN KEY (`CurrentLocationID`)
    REFERENCES `PostOffice`.`Location` (`LocationID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Location2`
    FOREIGN KEY (`GoingToLocationID`)
    REFERENCES `PostOffice`.`Location` (`LocationID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Package1`
    FOREIGN KEY (`PackageID`)
    REFERENCES `PostOffice`.`Package` (`PackageID`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Trucks1`
    FOREIGN KEY (`TruckID`)
    REFERENCES `PostOffice`.`Trucks` (`TruckID`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1462
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `PostOffice`.`tbl_system_mail_pickup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PostOffice`.`tbl_system_mail_pickup` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mFrom` VARCHAR(128) NOT NULL DEFAULT 'noreplyccms@YourDomain.co.uk',
  `mTo` VARCHAR(128) NOT NULL,
  `mCC` VARCHAR(128) NULL DEFAULT NULL,
  `mBCC` VARCHAR(128) NULL DEFAULT NULL,
  `mSubject` VARCHAR(254) NULL DEFAULT NULL,
  `mBody` LONGTEXT NULL DEFAULT NULL,
  `added_by` VARCHAR(36) NULL DEFAULT NULL,
  `updated_by` VARCHAR(36) NULL DEFAULT NULL,
  `added_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_sent` BIT(1) NULL DEFAULT b'0',
  `send_tried` INT(11) NULL DEFAULT '0',
  `send_result` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `PostOffice` ;

-- -----------------------------------------------------
-- function daterange
-- -----------------------------------------------------

DELIMITER $$
USE `PostOffice`$$
CREATE DEFINER=`masterUsername`@`%` FUNCTION `daterange`(startDate VARCHAR(10), endDate VARCHAR(10)) RETURNS varchar(255) CHARSET utf8
BEGIN
  DECLARE numrange INT;
  DECLARE result VARCHAR(255);
  DECLARE x INT;
  SET numrange = (MONTH(endDate) - MONTH(startDate));
  SET x = 1;
  WHILE x <= numrange DO
	SELECT COUNT(*) INTO result FROM Tracking WHERE (Tracking.Date < endDate AND Tracking.Date < endDate) AND Tracking.TruckID is null;
  END WHILE;
  RETURN result;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function isodd
-- -----------------------------------------------------

DELIMITER $$
USE `PostOffice`$$
CREATE DEFINER=`masterUsername`@`%` FUNCTION `isodd`(input_number int) RETURNS int(11)
BEGIN
        DECLARE v_isodd INT;
        IF MOD(input_number,2)=0 THEN
                SET v_isodd=FALSE;
        ELSE
                SET v_isodd=TRUE;
        END IF;
        RETURN(v_isodd);
END$$

DELIMITER ;
USE `PostOffice`;

DELIMITER $$
USE `PostOffice`$$
CREATE
DEFINER=`masterUsername`@`%`
TRIGGER `PostOffice`.`Customer_AFTER_INSERT`
AFTER INSERT ON `PostOffice`.`Customer`
FOR EACH ROW
BEGIN
	IF 
		(SELECT COUNT(*) 
			FROM CustomerLogin 
				WHERE NEW.Email = CustomerLogin.CustomerEmail) = 0 
    
    THEN
		INSERT INTO `PostOffice`.`CustomerLogin`
		(`CustomerEmail`,`CustomerPassword`)
		VALUES
		(NEW.Email, 'qwert');
	END IF;
END$$

USE `PostOffice`$$
CREATE
DEFINER=`masterUsername`@`%`
TRIGGER `PostOffice`.`Employee_AFTER_INSERT`
AFTER INSERT ON `PostOffice`.`Employee`
FOR EACH ROW
BEGIN
    IF 
		(SELECT COUNT(*) 
			FROM EmployeeLogin 
				WHERE NEW.EmployeeID = EmployeeLogin.EmployeeID) = 0 
    
    THEN
		INSERT INTO `PostOffice`.`EmployeeLogin`
		(`EmployeeID`,`EmployeePassword`)
		VALUES
		(NEW.EmployeeID, 'qwert');
	END IF;
END$$

USE `PostOffice`$$
CREATE
DEFINER=`masterUsername`@`%`
TRIGGER `PostOffice`.`Order Details_AFTER_INSERT`
AFTER INSERT ON `PostOffice`.`Order Details`
FOR EACH ROW
BEGIN
	UPDATE `Online Products`
	SET Stock = (Stock - NEW.Quantity)
    WHERE ProductID = NEW.ProductID;
    
    IF (SELECT Stock FROM `Online Products` WHERE ProductID = NEW.ProductID) <= 0 THEN
		UPDATE `Online Products`
		SET Available = 0
		WHERE ProductID = NEW.ProductID;
	END IF;
END$$

USE `PostOffice`$$
CREATE
DEFINER=`masterUsername`@`%`
TRIGGER `PostOffice`.`IncrementTotalPackagesSent`
BEFORE INSERT ON `PostOffice`.`Package`
FOR EACH ROW
BEGIN
#	update Customer
#   set TotalPackagesSent = TotalPackagesSent + 1
#   where Customer.CustomerID = NEW.CustomerID;
END$$

USE `PostOffice`$$
CREATE
DEFINER=`masterUsername`@`%`
TRIGGER `PostOffice`.`Package_AFTER_UPDATE`
AFTER UPDATE ON `PostOffice`.`Package`
FOR EACH ROW
BEGIN
IF 
		NEW.PackageStateID <> OLD.PackageStateID
THEN
    INSERT INTO `PostOffice`.`Emails_to_send`
		(`CustomerID`)
		SELECT CustomerID FROM PostOffice.Package WHERE OLD.CustomerID = Package.CustomerID;
	INSERT INTO `PostOffice`.`Emails_to_send`
		(`mTo`)
        SELECT Email FROM PostOffice.Customer WHERE `CustomerID` = Package.CustomerID;
	END IF;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
