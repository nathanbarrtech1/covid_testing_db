-- CS4400: Introduction to Database Systems
-- Fall 2020
-- Phase II Create Table and Insert Statements Template

-- Team 102
-- Nathan Barr (nbarr6)
-- Nikesh Patel (npatel388)
-- Saket Shirsath (sshirsath3)
-- Euiseong Jeoung (ejeoung3)

-- Directions:
-- Please follow all instructions from the Phase II assignment PDF.
-- This file must run without error for credit.
-- Create Table statements should be manually written, not taken from an SQL Dump.
-- Rename file to cs4400_phase2_teamX.sql before submission

-- CREATE TABLE STATEMENTS BELOW
DROP DATABASE IF EXISTS COVID_TEST;
CREATE DATABASE IF NOT EXISTS COVID_TEST;
USE COVID_TEST;


CREATE TABLE LOCATION (
	name VARCHAR(30) NOT NULL,
	PRIMARY KEY (name));
    
CREATE TABLE SITE ( 
	name VARCHAR(30) NOT NULL,	
	street VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL,
	zip	CHAR(5) NOT NULL,	
	state CHAR(2) NOT NULL,	
	testing_location VARCHAR(30) NOT NULL,	
    PRIMARY KEY (name),
    FOREIGN KEY (testing_location) 	REFERENCES LOCATION(name));

CREATE TABLE USER (
	username varchar(30) not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	email varchar(30) not null,
	password varchar(30) not null, 
	primary key (username));

CREATE TABLE STUDENT (
	LoginID varchar(30) not null,
	housing_type varchar(30) not null,
	testing_location varchar(30) not null,
	primary key (LoginID),
	foreign key (LoginID) references User(username),
	foreign key (testing_location) references Location(name));

CREATE TABLE ADMIN (
	LoginID varchar(30) not null,
	primary key (LoginID),
	foreign key (LoginID) references User(username));


CREATE TABLE EMPLOYEE (
	LoginID varchar(30) not null,
	Role varchar(30) not null,
	phone_num varchar(10) not null,
	primary key (LoginID),
	foreign key (LoginID) references User(username));

CREATE TABLE WORKS_IN (
	LoginID varchar(30) not null,
	site_name varchar(30) not null,
	primary key (LoginID, site_name),
	foreign key (LoginID) references User(username),
	foreign key (site_name) references Site(name));

CREATE TABLE APPOINTMENT_KEY (
	appointment_id INT NOT NULL AUTO_INCREMENT,
    date DATE NOT NULL,	
	time TIME NOT NULL,
    PRIMARY KEY (appointment_id));

CREATE TABLE APPOINTMENT (
	appt_key INT NOT NULL AUTO_INCREMENT,	
	site_name VARCHAR(30) NOT NULL,	
	LoginID VARCHAR(30),
    FOREIGN KEY (site_name) REFERENCES SITE(name),
    FOREIGN KEY (LoginID) REFERENCES User(username),
    FOREIGN KEY (appt_key) REFERENCES APPOINTMENT_KEY(appointment_id));


CREATE TABLE POOL (
	ID INT NOT NULL,	
	status VARCHAR(30) NOT NULL,
	date DATE,
	LoginID	VARCHAR(30),
    PRIMARY KEY (ID),
    FOREIGN KEY (LoginID) REFERENCES EMPLOYEE(LoginID));

CREATE TABLE TEST (
	ID INT NOT NULL,	
	status VARCHAR(8) NOT NULL,
	testing_pool INT,	
	appointment INT NOT NULL,	
	site_name VARCHAR(30) NOT NULL,	
    PRIMARY KEY (ID),
    FOREIGN KEY (appointment) REFERENCES APPOINTMENT(appt_key),
    FOREIGN KEY (testing_pool) REFERENCES POOL(ID),
    FOREIGN KEY (site_name) REFERENCES SITE(name));
    







-- INSERT STATEMENTS BELOW



    

-- ------LOCATION INSERT-------
INSERT INTO LOCATION VALUES ('East'),('West');
-- ------ADMIN INSERT--------
INSERT INTO USER VALUES ('jlionel666', 'John', 'Lionel', 'jlionel666@gatech.edu', 'password1'),
('mmoss7', 'Mark', 'Moss', 'mmoss7@gatech.edu', 'password2'),
('lchen27', 'Liang', 'Chen', 'lchen27@gatech.edu', 'password3');
INSERT INTO ADMIN VALUES ('jlionel666'), ('mmoss7'), ('lchen27');

