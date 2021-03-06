/* Setup MySQL DB to be used by the OMS
 * 
 * Author: Andreas Kring <andreas@magenta.dk>
 * */

DROP DATABASE IF EXISTS oms;
CREATE DATABASE oms default character set utf8 default collate utf8_general_ci;
USE oms;

/* Entity sets - see E/R diagram */

DROP TABLE IF EXISTS Person;
CREATE TABLE Person(
	userName VARCHAR(32) PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(255),
	password VARCHAR(255)
);

DROP TABLE IF EXISTS EndUser;
CREATE TABLE EndUser(
	userName VARCHAR(32) PRIMARY KEY,
	FOREIGN KEY (userName) REFERENCES Person(userName)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Archivist;
CREATE TABLE Archivist(
	userName VARCHAR(32) PRIMARY KEY,
	FOREIGN KEY (userName) REFERENCES Person(userName)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- All the access stuff should maybe be move to another entity set
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	orderId VARCHAR(32) PRIMARY KEY,
	title VARCHAR(255),
	origin VARCHAR(12),
	orderDate DATETIME,
	validationDate DATETIME,
	plannedDate DATETIME,
	accessDate DATETIME,
	accessDateComments TEXT,
	-- accessRestrictionCode INT,
	-- accessRestriction
	orderStatus VARCHAR(10),
	accessEndDate DATETIME,
	deliveryFormat VARCHAR(30),
	processId VARCHAR(50),
	jobId VARCHAR(50),
	dipURI VARCHAR(255),
	dipId VARCHAR(50),
	dipPath VARCHAR(255)
);

DROP TABLE IF EXISTS OrderItems;
CREATE TABLE OrderItems(
	refCode VARCHAR(32) PRIMARY KEY,
	title VARCHAR(255),
	aipURI VARCHAR(255),
	aipTitle VARCHAR(32),
	levelOfDescription TEXT,
	packageId VARCHAR(50),
	path VARCHAR(255),
	contentType VARCHAR(50),
	size INT,
	confidential BOOLEAN
);


/* Relationships - see E/R diagram */

DROP TABLE IF EXISTS OrderedBy;
CREATE TABLE OrderedBy(
	userName VARCHAR(32),
	orderId VARCHAR(32),
	endUserOrderNote TEXT,
	PRIMARY KEY (userName, orderId),
	FOREIGN KEY (userName) REFERENCES Person(userName)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (orderId) REFERENCES Orders(orderId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Responsible;
CREATE TABLE Responsible(
	userName VARCHAR(32),
	orderId VARCHAR(32),
	publicNote TEXT,
	privateNote TEXT,
	PRIMARY KEY (userName, orderId),
	FOREIGN KEY (userName) REFERENCES Person(userName)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (orderId) REFERENCES Orders(orderId)
		ON DELETE CASCADE
		ON UPDATE CASCADE	
);

DROP TABLE IF EXISTS BelongsTo;
CREATE TABLE BelongsTo(
	orderId VARCHAR(32),
	refCode VARCHAR(32),
	PRIMARY KEY (orderId, refCode),
	FOREIGN KEY (orderId) REFERENCES Orders(orderId)
		ON DELETE CASCADE
		ON UPDATE CASCADE,	
	FOREIGN KEY (refCode) REFERENCES OrderItems(refCode)
		ON DELETE CASCADE
		ON UPDATE CASCADE	
);

/* For testing */ 
INSERT INTO Person VALUES ('clint', 'Clint', 'Eastwood', 'clint@hollywood.com', 'eark');
INSERT INTO Person VALUES ('bill', 'Bill', 'Clinton', 'bill@whitehouse.gov', 'eark');
INSERT INTO Person VALUES ('bruce', 'Bruce', 'Lee', 'bruce@kungfu.org', 'eark');
INSERT INTO Person VALUES ('john', 'John', 'Travolta', 'john@hollywood.biz', 'eark');
INSERT INTO Person VALUES ('chuck', 'Chuck', 'Norris', 'chuck@hollywood.biz', 'eark');

INSERT INTO EndUser VALUES ('clint');
INSERT INTO EndUser VALUES ('bill');
INSERT INTO EndUser VALUES ('bruce');

INSERT INTO Archivist VALUES ('john');
INSERT INTO Archivist VALUES ('chuck');

/* source oms_db_2016-11-15.sql; */

