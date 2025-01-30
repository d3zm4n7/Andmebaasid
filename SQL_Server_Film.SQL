CREATE DATABASE TARgvMelnikov;


USE TARgvMelnikov;
CREATE TABLE film(
filmID int PRIMARY KEY identity(1,1),
filmNimetus varchar(30) not null,
aasta int, 
eelarveHind decimal(7,1),
);
SELECT * From film;


--Table deletion, before you got connection with other tables...
DROP TABLE film;

--Insert data into dbo.film
INSERT INTO film(filmNimetus, aasta, eelarveHind)
VALUES('', 2024, 555555.5)

--Delete data from dbo.film
DELETE FROM film WHERE filmID=5

CREATE TABLE zanr(
zanrID int PRIMARY KEY identity(1,1),
zanrNimetus varchar(20) UNIQUE
)
--Insert data into dbo.zanr
INSERT INTO zanr(zanrNimetus)
VALUES ('draama'), ('detektiiv');
SELECT * FROM zanr;

--tabeli film struktuuri muutmine--> add new column
ALTER TABLE film ADD zanrID int;
SELECT * FROM film;
--tabeli film struktuuri muutmine--> 
--add FK film(zanrID) with PK zanr(zanrID)

ALTER TABLE film ADD CONSTRAINT fk_zanr
FOREIGN KEY (zanrID) REFERENCES zanr(zanrID);

select * from film;
select * from zanr;
UPDATE film SET zanrID=2 WHERE filmID=4
