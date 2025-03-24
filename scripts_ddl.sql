USE VetClinic;
-- SCRIPTS DE DDL -----------------------------------------------------------------------

CREATE TABLE VetClinic.Owners(
	OwnerID INT PRIMARY KEY NOT NULL,	
	OwnerName VARCHAR(50),
	OwnerSurname VARCHAR(50),
	Phone VARCHAR(50),
	Email VARCHAR(50),
	StreetAddress VARCHAR(50),
	City VARCHAR(50),
	State VARCHAR(50),
	StateFull VARCHAR(50),
	ZipCode INT
);

ALTER TABLE VetClinic.Owners ADD UNIQUE (Phone);

ALTER TABLE VetClinic.Owners ADD UNIQUE (Email);

CREATE TABLE VetClinic.Pets(
	PetID VARCHAR(50) PRIMARY KEY NOT NULL,
	PetName VARCHAR(50),
	PetGender VARCHAR(50),
	PetKind VARCHAR(50),
	PetAge INT CHECK (PetAge >= 0),
	OwnerID INT NOT NULL,
	FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID) ON
DELETE
	CASCADE ON
	UPDATE
		CASCADE
);

ALTER TABLE VetClinic.Pets ADD CHECK (PetAge >= 0);

CREATE TABLE VetClinic.Procedures(
	ProcedureSubCode INT NOT NULL,
	ProcedureType VARCHAR(50) NOT NULL,
	Description VARCHAR(50),
	Price DECIMAL CHECK (Price >= 0),
	PRIMARY KEY (ProcedureSubCode,
ProcedureType)
);

CREATE TABLE VetClinic.PetProcedures(
	PetProcedureId INT AUTO_INCREMENT PRIMARY KEY,
	Date date,
	PetID VARCHAR(50) NOT NULL,
	ProcedureSubCode INT NOT NULL,
	ProcedureType VARCHAR(50) NOT NULL,
	FOREIGN KEY (PetID) REFERENCES Pets(PetID) ON
DELETE
	CASCADE ON
	UPDATE
		CASCADE,
		FOREIGN KEY (ProcedureSubCode,
		ProcedureType) REFERENCES Procedures(ProcedureSubCode,
		ProcedureType) ON
		DELETE
			CASCADE ON
			UPDATE
				CASCADE
);