-- ------STUDENT INSERT-------
INSERT INTO USER VALUES ('mgeller3', 'Monica' , 'Geller', 'mgeller3@gatech.edu', 'password19'),
('rgeller9', 'Ross', 'Geller' , 'rgeller9@gatech.edu', 'password20'),
('jtribbiani27', 'Joey' , 'Tribbiani', 'jtribbiani27@gatech.edu', 'password21'),
('pbuffay56', 'Phoebe' , 'Buffay', 'pbuffay56@gatech.edu', 'password22'),
('rgreen97', 'Rachel', 'Green', 'rgreen97@gatech.edu', 'password23'),
('cbing101', 'Chandler' , 'Bing', 'cbing101@gatech.edu', 'password24'),
('pbeesly61', 'Pamela', 'Beesly', 'pbeesly61@gatech.edu', 'password25'),
('jhalpert75', 'Jim' , 'Halpert', 'jhalpert75@gatech.edu', 'password26'),
('dschrute18', 'Dwight' , 'Schrute', 'dschrute18@gatech.edu', 'password27'),
('amartin365', 'Angela' , 'Martin', 'amartin365@gatech.edu', 'password28'),
('omartinez13', 'Oscar', 'Martinez', 'omartinez13@gatech.edu', 'password29'),
('mscott845', 'Michael' , 'Scott', 'mscott845@gatech.edu', 'password30'),
('abernard224', 'Andy' , 'Bernard', 'abernard224@gatech.edu', 'password31'),
('kkapoor155', 'Kelly' , 'Kapoor', 'kkapoor155@gatech.edu', 'password32'),
('dphilbin81', 'Darryl' , 'Philbin', 'dphilbin81@gatech.edu', 'password33'),
('sthefirst1', 'Sofia', 'Thefirst', 'sthefirst1@gatech.edu', 'password34'),
('gburdell1', 'George', 'Burdell', 'gburdell1@gatech.edu', 'password35'),
('dsmith102', 'Dani', 'Smith', 'dsmith102@gatech.edu', 'password36'),
('dbrown85', 'David', 'Brown', 'dbrown85@gatech.edu', 'password37'),
('dkim99', 'Dave', 'Kim', 'dkim99@gatech.edu', 'password38'),
('tlee984', 'Tom', 'Lee', 'tlee984@gatech.edu', 'password39'),
('jpark29', 'Jerry', 'Park', 'jpark29@gatech.edu', 'password40'),
('vneal101', 'Vinay', 'Neal', 'vneal101@gatech.edu', 'password41'),
('hpeterson55', 'Haydn', 'Peterson', 'hpeterson55@gatech.edu', 'password42'),
('lpiper20', 'Leroy', 'Piper', 'lpiper20@gatech.edu', 'password43'),
('mbob2', 'Mary', 'Bob', 'mbob2@gatech.edu', 'password44'),
('mrees785', 'Marie', 'Rees', 'mrees785@gatech.edu', 'password45'),
('wbryant23', 'William', 'Bryant', 'wbryant23@gatech.edu', 'password46'),
('aallman302', 'Aiysha', 'Allman', 'aallman302@gatech.edu', 'password47'),
('kweston85', 'Kyle', 'Weston', 'kweston85@gatech.edu', 'password48');

INSERT INTO STUDENT VALUES ('mgeller3', 'Off-campus Apartment', 'East'),
('rgeller9', 'Student Housing', 'East'),
('jtribbiani27', 'Greek Housing', 'West'),
('pbuffay56', 'Student Housing', 'East'),
('rgreen97', 'Student Housing', 'West'),
('cbing101', 'Greek Housing', 'East'),
('pbeesly61', 'Student Housing', 'West'),
('jhalpert75', 'Student Housing', 'East'),
('dschrute18', 'Student Housing', 'East'),
('amartin365', 'Greek Housing', 'East'),
('omartinez13', 'Student Housing', 'West'),
('mscott845', 'Student Housing', 'East'),
('abernard224', 'Greek Housing', 'West'),
('kkapoor155', 'Greek Housing', 'East'),
('dphilbin81', 'Greek Housing', 'West'),
('sthefirst1', 'Student Housing', 'West'),
('gburdell1', 'Student Housing', 'East'),
('dsmith102', 'Greek Housing', 'West'),
('dbrown85', 'Off-campus Apartment', 'East'),
('dkim99', 'Greek Housing', 'East'),
('tlee984', 'Student Housing', 'West'),
('jpark29', 'Student Housing', 'East'),
('vneal101', 'Student Housing', 'West'),
('hpeterson55', 'Greek Housing', 'East'),
('lpiper20', 'Student Housing', 'West'),
('mbob2', 'Student Housing', 'West'),
('mrees785', 'Off-campus House', 'West'),
('wbryant23', 'Greek Housing', 'East'),
('aallman302', 'Student Housing', 'West'),
('kweston85', 'Greek Housing', 'West');


