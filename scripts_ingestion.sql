INSERT
	INTO
	VetClinic.Owners (OwnerID,
	OwnerName,
	OwnerSurname,
	StreetAddress,
	City,
	State,
	StateFull,
	ZipCode)
SELECT
	DISTINCT OwnerID,
	OwnerName,
	OwnerSurname,
	StreetAddress,
	City,
	State,
	StateFull,
	ZipCode
FROM
	VetClinic.vetclinic_procedures
where
	OwnerID is not null;

INSERT
	INTO
	VetClinic.Pets (PetID,
	PetName,
	PetGender,
	PetKind,
	PetAge,
	OwnerID)
select
	distinct PetID,
	PetName,
	PetGender,
	PetKind,
	PetAge,
	OwnerID
from
	VetClinic.vetclinic_procedures
where
	PetId is not null;

INSERT
	INTO
	VetClinic.Procedures(ProcedureSubCode,
	ProcedureType,
	Description,
	Price)
select
	DISTINCT ProcedureSubCode,
	ProcedureType,
	Description,
	Price
from
	VetClinic.vetclinic_procedures
where
	ProcedureSubCode is not null;

INSERT
	INTO
	VetClinic.PetProcedures (PetID,
	`Date`,
	ProcedureType,
	ProcedureSubCode)
SELECT
	DISTINCT
	PetID,
	`Date`,
	ProcedureType,
	ProcedureSubCode
FROM
	VetClinic.vetclinic_procedures
WHERE
	ProcedureSubCode IS NOT NULL
	and ProcedureType IS NOT NULL;
