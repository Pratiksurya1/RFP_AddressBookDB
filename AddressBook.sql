--UC 1
CREATE DATABASE 

--UC 2

CREATE TABLE AddressBook(
id int identity(1,1),
firstName varchar(20),
lastName varchar(20),
address varchar(30),
city varchar(15),
state varchar(15),
zip varchar(7),
phone varchar(10),
email varchar(30),
)

--UC 3

INSERT INTO AddressBook VALUES(
'hirdesh',
'kumar',
'PT-5466',
'patna',
'bihar',
'600626',
'8881113210',
'hirdesh48@gmail.com'
)

--UC 4

UPDATE AddressBook SET phone='985634127' WHERE firstName='hirdesh'

--UC 5

DELETE FROM AddressBook WHERE id='ganesh'

--UC 6

SELECT * FROM AddressBook WHERE city='patna' OR state='bihar'

--UC 7

SELECT city,COUNT(id) FROM AddressBook GROUP BY city
SELECT state,COUNT(id) FROM AddressBook GROUP BY state

--UC 8

SELECT firstName, lastName, city FROM AddressBook ORDER BY(firstName) ASC

--UC 9

ALTER TABLE AddressBook ADD name varchar(10),type varchar(15)

UPDATE AddressBook SET
name='book2',
type='family'
WHERE firstName='hirdesh'

-- UC 10

SELECT type,COUNT(name) FROM AddressBook GROUP BY(type)

-- UC 11
INSERT INTO AddressBook VALUES(
'ram',
'singh',
'PT-5466',
'lakhnau',
'panjab',
'600626',
'8881113210',
'hirdesh48@gmail.com',
'book1',
'friend'
)

INSERT INTO AddressBook VALUES(
'ram',
'singh',
'PT-5466',
'lakhnau',
'panjab',
'600626',
'8881113210',
'hirdesh48@gmail.com',
'book1',
'family'
)

-- UC 12

CREATE TABLE AddressBook2 (
bookName varchar(15) PRIMARY KEY
)
		------

CREATE TABLE contact_info(
bookName varchar(15) FOREIGN KEY REFERENCES AddressBook2(bookName),
id INT IDENTITY PRIMARY KEY,
firstName VARCHAR(10),
lastName VARCHAR(15),
address VARCHAR(50),
city VARCHAR(15),
state VARCHAR(15),
zip VARCHAR(7),
phone VARCHAR(10),
email VARCHAR(30)
)
		-----

CREATE TABLE type(
type varchar(15) PRIMARY KEY
)
		-----

CREATE TABLE bookType(
type varchar(15) FOREIGN KEY REFERENCES type(type),
pesonId INT FOREIGN KEY REFERENCES contact_info(id),
)

--- UC 13
					--- Uc 6 Query
SELECT * FROM contact_info WHERE city='patna' OR state='bihar'

					--- Uc 7 Query
SELECT city,COUNT(id) FROM contact_info GROUP BY city
SELECT state,COUNT(id) FROM contact_info GROUP BY state

					--- Uc 8 Query

SELECT firstName, lastName, city FROM contact_info ORDER BY(firstName) ASC

					--- Uc 10 Query
SELECT t.type,COUNT(a.firstName) FROM AddressBook a,bookType t GROUP BY(t.type)