-- ------INSERT EMPLOYEE-------
INSERT INTO USER VALUES ('jhilborn97','Jack','Hilborn','jhilborn97@gatech.edu','password4'),
('jhilborn98','Jake','Hilborn','jhilborn98@gatech.edu','password5'),
('ygao10','Yuan','Gao','ygao10@gatech.edu','password6'),
('jthomas520','James','Thomas','jthomas520@gatech.edu','password7'),
('cforte58','Connor','Forte','cforte58@gatech.edu','password8'),
('fdavenport49','Felicia','Devenport','fdavenport49@gatech.edu','password9'),
('hliu88','Hang','Liu','hliu88@gatech.edu','password10'),
('akarev16','Alex','Karev','akarev16@gatech.edu','password11'),
('jdoe381','Jane ','Doe','jdoe381@gatech.edu','password12'),
('sstrange11','Stephen','Strange','sstrange11@gatech.edu','password13'),
('dmcstuffins7','Doc','Mcstuffins','dmcstuffins7@gatech.edu','password14'),
('mgrey91','Meredith','Grey','mgrey91@gatech.edu','password15'),
('pwallace51','Penny','Wallace','pwallace51@gatech.edu','password16'),
('jrosario34','Jon','Rosario','jrosario34@gatech.edu','password17'),
('nshea230','Nicholas','Shea','nshea230@gatech.edu','password18');


INSERT INTO EMPLOYEE VALUES ('jhilborn97','LAB_TECH','4043802577'),
('jhilborn98','LAB_TECH','4042201897'),
('ygao10','LAB_TECH','7703928765'),
('jthomas520','LAB_TECH','7705678943'),
('cforte58','LAB_TECH','4708623384'),
('fdavenport49','LAB_TECH','7068201473'),
('hliu88','LAB_TECH','4782809765'),
('akarev16','SITE_TESTER','9876543210'),
('jdoe381','SITE_TESTER','1237864230'),
('sstrange11','SITE_TESTER','6547891234'),
('dmcstuffins7','SITE_TESTER','1236549878'),
('mgrey91','SITE_TESTER','6458769523'),
('pwallace51','SITE_TESTER','3788612907'),
('jrosario34','SITE_TESTER','5926384247'),
('nshea230','SITE_TESTER','6979064501');

INSERT INTO SITE VALUES ('Fulton County Board of Health','10 Park Place South SE','Atlanta',30303,'GA','East'),
('CCBOH WIC Clinic','1895 Phoenix Blvd','College Park',30339,'GA','West'),
('Kennesaw State University','3305 Busbee Drive NW','Kennesaw',30144,'GA','West'),
('Stamps Health Services','740 Ferst Drive ','Atlanta',30332,'GA','West'),
('Bobby Dodd Stadium','150 Bobby Dodd Way NW','Atlanta',30332,'GA','East'),
('Caddell Building','280 Ferst Drive NW','Atlanta',30332,'GA','West'),
('Coda Building','760 Spring Street ','Atlanta',30332,'GA','East'),
('GT Catholic Center','172 4th St NW','Atlanta',30313,'GA','East'),
('West Village','532 8th St NW','Atlanta',30318,'GA','West'),
('GT Connector','116 Bobby Dodd Way NW','Atlanta',30313,'GA','East'),
('Curran St Parking Deck','564 8th St NW','Atlanta',30318,'GA','West'),
('North Avenue (Centenial Room)','120 North Avenue NW','Atlanta',30313,'GA','East');


