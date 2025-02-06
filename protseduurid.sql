--SQL SALVESTATUD PROTSEDUURID-- funktsioonid - mitu SQL käsku käivitakse järjest
-- SQL SERVER
CREATE DATABASE procTARgv24;

USE procTARgv24;
CREATE TABLE uudised(
uudisID int PRIMARY KEY identity(1,1),
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
)

SELECT * FROM uudised;
INSERT INTO uudised(uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
'udune ilm', '2025-02-06', 'postimees', 'Lõunani on udune ilm')
--protseduuri loomine
--sisestab uudised tabelisse ja kohe näitab
CREATE PROCEDURE lisaUudis
@uusTeema varchar(50),
@paev date,
@autor varchar(25),
@kirjeldus text
AS
BEGIN

INSERT INTO uudised(uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
@uusTeema, @paev, @autor, @kirjeldus);
SELECT * FROM uudised;

END;
--kutse VARIANT 1
EXEC lisaUudis 'windows 11', '2025-02-06', 'õpetaja Pant', 'win11 ei tööta multimeedia klassis'
-- kutse VARIANT 2
EXEC lisaUudis
@uusTeema='1.märts on juba kevad',
@paev='2025-02-06',
@autor='test',
@kirjeldus='puudub';


--protseduur, mis kasutab tabelist id järgi
CREATE PROCEDURE kustutaUudis
@id int
AS
BEGIN
SELECT * FROM uudised;
DELETE FROM uudised WHERE uudisID=@id;
SELECT * FROM uudised;
END;
--kutse VARIANT 1
EXEC kustutaUudis 3;
--kutse VARIANT 2
EXEC kustutaUudis @id=3;

UPDATE uudised SET kirjeldus='uus kirjeldus'
WHERE kirjeldus Like 'puudub';
SELECT * FROM uudised;
--protseduur mis uuendab andmed tabelis/UPDATE
 
CREATE PROCEDURE uuendaKirjeldus
@uuskirjeldus text
AS
BEGIN
SELECT * FROM uudised;
UPDATE uudised SET kirjeldus=@uuskirjeldus
WHERE kirjeldus Like 'puudub';
SELECT * FROM uudised;
END;

--kutse

EXEC uuendaKirjeldus 'uus tekst kirjelduses';

--protseduur mis otsib ja näitab uudist esimese tähte järgi

CREATE PROCEDURE ostingUudiseTeema
@taht char(1)

AS
BEGIN
SELECT * FROM uudised
WHERE uudiseTeema LIKE @taht + '%';
END;

--kutse

EXEC ostingUudiseTeema 'w'

--XAMPP
CREATE TABLE uudised(
uudisID int PRIMARY KEY AUTO_INCREMENT, 
 uudiseTeema varchar(50), 
 kuupaev date, 
 autor varchar(25), 
 kirjeldus text 
 );
-- protseduur
INSERT INTO uudised(
 uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
'udune ilm', '2025-02-06', 'postimees', 'Lõunani on udune ilm')


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaUudis`(IN `uusTeema` VARCHAR(50), IN `paev` DATE, IN `autor` VARCHAR(25), IN `kirjeldus` TEXT)
BEGIN

INSERT INTO uudised(
uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
uusTeema, paev, autor, kirjeldus);
SELECT * FROM uudised;

END$$
DELIMITER ;

--kutse XAMPP

CALL lisauudis ('windows 11', '2025-02-06', 'õpetaja Pant', 'win11 ei tööta multimeedia klassis');




