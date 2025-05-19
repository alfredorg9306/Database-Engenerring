USE skincareli;
-- -----------------------------------------------------
-- Table Clients
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Clients (
  IdClient INT NOT NULL AUTO_INCREMENT,
  FullName VARCHAR(100) NOT NULL,
  Age SMALLINT NOT NULL,
  Address VARCHAR(200) NOT NULL,
  PhoneNumber VARCHAR(10) NOT NULL,
  PRIMARY KEY (IdClient)) AUTO_INCREMENT 001;
-- -----------------------------------------------------
-- Table Category
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Category (
  IdCategory INT NOT NULL AUTO_INCREMENT,
  Category VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdCategory)) AUTO_INCREMENT 1001;
-- -----------------------------------------------------
-- Products
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Products (
  IdProduct INT NOT NULL AUTO_INCREMENT,
  ProductName VARCHAR(120) NOT NULL,
  Description VARCHAR(500) NOT NULL,
  Price DECIMAL(6,2) NOT NULL,
  InStock INT NOT NULL,
  PRIMARY KEY (IdProduct)
) AUTO_INCREMENT 2001;
-- -----------------------------------------------------
-- Empleado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Empleado (
  IdEmpleado INT NOT NULL AUTO_INCREMENT,
  FullName VARCHAR(150) NOT NULL,
  Age SMALLINT NOT NULL,
  PRIMARY KEY (IdEmpleado))AUTO_INCREMENT 4001;
-- -----------------------------------------------------
-- Factura
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Factura (
  IdFactura INT NOT NULL AUTO_INCREMENT,
  IdClient INT NOT NULL,
  IdEmpleado INT NOT NULL,
  Date DATE NOT NULL,
  Payment_Method VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdFactura),
  CONSTRAINT fk_Factura_Clients
    FOREIGN KEY (IdClient)
    REFERENCES Clients (IdClient)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Factura_Empleado1
    FOREIGN KEY (IdEmpleado)
    REFERENCES Empleado (IdEmpleado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)AUTO_INCREMENT 60001;

-- -----------------------------------------------------
-- Invoice_Detail
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Invoice_Detail (
  IdInvoice INT NOT NULL AUTO_INCREMENT,
  IdProduct INT NOT NULL,
  IdFactura INT NOT NULL,
  Quantity INT NOT NULL,
  Total DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (IdInvoice),
  CONSTRAINT fk_Invoice_Detail_Products1
    FOREIGN KEY (IdProduct)
    REFERENCES Products (IdProduct)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Invoice_Detail_Factura1
    FOREIGN KEY (IdFactura)
    REFERENCES Factura (IdFactura)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)AUTO_INCREMENT 80001;
-- -----------------------------------------------------
-- Presentation
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Presentation (
	IdPresentation INT NOT NULL AUTO_INCREMENT,
	Presentation VARCHAR(100) NOT NULL,
  PRIMARY KEY (IdPresentaion)
)AUTO_INCREMENT 9001;

DESCRIBE Presentation;
ALTER TABLE Presentation
CHANGE IdPresentaion IdPresentation INT NOT NULL;

-- -------------------------------------------------------
-- Brand
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS Brand (
	IdBrandProduct INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ProductBrand VARCHAR(100)
) AUTO_INCREMENT 30001;



-- -------------------------------------------------------
-- Product_Detail
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS Product_Detail(
	IdProductDetail INT NOT NULL PRIMARY KEY,
    IdProduct INT NOT NULL,
    IdBrandProduct INT NOT NULL,
    IdCategory INT NOT NULL,
    IdPresentation INT NOT NULL,
    IdSize INT NOT NULL,
    
    CONSTRAINT fk_idProduct_P_PD
		FOREIGN KEY(IdProduct)
        REFERENCES Products(IdProduct)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
        
	CONSTRAINT fk_idBrandProduct_BP_PD
		FOREIGN KEY(IdBrandProduct)
        REFERENCES Brand(IdBrandProduct)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,

	CONSTRAINT fk_idCategory_C_PD
		FOREIGN KEY(IdCategory)
        REFERENCES Category(IdCategory)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
        
	CONSTRAINT fk_idPresentation_P_PD
		FOREIGN KEY(IdPresentation)
        REFERENCES Presentation(IdPresentation)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) AUTO_INCREMENT 10001;

DROP TABLE product_detail