INSERT INTO WORKS_IN VALUES ('akarev16','Fulton County Board of Health'),
('akarev16','CCBOH WIC Clinic'),
('akarev16','Kennesaw State University'),
('akarev16','Stamps Health Services'),
('jdoe381','Curran St Parking Deck'),
('jdoe381','North Avenue (Centenial Room)'),
('jdoe381','Fulton County Board of Health'),
('jdoe381','CCBOH WIC Clinic'),
('sstrange11','Coda Building'),
('sstrange11','GT Catholic Center'),
('sstrange11','West Village'),
('sstrange11','GT Connector'),
('sstrange11','Curran St Parking Deck'),
('sstrange11','North Avenue (Centenial Room)'),
('dmcstuffins7','Bobby Dodd Stadium'),
('dmcstuffins7','Caddell Building'),
('dmcstuffins7','Coda Building'),
('dmcstuffins7','GT Catholic Center'),
('dmcstuffins7','West Village'),
('dmcstuffins7','GT Connector'),
('mgrey91','Kennesaw State University'),
('mgrey91','Stamps Health Services'),
('mgrey91','Bobby Dodd Stadium'),
('mgrey91','Caddell Building'),
('pwallace51','Coda Building');

INSERT INTO POOL VALUES (1,'negative','2020-09-02','jhilborn97'),
(2,'positive','2020-09-04','jhilborn98'),
(3,'positive','2020-09-06','ygao10'),
(4,'positive','2020-09-05','jthomas520'),
(5,'negative','2020-09-07','fdavenport49'),
(6,'positive','2020-09-05','hliu88'),
(7,'negative','2020-09-11','cforte58'),
(8,'positive','2020-09-11','ygao10'),
(9,'pending',NULL,NULL),
(10,'pending',NULL,NULL),
(11,'pending',NULL,NULL),
(12,'pending',NULL,NULL),
(13,'pending',NULL,NULL);


INSERT INTO APPOINTMENT_KEY (date, time) VALUES ('2020-09-01','8:00:00'),
('2020-09-01','9:00:00'),
('2020-09-01','10:00:00'),
('2020-09-01','11:00:00'),
('2020-09-01','12:00:00'),
('2020-09-01','13:00:00'),
('2020-09-01','14:00:00'),
('2020-09-01','15:00:00'),
('2020-09-01','16:00:00'),
('2020-09-03','8:00:00'),
('2020-09-03','9:00:00'),
('2020-09-03','10:00:00'),
('2020-09-03','11:00:00'),
('2020-09-03','12:00:00'),
('2020-09-03','13:00:00'),
('2020-09-03','14:00:00'),
('2020-09-03','15:00:00'),
('2020-09-03','16:00:00'),
('2020-09-03','17:00:00'),
('2020-09-04','8:00:00'),
('2020-09-04','9:00:00'),
('2020-09-04','10:00:00'),
('2020-09-04','11:00:00'),
('2020-09-04','12:00:00'),
('2020-09-04','13:00:00'),
('2020-09-04','14:00:00'),
('2020-09-04','15:00:00'),
('2020-09-04','16:00:00'),
('2020-09-04','17:00:00'),
('2020-09-04','8:00:00'),
('2020-09-04','9:00:00'),
('2020-09-04','10:00:00'),
('2020-09-10','11:00:00'),
('2020-09-10','12:00:00'),
('2020-09-10','13:00:00'),
('2020-09-10','14:00:00'),
('2020-09-10','15:00:00'),
('2020-09-10','16:00:00'),
('2020-09-10','17:00:00'),
('2020-09-10','8:00:00'),
('2020-09-10','9:00:00'),
('2020-09-10','10:00:00'),
('2020-09-10','11:00:00'),
('2020-09-10','12:00:00'),
('2020-09-10','13:00:00'),
('2020-09-10','14:00:00'),
('2020-09-10','15:00:00'),
('2020-09-10','16:00:00'),
('2020-09-10','17:00:00'),
('2020-09-10','8:00:00'),
('2020-09-10','9:00:00'),
('2020-09-13','10:00:00'),
('2020-09-13','11:00:00'),
('2020-09-13','12:00:00'),
('2020-09-13','13:00:00'),
('2020-09-13','14:00:00'),
('2020-09-16','15:00:00'),
('2020-09-16','16:00:00'),
('2020-09-16','17:00:00'),
('2020-09-16','8:00:00'),
('2020-09-16','9:00:00'),
('2020-09-16','10:00:00'),
('2020-09-16','11:00:00'),
('2020-09-16','12:00:00'),
('2020-09-16','13:00:00'),
('2020-09-16','14:00:00'),
('2020-09-16','15:00:00'),
('2020-10-01','17:00:00'),
('2020-10-01','8:00:00'),
('2020-10-01','9:00:00'),
('2020-10-01','17:00:00'),
('2020-10-01','8:00:00'),
('2020-10-01','9:00:00'),
('2020-10-01','10:00:00'),
('2020-10-01','11:00:00'),
('2020-10-02','12:00:00'),
('2020-10-02','13:00:00'),
('2020-10-02','14:00:00'),
('2020-10-02','15:00:00'),
('2020-10-02','16:00:00'),
('2020-10-02','17:00:00'),
('2020-10-06','8:00:00'),
('2020-10-06','9:00:00'),
('2020-10-06','10:00:00'),
('2020-10-06','11:00:00'),
('2020-10-06','12:00:00'),
('2020-10-07','13:00:00'),
('2020-10-07','14:00:00'),
('2020-10-07','15:00:00'),
('2020-10-07','16:00:00'),
('2020-10-07','17:00:00'),
('2020-10-07','8:00:00'),
('2020-10-07','9:00:00'),
('2020-10-07','10:00:00');


