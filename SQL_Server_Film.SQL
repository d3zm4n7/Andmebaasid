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

ALTER TABLE film ADD CONSTRAINT fk_zanr1
FOREIGN KEY (zanrID) REFERENCES zanr(zanrID);

select * from film;
select * from zanr;
UPDATE film SET zanrID=2 WHERE filmID=4

CREATE TABLE rezisoor(
rezID int PRIMARY KEY identity(1,1),
rezNimi varchar(30) not null,
synniaeg date, 
riik varchar(3) ,
);

INSERT INTO rezisoor (rezNimi, synniaeg, riik)
VALUES ('Christopher Nolan', '1970-07-30', 'GBR');

SELECT * From rezisoor;

CREATE TABLE kinokava (
kinokavaId INT PRIMARY KEY identity(1,1),
kestus TIME NOT NULL,
hind DECIMAL(5, 2) NOT NULL, 

);
INSERT INTO kinokava (kestus, hind, kuupaev)
VALUES ('1:55',6.5, '2024-10-03');

ALTER TABLE kinokava ADD kuupaev date;


SELECT * From rezisoor;
SELECT * From kinokava;
SELECT * From film;


ALTER TABLE film ADD CONSTRAINT fk_rez
FOREIGN KEY (rezID) REFERENCES rezisoor(rezID);

DELETE from kinokava where kinokavaid=2


UPDATE kinokava SET rezID=4 WHERE kinokavaID=3


UPDATE film SET rezID=4 WHERE filmID=1
