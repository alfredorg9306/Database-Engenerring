-- MySQL Workbench Forward Engineering
CREATE SCHEMA IF NOT EXISTS `SkinCareEli`;
USE `SkinCareEli` ;
drop database `SkinCareEli`;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Persona` (
  `IdPersona` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(100) NOT NULL,
  `Age` INT NOT NULL,
  `PhoneNumber` CHAR(10) NOT NULL,
  `Address` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`IdPersona`))
  AUTO_INCREMENT = 20001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Client` (
  `IdClient` INT NOT NULL AUTO_INCREMENT,
  `IdPersona` INT NOT NULL,
  PRIMARY KEY (`IdClient`),
  CONSTRAINT `fk_Clients_Persona1`
    FOREIGN KEY (`IdPersona`)
    REFERENCES `SkinCareEli`.`Persona` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 15001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Products` (
  `IdProduct` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(120) NOT NULL,
  `Description` VARCHAR(500) NOT NULL,
  `Price` DECIMAL(6,2) NOT NULL,
  `InStock` INT NOT NULL,
  PRIMARY KEY (`IdProduct`))
  AUTO_INCREMENT = 25001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Employee` (
  `IdEmployee` INT NOT NULL AUTO_INCREMENT,
  `IdPersona` INT NOT NULL,
  PRIMARY KEY (`IdEmployee`),
  CONSTRAINT `fk_Empleado_Persona1`
    FOREIGN KEY (`IdPersona`)
    REFERENCES `SkinCareEli`.`Persona` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 31001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Bill` (
  `IdBill` INT NOT NULL AUTO_INCREMENT,
  `IdClient` INT NOT NULL,
  `IdEmployee` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Payment_Method` ENUM('Paid', 'Pacial', 'Pending') NOT NULL,
  PRIMARY KEY (`IdBill`),
  CONSTRAINT `fk_Factura_Clients`
    FOREIGN KEY (`IdClient`)
    REFERENCES `SkinCareEli`.`Client` (`IdClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bill_Employee1`
    FOREIGN KEY (`IdEmployee`)
    REFERENCES `SkinCareEli`.`Employee` (`IdEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 40001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Invoice_Detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Invoice_Detail` (
  `IdInvoice` INT NOT NULL AUTO_INCREMENT,
  `IdProduct` INT NOT NULL,
  `IdFactura` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Total` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`IdInvoice`),
  CONSTRAINT `fk_Invoice_Detail_Products1`
    FOREIGN KEY (`IdProduct`)
    REFERENCES `SkinCareEli`.`Products` (`IdProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Detail_Factura1`
    FOREIGN KEY (`IdFactura`)
    REFERENCES `SkinCareEli`.`Bill` (`IdBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 1001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Category` (
  `IdCategory` INT NOT NULL AUTO_INCREMENT,
  `Category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdCategory`))
  AUTO_INCREMENT = 5001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Presentation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Presentation` (
  `IdPresentaion` INT NOT NULL AUTO_INCREMENT,
  `Presentation` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdPresentaion`))
  AUTO_INCREMENT = 23001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Brand` (
  `IdBrandProduct` INT NOT NULL AUTO_INCREMENT,
  `BrandProduct` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdBrandProduct`))
  AUTO_INCREMENT = 65001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Product_Detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Product_Detail` (
  `idProduct_Detail` INT NOT NULL AUTO_INCREMENT,
  `IdProduct` INT NOT NULL,
  `IdBrandProduct` INT NOT NULL,
  `IdCategory` INT NOT NULL,
  `IdPresentaion` INT NOT NULL,
  PRIMARY KEY (`idProduct_Detail`),
  CONSTRAINT `fk_Product_Detail_Category1`
    FOREIGN KEY (`IdCategory`)
    REFERENCES `SkinCareEli`.`Category` (`IdCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Detail_Presentation1`
    FOREIGN KEY (`IdPresentaion`)
    REFERENCES `SkinCareEli`.`Presentation` (`IdPresentaion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Detail_Brand1`
    FOREIGN KEY (`IdBrandProduct`)
    REFERENCES `SkinCareEli`.`Brand` (`IdBrandProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Detail_Products1`
    FOREIGN KEY (`IdProduct`)
    REFERENCES `SkinCareEli`.`Products` (`IdProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 36001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Invoice_Detail_Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Invoice_Detail_Payment` (
  `ID_Payment_Invonce` INT NOT NULL AUTO_INCREMENT,
  `IdInvoice` INT NOT NULL,
  `IdClient` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Amount` DECIMAL(6,2) NOT NULL,
  `Remaining` DECIMAL(6,2) NULL,
  `Status` ENUM('Paid', 'Parcial', 'Pending') NOT NULL,
  PRIMARY KEY (`ID_Payment_Invonce`),
  CONSTRAINT `fk_Invoice_Detail_Payment_Invoice_Detail1`
    FOREIGN KEY (`IdInvoice`)
    REFERENCES `SkinCareEli`.`Invoice_Detail` (`IdInvoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Detail_Payment_Clients1`
    FOREIGN KEY (`IdClient`)
    REFERENCES `SkinCareEli`.`Client` (`IdClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 90001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Role` (
  `idRole` INT NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRole`))
  AUTO_INCREMENT = 101001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Credentials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Credentials` (
  `IdCredentials` INT NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdCredentials`))
  AUTO_INCREMENT = 150001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Access_Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Access_Persona` (
  `IdAcceso` INT NOT NULL AUTO_INCREMENT,
  `Persona_IdPersona` INT NOT NULL,
  `Role_idRole` INT NOT NULL,
  `Credentials_IdCredentials` INT NOT NULL,
  PRIMARY KEY (`IdAcceso`),
  CONSTRAINT `fk_Access_Persona_Persona1`
    FOREIGN KEY (`Persona_IdPersona`)
    REFERENCES `SkinCareEli`.`Persona` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Access_Persona_Role1`
    FOREIGN KEY (`Role_idRole`)
    REFERENCES `SkinCareEli`.`Role` (`idRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Access_Persona_Credentials1`
    FOREIGN KEY (`Credentials_IdCredentials`)
    REFERENCES `SkinCareEli`.`Credentials` (`IdCredentials`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 180001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Order` (
  `IdOrder` INT NOT NULL,
  `Description` VARCHAR(200) NOT NULL,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`IdOrder`))
  AUTO_INCREMENT = 197001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Order_Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Order_Products` (
  `Order_Products` INT NOT NULL,
  `IdEmployee` INT NOT NULL,
  `IdProduct` INT NOT NULL,
  `IdOrder` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Cost` DECIMAL(6,2) NOT NULL,
  `Total` DECIMAL(6,2) NOT NULL,
  `Status` ENUM("Arrived", "Arrving") ,
  PRIMARY KEY (`Order_Products`),
  CONSTRAINT `fk_Employee_Order_Products_Employee1`
    FOREIGN KEY (`IdEmployee`)
    REFERENCES `SkinCareEli`.`Employee` (`IdEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Products_Products1`
    FOREIGN KEY (`IdProduct`)
    REFERENCES `SkinCareEli`.`Products` (`IdProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Products_Order1`
    FOREIGN KEY (`IdOrder`)
    REFERENCES `SkinCareEli`.`Order` (`IdOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 55001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Administrator` (
  `IdAdministrator` INT NOT NULL AUTO_INCREMENT,
  `IdPersona` INT NOT NULL,
  PRIMARY KEY (`IdAdministrator`),
  CONSTRAINT `fk_Administrator_Persona1`
    FOREIGN KEY (`IdPersona`)
    REFERENCES `SkinCareEli`.`Persona` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 80001
 ;


-- -----------------------------------------------------
-- Table `SkinCareEli`.`Order_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SkinCareEli`.`Order_Status` (
  `IdOrder_Status` INT NOT NULL AUTO_INCREMENT,
  `Order_IdOrder` INT NOT NULL,
  `Administrator_IdAdministrator` INT NOT NULL,
  `Observations` VARCHAR(300) NOT NULL,
  `Checking_Date` DATE NOT NULL,
  `Order_Status` ENUM("Approved", "Rejected", "In Progress") NOT NULL,
  PRIMARY KEY (`IdOrder_Status`),
  CONSTRAINT `fk_Order_Status_Order1`
    FOREIGN KEY (`Order_IdOrder`)
    REFERENCES `SkinCareEli`.`Order` (`IdOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Status_Administrator1`
    FOREIGN KEY (`Administrator_IdAdministrator`)
    REFERENCES `SkinCareEli`.`Administrator` (`IdAdministrator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    AUTO_INCREMENT = 90001
 ;