INSERT INTO APPOINTMENT (site_name, LoginID) VALUES ('Fulton County Board of Health','mgeller3'),
('Bobby Dodd Stadium','rgeller9'),
('Caddell Building','jtribbiani27'),
('GT Catholic Center','pbuffay56'),
('West Village','rgreen97'),
('GT Catholic Center','cbing101'),
('West Village','pbeesly61'),
('North Avenue (Centenial Room)','jhalpert75'),
('North Avenue (Centenial Room)','dschrute18'),
('Curran St Parking Deck','omartinez13'),
('Bobby Dodd Stadium','mscott845'),
('Stamps Health Services','abernard224'),
('GT Catholic Center','kkapoor155'),
('West Village','dphilbin81'),
('Caddell Building','sthefirst1'),
('Coda Building','gburdell1'),
('Stamps Health Services','dsmith102'),
('CCBOH WIC Clinic','dbrown85'),
('GT Connector','dkim99'),
('Curran St Parking Deck','tlee984'),
('GT Connector','jpark29'),
('Curran St Parking Deck','vneal101'),
('Bobby Dodd Stadium','hpeterson55'),
('Caddell Building','lpiper20'),
('Stamps Health Services','mbob2'),
('Kennesaw State University','mrees785'),
('GT Catholic Center','wbryant23'),
('West Village','aallman302'),
('West Village','kweston85'),
('Fulton County Board of Health','mgeller3'),
('Bobby Dodd Stadium','rgeller9'),
('Caddell Building','jtribbiani27'),
('Bobby Dodd Stadium','pbuffay56'),
('Caddell Building','rgreen97'),
('GT Catholic Center','cbing101'),
('West Village','pbeesly61'),
('Coda Building','jhalpert75'),
('Coda Building','dschrute18'),
('Coda Building','amartin365'),
('Stamps Health Services','omartinez13'),
('Bobby Dodd Stadium','mscott845'),
('West Village','abernard224'),
('GT Connector','kkapoor155'),
('Curran St Parking Deck','dphilbin81'),
('Curran St Parking Deck','sthefirst1'),
('North Avenue (Centenial Room)','gburdell1'),
('Caddell Building','dsmith102'),
('CCBOH WIC Clinic','dbrown85'),
('Bobby Dodd Stadium','dkim99'),
('West Village','tlee984'),
('GT Catholic Center','jpark29'),
('Curran St Parking Deck','vneal101'),
('Coda Building','hpeterson55'),
('Stamps Health Services','lpiper20'),
('Curran St Parking Deck','mbob2'),
('CCBOH WIC Clinic','mrees785'),
('North Avenue (Centenial Room)','wbryant23'),
('West Village','aallman302'),
('Caddell Building','kweston85'),
('Fulton County Board of Health',NULL),
('CCBOH WIC Clinic',NULL),
('Kennesaw State University',NULL),
('Stamps Health Services',NULL),
('Bobby Dodd Stadium',NULL),
('Caddell Building',NULL),
('Coda Building',NULL),
('GT Catholic Center',NULL),
('GT Connector',NULL),
('Curran St Parking Deck',NULL),
('North Avenue (Centenial Room)',NULL),
('Fulton County Board of Health',NULL),
('CCBOH WIC Clinic',NULL),
('Kennesaw State University',NULL),
('Stamps Health Services',NULL),
('Bobby Dodd Stadium',NULL),
('Caddell Building',NULL),
('Coda Building',NULL),
('GT Catholic Center',NULL),
('West Village',NULL),
('GT Connector',NULL),
('Curran St Parking Deck',NULL),
('North Avenue (Centenial Room)',NULL),
('Fulton County Board of Health',NULL),
('CCBOH WIC Clinic',NULL),
('Kennesaw State University',NULL),
('Stamps Health Services',NULL),
('Bobby Dodd Stadium',NULL),
('Caddell Building',NULL),
('Coda Building',NULL),
('GT Catholic Center',NULL),
('West Village',NULL),
('GT Connector',NULL),
('Curran St Parking Deck',NULL),
('North Avenue (Centenial Room)',NULL);


