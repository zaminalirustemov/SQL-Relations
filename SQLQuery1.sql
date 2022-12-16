CREATE DATABASE TapAZIphoneDB

USE TapAZIphoneDB

CREATE TABLE Catalog
(
	Id INT IDENTITY CONSTRAINT PK_Catalog_Id PRIMARY KEY,
	Name NVARCHAR(50) CONSTRAINT UQ_Catalog_Name UNIQUE
)

CREATE TABLE Species
(
	Id INT IDENTITY CONSTRAINT PK_Species_Id PRIMARY KEY,
	Name NVARCHAR(50) CONSTRAINT UQ_Species_Name UNIQUE,
	CatalogId INT FOREIGN KEY(CatalogId) REFERENCES Catalog(Id) 
)

CREATE TABLE Brands
(
	Id INT IDENTITY CONSTRAINT PK_Brands_Id PRIMARY KEY,
	Name NVARCHAR(50) CONSTRAINT UQ_Brands_Name UNIQUE,
	SpeciesID INT FOREIGN KEY(SpeciesID) REFERENCES Species(Id) 
)

CREATE TABLE Models
(
	Id INT IDENTITY CONSTRAINT PK_Models_Id PRIMARY KEY,
	Name NVARCHAR(50) CONSTRAINT UQ_Models_Name UNIQUE,
	BrandID INT FOREIGN KEY(BrandID) REFERENCES Brands(Id) 
)


CREATE TABLE Phones
(
	Id INT IDENTITY CONSTRAINT PK_Phones_Id PRIMARY KEY,
	Price INT,
	ModelId INT FOREIGN KEY(ModelId) REFERENCES Models(Id) 
)



CREATE TABLE Features
(
	Id INT IDENTITY CONSTRAINT PK_Features_Id PRIMARY KEY,
	Name NVARCHAR(50) CONSTRAINT UQ_Features_Name UNIQUE
)

CREATE TABLE Cities
(
	Id INT IDENTITY CONSTRAINT PK_Cities_Id PRIMARY KEY,
	Name NVARCHAR(50) CONSTRAINT UQ_Cities_Name UNIQUE
)

CREATE TABLE Colors
(
	Id INT IDENTITY CONSTRAINT PK_Colors_Id PRIMARY KEY,
	Name NVARCHAR(50) CONSTRAINT UQ_Colors_Name UNIQUE
)

CREATE TABLE Memories
(
	Id INT IDENTITY CONSTRAINT PK_Memories_Id PRIMARY KEY,
	Name NVARCHAR(50) CONSTRAINT UQ_Memories_Name UNIQUE
)



CREATE TABLE PhoneFeatures
(
	Id INT IDENTITY CONSTRAINT PK_PhoneFeatures_Id PRIMARY KEY,
	PhoneId INT FOREIGN KEY(PhoneId) REFERENCES Phones(Id),
	FeatureId INT FOREIGN KEY(FeatureId) REFERENCES Features(Id)
)

CREATE TABLE PhoneCities
(
	Id INT IDENTITY CONSTRAINT PK_PhoneCities_Id PRIMARY KEY,
	PhoneId INT FOREIGN KEY(PhoneId) REFERENCES Phones(Id),
	CityId INT FOREIGN KEY(CityId) REFERENCES Cities(Id)
)

CREATE TABLE PhoneColors
(
	Id INT IDENTITY CONSTRAINT PK_PhoneColors_Id PRIMARY KEY,
	PhoneId INT FOREIGN KEY(PhoneId) REFERENCES Phones(Id),
	ColorId INT FOREIGN KEY(ColorId) REFERENCES Colors(Id)
)

CREATE TABLE PhoneMemories
(
	Id INT IDENTITY CONSTRAINT PK_PhoneMemories_Id PRIMARY KEY,
	PhoneId INT FOREIGN KEY(PhoneId) REFERENCES Phones(Id),
	MemoryId INT FOREIGN KEY(MemoryId) REFERENCES Memories(Id)
)


INSERT INTO Catalog
VALUES
('Ev ve bag'),
('Neqliyyat'),
('Elektronika')

INSERT INTO Species
VALUES
('Mebeller',1),
('Temir ve tikinti',1),
('Meiset texnikasi',1),
('Avtomobiller',2),
('Ehtiyat hisseler',2),
('Avtobuslar',2),
('Motosikletler',2),
('Audio',3),
('Komputer',3),
('Telefon',3),
('Planset',3)

INSERT INTO Brands
VALUES
('Audi',4),
('Mercedes',4),
('Toyota',4),
('Touring',7),
('Cruiser',7),
('Enduro',7),
('Apple',10),
('Samsung',10),
('Xiaomi',10),
('Huawei',10),
('Asus',9),
('HP',9),
('Lenovo',9)


INSERT INTO Models
VALUES
('Q7',1),
('E320',2),
('Prius',3),
('Pavilion',12),
('TUF Game',11),
('IPhone 14 Pro',7),
('Iphone 14',7),
('Iphone 13 Pro MAX',7),
('IPhone X',7),
('Iphone 7',7),
('A52',8),
('S22',8),
('Galaxy S4',8)


INSERT INTO Phones
VALUES
(44500,1),
(56200,1),
(12000,3),
(2300,5),
(2150,4),
(2200,8),
(2300,8),
(1249,9),
(350,13)



INSERT INTO Cities
VALUES
('Baki'),
('Sumqayit'),
('Gence'),
('Celilabad')


INSERT INTO Colors
VALUES
('Red'),
('Blue'),
('Sierra'),
('Black')


INSERT INTO Memories
VALUES
('8 GB'),
('16 GB'),
('32 GB'),
('64 GB'),
('128 GB'),
('256 GB'),
('512 GB'),
('1 TB')


INSERT INTO PhoneCities
VALUES
(6,1),
(7,1),
(8,3),
(9,4)

INSERT INTO PhoneColors
VALUES
(6,3),
(7,4),
(8,4),
(9,1)

INSERT INTO PhoneMemories
VALUES
(6,6),
(7,6),
(8,4),
(9,1)


SELECT Brands.Name,Models.Name FROM Brands
JOIN Models
ON Brands.Id=Models.BrandID