INSERT INTO TEST VALUES (100001,'negative',1,1,'Fulton County Board of Health'),
(100002,'negative',1,2,'Bobby Dodd Stadium'),
(100003,'negative',1,3,'Caddell Building'),
(100004,'negative',1,4,'GT Catholic Center'),
(100005,'negative',1,5,'West Village'),
(100006,'negative',1,6,'GT Catholic Center'),
(100007,'negative',1,7,'West Village'),
(100008,'negative',2,8,'North Avenue (Centenial Room)'),
(100009,'positive',2,9,'North Avenue (Centenial Room)'),
(100011,'negative',2,10,'Curran St Parking Deck'),
(100012,'positive',2,11,'Bobby Dodd Stadium'),
(100013,'positive',2,12,'Stamps Health Services'),
(100014,'negative',2,13,'GT Catholic Center'),
(100015,'negative',3,14,'West Village'),
(100016,'positive',3,15,'Caddell Building'),
(100017,'negative',3,16,'Coda Building'),
(100018,'negative',3,17,'Stamps Health Services'),
(100019,'positive',3,18,'CCBOH WIC Clinic'),
(100020,'negative',4,19,'GT Connector'),
(100021,'negative',4,20,'Curran St Parking Deck'),
(100022,'negative',4,21,'GT Connector'),
(100023,'negative',4,22,'Curran St Parking Deck'),
(100024,'positive',4,23,'Bobby Dodd Stadium'),
(100025,'negative',5,24,'Caddell Building'),
(100026,'negative',5,25,'Stamps Health Services'),
(100027,'negative',5,26,'Kennesaw State University'),
(100028,'negative',5,27,'GT Catholic Center'),
(100029,'negative',5,28,'West Village'),
(100030,'negative',5,29,'West Village'),
(100031,'positive',6,30,'Fulton County Board of Health'),
(100032,'positive',6,31,'Bobby Dodd Stadium'),
(100033,'negative',7,32,'Caddell Building'),
(100034,'negative',7,33,'Bobby Dodd Stadium'),
(100035,'negative',7,34,'Caddell Building'),
(100036,'negative',7,35,'GT Catholic Center'),
(100037,'negative',7,36,'West Village'),
(100038,'negative',7,37,'Coda Building'),
(100039,'negative',8,38,'Coda Building'),
(100040,'positive',8,39,'Coda Building'),
(100041,'negative',8,40,'Stamps Health Services'),
(100042,'pending',9,41,'Bobby Dodd Stadium'),
(100043,'pending',9,42,'West Village'),
(100044,'pending',9,43,'GT Connector'),
(100045,'pending',9,44,'Curran St Parking Deck'),
(100046,'pending',9,45,'Curran St Parking Deck'),
(100047,'pending',9,46,'North Avenue (Centenial Room)'),
(100048,'pending',9,47,'Caddell Building'),
(100049,'pending',10,48,'CCBOH WIC Clinic'),
(100050,'pending',11,49,'Bobby Dodd Stadium'),
(100051,'pending',11,50,'West Village'),
(100052,'pending',11,51,'GT Catholic Center'),
(100053,'pending',11,52,'Curran St Parking Deck'),
(100054,'pending',11,53,'Coda Building'),
(100055,'pending',12,54,'Stamps Health Services'),
(100056,'pending',12,55,'Curran St Parking Deck'),
(100057,'pending',12,56,'CCBOH WIC Clinic'),
(100058,'pending',12,57,'North Avenue (Centenial Room)'),
(100059,'pending',13,58,'West Village'),
(100060,'pending',13,59,'Caddell Building');







    


