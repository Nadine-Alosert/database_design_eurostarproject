--CREATE AND INSERT STATEMENTS

--Create table TRAIN with attributes: trainID to identify each unique train, whether its operating of not (16 out of 20 trains operate at a time), train model date determines the type of routes trains are eligible for.
-- Constraints used are: primary key and NOT NULL

	CREATE TABLE TRAIN
	(TRAINID NUMBER(3) NOT NULL PRIMARY KEY, INOPERATIONORNOT VARCHAR(5),TRAINMODELDATE DATE);

-- Insert values into tuples
INSERT INTO TRAIN VALUES	
	(100, 'TRUE', TO_DATE('07-DEC-2016', 'DD-MON-YYYY'));

INSERT INTO TRAIN VALUES	
	(101, 'TRUE', TO_DATE('07-DEC-2018', 'DD-MON-YYYY'));

INSERT INTO TRAIN VALUES	 
	(102, 'FALSE', TO_DATE('27-JAN-2015', 'DD-MON-YYYY'));

INSERT INTO TRAIN VALUES	
(103, 'TRUE', TO_DATE('07-DEC-2019', 'DD-MON-YYYY'));

INSERT INTO TRAIN VALUES	
	(104, 'TRUE', TO_DATE('07-FEB-2012', 'DD-MON-YYYY'));

INSERT INTO TRAIN VALUES	 
	(105, 'FALSE', TO_DATE('07-DEC-2010', 'DD-MON-YYYY'));

INSERT INTO TRAIN VALUES	 
	(106, 'TRUE', TO_DATE('07-DEC-2011', 'DD-MON-YYYY'));

INSERT INTO TRAIN VALUES
        (107, 'TRUE', TO_DATE('07-FEB-2018', 'DD-MON-YYYY'));

INSERT INTO TRAIN VALUES
        (108, 'FALSE', TO_DATE('07-DEC-2018', 'DD-MON-YYYY'));

INSERT INTO TRAIN VALUES
        (109, 'TRUE', TO_DATE('17-OCT-2017', 'DD-MON-YYYY'));


-- Create table CREW that contains information on each crew with their ID and which train they belonged to, assuming same crew remains together
-- Constraints used are: primary key, foreign key and NOT NULL

	CREATE TABLE CREW
	(TRAINID NUMBER(3), FOREIGN KEY (TRAINID) REFERENCES TRAIN(TRAINID), CREWID NUMBER(3)NOT NULL PRIMARY KEY);

--Insert values into tuples

INSERT INTO CREW VALUES
        (100, 100);

INSERT INTO CREW VALUES
        (101, 101);

INSERT INTO CREW VALUES
        (102, 102);

INSERT INTO CREW VALUES
        (103, 103);

INSERT INTO CREW VALUES
        (104, 104);

INSERT INTO CREW VALUES
        (105, 105);

INSERT INTO CREW VALUES
        (106, 106);

INSERT INTO CREW VALUES
        (107, 107);

INSERT INTO CREW VALUES
        (108, 108);

INSERT INTO CREW VALUES
        (109, 109);

-- Create table ROUTELENGTH with attributes related to each unique route with its own ID, different duration of travel and distance travelled
-- Constraints used are: primary key and NOT NULL
  
	CREATE TABLE ROUTELENGTH
	(ROUTEID NUMBER(2)NOT NULL PRIMARY KEY, DISTANCETRAVELLED NUMBER(4),DURATIONOFTRAVEL NUMBER(2));

--insert values into tuples

INSERT INTO ROUTELENGTH VALUES
        (1, 1200, 10);

INSERT INTO ROUTELENGTH VALUES
        (2, 1500, 12);

INSERT INTO ROUTELENGTH VALUES
        (3, 800, 6);

INSERT INTO ROUTELENGTH VALUES
        (4, 1100, 9);

INSERT INTO ROUTELENGTH VALUES
        (5, 700, 6);

INSERT INTO ROUTELENGTH VALUES
        (6, 2000, 30);

INSERT INTO ROUTELENGTH VALUES
        (7, 300, 6);

INSERT INTO ROUTELENGTH VALUES
        (8, 4000, 23);

INSERT INTO ROUTELENGTH VALUES
        (9, 750, 6);
INSERT INTO ROUTELENGTH VALUES
        (10, 700, 17);

--Create table TRAINROUTE which its attributes give information on which trains according to their IDs can take which routes based on their IDs.
-- Constraints used are: foreign key and NOT NULL

	CREATE TABLE TRAINROUTE
	(TRAINID NUMBER(3), FOREIGN KEY (TRAINID) REFERENCES TRAIN (TRAINID), ROUTEID NUMBER(2) NOT NULL);

INSERT INTO TRAINROUTE VALUES
        (100,1);

INSERT INTO TRAINROUTE VALUES
        (101, 2);

INSERT INTO TRAINROUTE VALUES
        (102, 3);

INSERT INTO TRAINROUTE VALUES
        (103, 4);

INSERT INTO TRAINROUTE VALUES
        (104, 4);

INSERT INTO TRAINROUTE VALUES
        (105, 5);

INSERT INTO TRAINROUTE VALUES
        (106, 6);

INSERT INTO TRAINROUTE VALUES
        (107, 8);

INSERT INTO TRAINROUTE VALUES
        (108, 9);

INSERT INTO TRAINROUTE VALUES
        (109, 10);

--Create table COUNTRY with its unique ID with an indication for each country the train station belongs to.
-- Constraints used are: primary keyand NOT NULL
	
	CREATE TABLE COUNTRY
        (COUNTRYID NUMBER(2) NOT NULL PRIMARY KEY, STATIONCOUNTRY VARCHAR(30));

--Insert values into tuples

INSERT INTO COUNTRY VALUES 		(1, 'GB');
INSERT INTO COUNTRY VALUES		(2, 'FRANCE');
INSERT INTO COUNTRY VALUES 		(3, 'GERMANY');
INSERT INTO COUNTRY VALUES 		(4, 'BELGIUM');
INSERT INTO COUNTRY VALUES 		(5, 'ITALY');
INSERT INTO COUNTRY VALUES 		(6, 'AUSTRIA');

--Create table CITY with attributes that give an ID unique to each city, indicating to a unqiue station city and which country it belongs to based on countryID
-- Constraints used are: primary key, foreign key and NOT NULL

	CREATE TABLE CITY
        (CITYID NUMBER(2) NOT NULL PRIMARY KEY, STATIONCITY VARCHAR(30), COUNTRYID NUMBER (2), FOREIGN KEY (COUNTRYID) REFERENCES COUNTRY(COUNTRYID));

--Insert values into tuples

INSERT INTO CITY VALUES 	(1, 'London', 1);
INSERT INTO CITY VALUES		(2, 'Manchester', 1);
INSERT INTO CITY VALUES		(3, 'Paris', 2);
INSERT INTO CITY VALUES		(4, 'Bordeaux', 2);
INSERT INTO CITY VALUES 	(5, 'Cologne', 3);
INSERT INTO CITY VALUES		(6, 'Berlin', 3);
INSERT INTO CITY VALUES 	(7, 'Brussels', 4);
INSERT INTO CITY VALUES 	(8, 'Rome', 5);
INSERT INTO CITY VALUES 	(9, 'Milan', 5);
INSERT INTO CITY VALUES 	(10, 'Vienna', 6);

-- Create table STATION with unique ID for each station with indication to the station name it belongs to and to which country it belongs to based on country's ID.
-- Constraints used are: primary key, foreign key and NOT NULL

	CREATE TABLE STATION
        (STATIONID NUMBER(2) NOT NULL PRIMARY KEY, STATIONNAME VARCHAR(50),COUNTRYID NUMBER(2), FOREIGN KEY (COUNTRYID) REFERENCES COUNTRY(COUNTRYID));

--Insert values into tuples

INSERT INTO STATION VALUES 	(1, 'London St Pancras', 1);
INSERT INTO STATION VALUES 	(2, 'London Stratford', 1);
INSERT INTO STATION VALUES	(3, 'Paris', 2);
INSERT INTO STATION VALUES 	(4, 'Cologne', 3);
INSERT INTO STATION VALUES	(5, 'Brussels', 4);
INSERT INTO STATION VALUES 	(6, 'Milan Main', 5);
INSERT INTO STATION VALUES 	(7, 'Vienna New', 6);
INSERT INTO STATION VALUES 	(8, 'Paris Old', 2);
INSERT INTO STATION VALUES 	(9, 'Berlin', 3);
INSERT INTO STATION VALUES 	(10, 'Rome', 5);

--Create table STATION_LIST which has attributes that show which stations are passed by which route, shown by its ID. The stop order value would show the order of stations the route takes, giving more information about the route taken.
-- Constraints used are: NOT NULL
	
	CREATE TABLE STATION_LIST
       (ROUTEID NUMBER(2) NOT NULL, STATIONID NUMBER(2) NOT NULL, STOPORDER NUMBER(1) NOT NULL);

--Insert values into tuples

INSERT INTO STATION_LIST VALUES	(1, 1, 0);
INSERT INTO STATION_LIST VALUES	(1, 2, 1);
INSERT INTO STATION_LIST VALUES	(1, 3, 2);
INSERT INTO STATION_LIST VALUES	(2, 3 , 0);
INSERT INTO STATION_LIST VALUES	(2, 5 , 1);
INSERT INTO STATION_LIST VALUES	(3, 1 , 0);
INSERT INTO STATION_LIST VALUES	(2, 3 , 1);
INSERT INTO STATION_LIST VALUES	(4, 2, 0);
INSERT INTO STATION_LIST VALUES	(4, 5, 1);
INSERT INTO STATION_LIST VALUES	(4, 4, 2);
INSERT INTO STATION_LIST VALUES	(5, 4, 0);
INSERT INTO STATION_LIST VALUES	(5, 4, 1);
INSERT INTO STATION_LIST VALUES	(6, 4, 0);
INSERT INTO STATION_LIST VALUES	(6, 5, 1);
INSERT INTO STATION_LIST VALUES	(7, 5, 0);
INSERT INTO STATION_LIST VALUES	(7, 3, 1);
INSERT INTO STATION_LIST VALUES	(7, 9, 2);
INSERT INTO STATION_LIST VALUES	(8, 7, 0);
INSERT INTO STATION_LIST VALUES	(8, 6, 1);
INSERT INTO STATION_LIST VALUES	(9, 5, 0);
INSERT INTO STATION_LIST VALUES	(9, 7, 1);
INSERT INTO STATION_LIST VALUES	(9, 3, 2);

--Create table CREWEMPLOYEES where its attributes give information on which unique employee with their unique ID, belongs to which crew based on crew ID
-- Constraints used are: primary key and NOT NULL

	CREATE TABLE CREWEMPLOYEES
        (CREWID NUMBER (3) NOT NULL, EMPLOYEEID NUMBER(3) NOT NULL PRIMARY KEY);

--Insert values into tuples

INSERT INTO CREWEMPLOYEES VALUES	(100,	600);
INSERT INTO CREWEMPLOYEES VALUES	(100,	601);
INSERT INTO CREWEMPLOYEES VALUES	(101,	602);
INSERT INTO CREWEMPLOYEES VALUES	(101,	603);
INSERT INTO CREWEMPLOYEES VALUES	(102,	604);
INSERT INTO CREWEMPLOYEES VALUES	(102,	605);
INSERT INTO CREWEMPLOYEES VALUES	(103,	606);
INSERT INTO CREWEMPLOYEES VALUES	(103,	607);
INSERT INTO CREWEMPLOYEES VALUES	(104,	608);
INSERT INTO CREWEMPLOYEES VALUES	(104,	609);
INSERT INTO CREWEMPLOYEES VALUES	(105,	610);
INSERT INTO CREWEMPLOYEES VALUES	(105,	611);
INSERT INTO CREWEMPLOYEES VALUES	(106,	612);
INSERT INTO CREWEMPLOYEES VALUES	(106,	613);
INSERT INTO CREWEMPLOYEES VALUES	(107,	614);
INSERT INTO CREWEMPLOYEES VALUES	(107,	615);
INSERT INTO CREWEMPLOYEES VALUES	(108,	616);
INSERT INTO CREWEMPLOYEES VALUES	(108,	617);
INSERT INTO CREWEMPLOYEES VALUES	(109,	618);
INSERT INTO CREWEMPLOYEES VALUES	(109,	619);
INSERT INTO CREWEMPLOYEES VALUES	(100,	620);
INSERT INTO CREWEMPLOYEES VALUES	(100,	621);
INSERT INTO CREWEMPLOYEES VALUES	(101,	622);
INSERT INTO CREWEMPLOYEES VALUES	(101,	623);
INSERT INTO CREWEMPLOYEES VALUES	(102,	624);
INSERT INTO CREWEMPLOYEES VALUES	(102,	625);
INSERT INTO CREWEMPLOYEES VALUES	(103,	626);
INSERT INTO CREWEMPLOYEES VALUES	(103,	627);
INSERT INTO CREWEMPLOYEES VALUES	(104,	628);
INSERT INTO CREWEMPLOYEES VALUES	(104,	629);
INSERT INTO CREWEMPLOYEES VALUES	(105,	630);
INSERT INTO CREWEMPLOYEES VALUES	(105,	631);
INSERT INTO CREWEMPLOYEES VALUES	(106,	632);
INSERT INTO CREWEMPLOYEES VALUES	(106,	633);
INSERT INTO CREWEMPLOYEES VALUES	(107,	634);
INSERT INTO CREWEMPLOYEES VALUES	(107,	635);
INSERT INTO CREWEMPLOYEES VALUES	(108,	636);
INSERT INTO CREWEMPLOYEES VALUES	(108,	637);
INSERT INTO CREWEMPLOYEES VALUES	(109,	638);
INSERT INTO CREWEMPLOYEES VALUES	(109,	639);
INSERT INTO CREWEMPLOYEES VALUES	(100,	640);
INSERT INTO CREWEMPLOYEES VALUES	(100,	641);
INSERT INTO CREWEMPLOYEES VALUES	(101,	642);
INSERT INTO CREWEMPLOYEES VALUES	(101,	643);
INSERT INTO CREWEMPLOYEES VALUES	(102,	644);
INSERT INTO CREWEMPLOYEES VALUES	(102,	645);
INSERT INTO CREWEMPLOYEES VALUES	(103,	646);
INSERT INTO CREWEMPLOYEES VALUES	(103,	647);
INSERT INTO CREWEMPLOYEES VALUES	(104,	648);
INSERT INTO CREWEMPLOYEES VALUES	(104,	649);
INSERT INTO CREWEMPLOYEES VALUES	(105,	650);
INSERT INTO CREWEMPLOYEES VALUES	(105,	651);
INSERT INTO CREWEMPLOYEES VALUES	(106,	652);
INSERT INTO CREWEMPLOYEES VALUES	(106,	653);
INSERT INTO CREWEMPLOYEES VALUES	(107,	654);
INSERT INTO CREWEMPLOYEES VALUES	(107,	655);
INSERT INTO CREWEMPLOYEES VALUES	(108,	656);
INSERT INTO CREWEMPLOYEES VALUES	(108,	657);
INSERT INTO CREWEMPLOYEES VALUES	(109,	658);
INSERT INTO CREWEMPLOYEES VALUES	(109,	659);
INSERT INTO CREWEMPLOYEES VALUES	(100,	660);
INSERT INTO CREWEMPLOYEES VALUES	(100,	661);
INSERT INTO CREWEMPLOYEES VALUES	(101,	662);
INSERT INTO CREWEMPLOYEES VALUES	(101,	663);
INSERT INTO CREWEMPLOYEES VALUES	(102,	664);
INSERT INTO CREWEMPLOYEES VALUES	(102,	665);
INSERT INTO CREWEMPLOYEES VALUES	(103,	666);
INSERT INTO CREWEMPLOYEES VALUES	(103,	667);
INSERT INTO CREWEMPLOYEES VALUES	(104,	668);
INSERT INTO CREWEMPLOYEES VALUES	(104,	669);
INSERT INTO CREWEMPLOYEES VALUES	(105,	670);
INSERT INTO CREWEMPLOYEES VALUES	(105,	671);
INSERT INTO CREWEMPLOYEES VALUES	(106,	672);
INSERT INTO CREWEMPLOYEES VALUES	(106,	673);
INSERT INTO CREWEMPLOYEES VALUES	(107,	674);
INSERT INTO CREWEMPLOYEES VALUES	(107,	675);
INSERT INTO CREWEMPLOYEES VALUES	(108,	676);
INSERT INTO CREWEMPLOYEES VALUES	(108,	677);
INSERT INTO CREWEMPLOYEES VALUES	(109,	678);
INSERT INTO CREWEMPLOYEES VALUES	(109,	679);
INSERT INTO CREWEMPLOYEES VALUES	(100,	680);
INSERT INTO CREWEMPLOYEES VALUES	(101,	681);
INSERT INTO CREWEMPLOYEES VALUES	(102,	682);
INSERT INTO CREWEMPLOYEES VALUES	(103,	683);
INSERT INTO CREWEMPLOYEES VALUES	(104,	684);
INSERT INTO CREWEMPLOYEES VALUES	(105,	685);
INSERT INTO CREWEMPLOYEES VALUES	(106,	686);
INSERT INTO CREWEMPLOYEES VALUES	(107,	687);
INSERT INTO CREWEMPLOYEES VALUES	(108,	688);
INSERT INTO CREWEMPLOYEES VALUES	(109,	689);


-- Create table CREWHEAD that gives information on which unique crew member is head of their crew, shown by unqiue ID for their employee ID and crew ID.
-- Constraints used are: foreign key and NOT NULL

	CREATE TABLE CREWHEAD
        (CREWID NUMBER(3), FOREIGN KEY (CREWID) REFERENCES CREW(CREWID), HEADOFCREWID NUMBER(3), FOREIGN KEY (HEADOFCREWID) REFERENCES CREWEMPLOYEES (EMPLOYEEID));

--Insert values into tuples

INSERT INTO CREWHEAD VALUES	(100, 600);
INSERT INTO CREWHEAD VALUES	(101, 602);
INSERT INTO CREWHEAD VALUES	(102, 604);
INSERT INTO CREWHEAD VALUES	(103, 606);
INSERT INTO CREWHEAD VALUES	(104, 608);
INSERT INTO CREWHEAD VALUES	(105, 610);
INSERT INTO CREWHEAD VALUES	(106, 612);
INSERT INTO CREWHEAD VALUES	(107, 614);
INSERT INTO CREWHEAD VALUES	(108, 616);
INSERT INTO CREWHEAD VALUES	(109, 618);

--Create table TRAINCREWROTA that gives information on which train a crew is assigned to based on Train ID and Crew ID
-- Constraints used are: foreign key and NOT NULL

	CREATE TABLE TRAINCREWROTA
	(TRAINID NUMBER(3), FOREIGN KEY (TRAINID) REFERENCES TRAIN(TRAINID), CREWID NUMBER(3), FOREIGN KEY (CREWID) REFERENCES CREW(CREWID));

--Insert values into tuples

INSERT INTO TRAINCREWROTA VALUES	(100,  100);
INSERT INTO TRAINCREWROTA VALUES	(101,  101);
INSERT INTO TRAINCREWROTA VALUES	(102,  102);
INSERT INTO TRAINCREWROTA VALUES	(103,  103);
INSERT INTO TRAINCREWROTA VALUES	(104,  104);
INSERT INTO TRAINCREWROTA VALUES	(105,  105);
INSERT INTO TRAINCREWROTA VALUES	(106,  106);
INSERT INTO TRAINCREWROTA VALUES	(107,  107);
INSERT INTO TRAINCREWROTA VALUES	(108,  108);
INSERT INTO TRAINCREWROTA VALUES	(109,  109);

--Create table DRIVERS that gives information which employee based on their unique ID is a driver and gives their name too.
-- Constraints used are: foreign key and NOT NULL

	CREATE TABLE DRIVERS 
	(DRIVERID NUMBER(3), FOREIGN KEY (DRIVERID) REFERENCES CREWEMPLOYEES(EMPLOYEEID), DRIVERNAME VARCHAR(40) NOT NULL);

--Insert values into tuples

INSERT INTO DRIVERS VALUES ( 600 , 'SAWYER' );
INSERT INTO DRIVERS VALUES ( 601 , 'JOHN' );
INSERT INTO DRIVERS VALUES ( 602 , 'JERRY' );
INSERT INTO DRIVERS VALUES ( 603 , 'SAM' );
INSERT INTO DRIVERS VALUES ( 604 , 'JAMES' );
INSERT INTO DRIVERS VALUES ( 605 , 'ALBERT' );
INSERT INTO DRIVERS VALUES ( 606 , 'RICK' );
INSERT INTO DRIVERS VALUES ( 607 , 'JAMES' );
INSERT INTO DRIVERS VALUES ( 608 , 'JERRY' );
INSERT INTO DRIVERS VALUES ( 609 , 'RICK' );
INSERT INTO DRIVERS VALUES ( 610 , 'SAM' );
INSERT INTO DRIVERS VALUES ( 611 , 'ALBERT' );
INSERT INTO DRIVERS VALUES ( 612 , 'TOM' );
INSERT INTO DRIVERS VALUES ( 613 , 'JOHN' );
INSERT INTO DRIVERS VALUES ( 614 , 'SAWYER' );
INSERT INTO DRIVERS VALUES ( 615 , 'LARRY' );
INSERT INTO DRIVERS VALUES ( 616 , 'ALDOUS' );
INSERT INTO DRIVERS VALUES ( 617 , 'TERRANCE' );
INSERT INTO DRIVERS VALUES ( 618 , 'TIMOTHY' );
INSERT INTO DRIVERS VALUES ( 619 , 'GUN' );


--Create table CONDUCTORS that gives information which employee based on their unique ID is a conductor and gives their name too.
-- Constraints used are: foreign key and NOT NULL

	CREATE TABLE CONDUCTORS 
	(CONDUCTORID NUMBER(3),FOREIGN KEY (CONDUCTORID) REFERENCES CREWEMPLOYEES(EMPLOYEEID), CONDUCTORNAME VARCHAR(40)NOT NULL);

--Insert values into tuples

INSERT INTO CONDUCTORS VALUES ( 620 , 'BRICK' );
INSERT INTO CONDUCTORS VALUES ( 621 , 'LEAF' );
INSERT INTO CONDUCTORS VALUES ( 622 , 'LAMP' );
INSERT INTO CONDUCTORS VALUES ( 623 , 'RANY' );
INSERT INTO CONDUCTORS VALUES ( 624 , 'BOOK' );
INSERT INTO CONDUCTORS VALUES ( 625 , 'CONNY' );
INSERT INTO CONDUCTORS VALUES ( 626 , 'HARRY' );
INSERT INTO CONDUCTORS VALUES ( 627 , 'PENN' );
INSERT INTO CONDUCTORS VALUES ( 628 , 'SMITH' );
INSERT INTO CONDUCTORS VALUES ( 629 , 'LORY' );
INSERT INTO CONDUCTORS VALUES ( 630 , 'FIELDS' );
INSERT INTO CONDUCTORS VALUES ( 631 , 'HARRY' );
INSERT INTO CONDUCTORS VALUES ( 632 , 'SOLA' );
INSERT INTO CONDUCTORS VALUES ( 633 , 'BRONCO' );
INSERT INTO CONDUCTORS VALUES ( 634 , 'JOHN' );
INSERT INTO CONDUCTORS VALUES ( 635 , 'RON' );
INSERT INTO CONDUCTORS VALUES ( 636 , 'JACK' );
INSERT INTO CONDUCTORS VALUES ( 637 , 'NELLY' );
INSERT INTO CONDUCTORS VALUES ( 638 , 'PARK' );
INSERT INTO CONDUCTORS VALUES ( 639 , 'SHELLY' );

	
--Create table SERVICEPEOPLE that gives information which employee based on their unique ID is a service person and gives their name too.
-- Constraints used are: foreign key and NOT NULL

	CREATE TABLE SERVICEPEOPLE 
	(SERVICEPERSONID NUMBER(3),FOREIGN KEY (SERVICEPERSONID) REFERENCES CREWEMPLOYEES(EMPLOYEEID), SERVICEPERSONNAME VARCHAR(40)NOT NULL);

--Insert values into tuples

INSERT INTO SERVICEPEOPLE VALUES ( 640 , 'JACK' );
INSERT INTO SERVICEPEOPLE VALUES ( 641 , 'JACE' );
INSERT INTO SERVICEPEOPLE VALUES ( 642 , 'JILL' );
INSERT INTO SERVICEPEOPLE VALUES ( 643 , 'JARRY' );
INSERT INTO SERVICEPEOPLE VALUES ( 644 , 'JADE' );
INSERT INTO SERVICEPEOPLE VALUES ( 645 , 'JAE' );
INSERT INTO SERVICEPEOPLE VALUES ( 645 , 'ANT' );
INSERT INTO SERVICEPEOPLE VALUES ( 646 , 'ULL' );
INSERT INTO SERVICEPEOPLE VALUES ( 647 , 'BJORK' );
INSERT INTO SERVICEPEOPLE VALUES ( 648 , 'LEMON' );
INSERT INTO SERVICEPEOPLE VALUES ( 649 , 'RAMSEY' );
INSERT INTO SERVICEPEOPLE VALUES ( 650 , 'JAE' );
INSERT INTO SERVICEPEOPLE VALUES ( 651 , 'JACE' );
INSERT INTO SERVICEPEOPLE VALUES ( 652 , 'ALBERT' );
INSERT INTO SERVICEPEOPLE VALUES ( 653 , 'HILL' );
INSERT INTO SERVICEPEOPLE VALUES ( 654 , 'ROB' );
INSERT INTO SERVICEPEOPLE VALUES ( 655 , 'JAIME' );
INSERT INTO SERVICEPEOPLE VALUES ( 656 , 'JACOB' );
INSERT INTO SERVICEPEOPLE VALUES ( 657 , 'TOM' );
INSERT INTO SERVICEPEOPLE VALUES ( 658 , 'FRED' );
INSERT INTO SERVICEPEOPLE VALUES ( 659 , 'HENRY' );


--Create table SECURITY that gives information which employee based on their unique ID is a secuirty and gives their name too.
-- Constraints used are: foreign key and NOT NULL

	CREATE TABLE SECURITY 
	(SECURITYID NUMBER(3),FOREIGN KEY (SECURITYID) REFERENCES CREWEMPLOYEES(EMPLOYEEID), SECURITYNAME VARCHAR(40)NOT NULL);

--Insert values into tuples

INSERT INTO SECURITY VALUES ( 660 , 'BART' );
INSERT INTO SECURITY VALUES ( 661 , 'ARTHUR' );
INSERT INTO SECURITY VALUES ( 662 , 'JAMES' );
INSERT INTO SECURITY VALUES ( 663 , 'ROB' );
INSERT INTO SECURITY VALUES ( 664 , 'JILL' );
INSERT INTO SECURITY VALUES ( 665 , 'TOM' );
INSERT INTO SECURITY VALUES ( 666 , 'ANNA' );
INSERT INTO SECURITY VALUES ( 667 , 'JOSH' );
INSERT INTO SECURITY VALUES ( 668 , 'JAMES' );
INSERT INTO SECURITY VALUES ( 669 , 'RICKY' );
INSERT INTO SECURITY VALUES ( 670 , 'RACHEL' );
INSERT INTO SECURITY VALUES ( 671 , 'NILS' );
INSERT INTO SECURITY VALUES ( 672 , 'DHRA' );
INSERT INTO SECURITY VALUES ( 673 , 'ISHAWN' );
INSERT INTO SECURITY VALUES ( 674 , 'BERT' );
INSERT INTO SECURITY VALUES ( 675 , 'DAN' );
INSERT INTO SECURITY VALUES ( 676 , 'ROWAN' );
INSERT INTO SECURITY VALUES ( 677 , 'NILLS' );
INSERT INTO SECURITY VALUES ( 678 , 'DAVID' );
INSERT INTO SECURITY VALUES ( 679 , 'PABLO' );

--Create table MANAGEMENT_&_SALES that gives information which employee based on their unique ID is in management and sales department and gives their name too.
-- Constraints used are: foreign key and NOT NULL

	CREATE TABLE MANAGEMENT_AND_SALES
	(MSID NUMBER(3),FOREIGN KEY (MSID) REFERENCES CREWEMPLOYEES(EMPLOYEEID), MSNAME VARCHAR(40) NOT NULL);

--Insert values into tuples

INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 680 , 'HEBA' );
INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 681 , 'ARCH' );
INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 682 , 'DUNPHY' );
INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 683 , 'POTTER' );
INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 684 , 'CARRY' );
INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 685 , 'MOE' );
INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 686 , 'JOHN' );
INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 687 , 'FROG' );
INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 688 , 'HERB' );
INSERT INTO  MANAGEMENT_AND_SALES VALUES ( 689 , 'DOUG' );


--Create table TRIPINFO and their attributes give information on which trip takes which route based on their IDs which are unique and what date the trips occur.
-- Constraints used are: primary key, foreign key and NOT NULL

	CREATE TABLE TRIPINFO
	(TRIPID NUMBER(3) NOT NULL PRIMARY KEY, ROUTEID NUMBER(2), FOREIGN KEY (ROUTEID) REFERENCES ROUTELENGTH(ROUTEID), DATEOFTRIP DATE);

--Insert values into tuples

INSERT INTO TRIPINFO VALUES (300, 1, TO_DATE('30-JAN-2020', 'DD-MM-YYYY'));
INSERT INTO TRIPINFO VALUES (301, 2, TO_DATE('31-JAN-2020', 'DD-MM-YYYY'));
INSERT INTO TRIPINFO VALUES (302, 3, TO_DATE('1-FEB-2020', 'DD-MM-YYYY'));
INSERT INTO TRIPINFO VALUES (303, 4, TO_DATE('2-FEB-2020', 'DD-MM-YYYY'));
INSERT INTO TRIPINFO VALUES (304, 5, TO_DATE('3-FEB-2020', 'DD-MM-YYYY'));
INSERT INTO TRIPINFO VALUES (305, 6, TO_DATE('4-FEB-2020', 'DD-MM-YYYY'));
INSERT INTO TRIPINFO VALUES (306, 7, TO_DATE('5-FEB-2020', 'DD-MM-YYYY'));
INSERT INTO TRIPINFO VALUES (307, 8, TO_DATE('6-FEB-2020', 'DD-MM-YYYY'));
INSERT INTO TRIPINFO VALUES (308, 9, TO_DATE('7-FEB-2020', 'DD-MM-YYYY'));
INSERT INTO TRIPINFO VALUES (309, 10, TO_DATE('8-FEB-2020', 'DD-MM-YYYY'));


--Create table PASSENGERDETAILS, which its attributes give information on the passengers ticket number and which trip it belongs to. The attributes also give information on their names and the type of passenger they are.
-- Constraints used are: primary key and NOT NULL

	CREATE TABLE PASSENGERDETAILS
	(TRIPID NUMBER(3), PASSENGERTICKETNO NUMBER(10) NOT NULL PRIMARY KEY, PASSENGERTYPE VARCHAR(30), PASSENGERNAME VARCHAR(30) NOT NULL);

--Insert values into tuples

INSERT INTO PASSENGERDETAILS VALUES ( 300 , 756333 , 'STUDENT', 'BELLA' );
INSERT INTO PASSENGERDETAILS VALUES ( 300 , 756334 , 'NORMAL', 'EDWARD' );
INSERT INTO PASSENGERDETAILS VALUES ( 300 , 756335 , 'SENIOR', 'CHARLIE' );
INSERT INTO PASSENGERDETAILS VALUES ( 301 , 756336 , 'STUDENT', 'DOUG' );
INSERT INTO PASSENGERDETAILS VALUES ( 301 , 756337 , 'NORMAL', 'PHILL' );
INSERT INTO PASSENGERDETAILS VALUES ( 301 , 756338 , 'SENIOR', 'SAM' );
INSERT INTO PASSENGERDETAILS VALUES ( 302 , 756339 , 'STUDENT', 'HAILEY' );
INSERT INTO PASSENGERDETAILS VALUES ( 302 , 756340 , 'NORMAL', 'MONICA' );
INSERT INTO PASSENGERDETAILS VALUES ( 302 , 756341 , 'SENIOR', 'CHANDLER' );
INSERT INTO PASSENGERDETAILS VALUES ( 302 , 756342 , 'STUDENT', 'PHOEBE' );
INSERT INTO PASSENGERDETAILS VALUES ( 303 , 756343 , 'NORMAL', 'JESSICA' );
INSERT INTO PASSENGERDETAILS VALUES ( 303 , 756344 , 'SENIOR', 'ROSS' );
INSERT INTO PASSENGERDETAILS VALUES ( 304 , 756345 , 'NORMAL', 'JOEY' );
INSERT INTO PASSENGERDETAILS VALUES ( 304 , 756346 , 'NORMAL', 'MIKE' );
INSERT INTO PASSENGERDETAILS VALUES ( 304 , 756347 , 'SENIOR', 'HARVEY' );
INSERT INTO PASSENGERDETAILS VALUES ( 305 , 756348 , 'STUDENT', 'DONNA' );
INSERT INTO PASSENGERDETAILS VALUES ( 305 , 756349 , 'NORMAL', 'LITT' );
INSERT INTO PASSENGERDETAILS VALUES ( 305 , 756350 , 'STUDENT', 'LOUIS' );
INSERT INTO PASSENGERDETAILS VALUES ( 306 , 756351 , 'STUDENT', 'HALL' );
INSERT INTO PASSENGERDETAILS VALUES ( 306 , 756352 , 'NORMAL', 'ROBERT' );
INSERT INTO PASSENGERDETAILS VALUES ( 307 , 756353 , 'SENIOR', 'TIMOTHY' );
INSERT INTO PASSENGERDETAILS VALUES ( 308 , 756354 , 'SENIOR', 'JENNA' );
INSERT INTO PASSENGERDETAILS VALUES ( 308 , 756355 , 'NORMAL', 'TERESA' );
INSERT INTO PASSENGERDETAILS VALUES ( 309 , 756356 , 'SENIOR', 'MARY' );
INSERT INTO PASSENGERDETAILS VALUES ( 309 , 756357 , 'STUDENT', 'SELMA' );
INSERT INTO PASSENGERDETAILS VALUES ( 309 , 756358 , 'NORMAL', 'JIM' );
INSERT INTO PASSENGERDETAILS VALUES ( 309 , 756359 , 'SENIOR', 'JEAN' );

-----------------------------------BASIC QUERIES--------------------------------------

--Show names of conductors and train model dates, that have route length larger than 700 km and duration of travel smaller than 10 hours
--get routes with distances over 700 km and under 10 hours
--get the train IDs that belong to these routes
--get conductor IDs which operate these routes

SELECT c.CONDUCTORNAME, t.TRAINMODELDATE
FROM CONDUCTORS c, TRAIN t, ROUTELENGTH rl, TRAINROUTE tr, CREW cr, CREWEMPLOYEES ce
WHERE rl.DISTANCETRAVELLED > 700 AND rl.DURATIONOFTRAVEL < 10 
AND rl.ROUTEID = tr.ROUTEID AND tr.TRAINID = t.TRAINID AND t.TRAINID = cr.TRAINID
AND cr.CREWID = ce.CREWID AND ce.EMPLOYEEID = c.CONDUCTORID;

--expected outcome:
/*

CONDUCTORNAME	TRAINMODELDATE
BOOK	        27-JAN-15
CONNY	        27-JAN-15
HARRY	        07-DEC-19
PENN	        07-DEC-19
SMITH	        07-FEB-12
LORY	        07-FEB-12
JACK	        07-DEC-18
NELLY	        07-DEC-18

*/

--Show number of students who took a trip starting in London St Pancras or London Stratford
--get trip IDs of trips where students were present
--get station IDs of the routes the students took
--get the first stop of each of these routes
--the stops can be either one of these

SELECT COUNT(*)
FROM PASSENGERDETAILS pd, TRIPINFO ti, STATION_LIST sl, STATION s
WHERE pd.PASSENGERTYPE = 'STUDENT' AND pd.TRIPID = ti.TRIPID
AND ti.ROUTEID = sl.ROUTEID AND sl.STATIONID = s.STATIONID
AND sl.STOPORDER = 0
AND s.STATIONNAME = ANY('London St Pancras', 'London Stratford');
 
-- expected output:
/*
    COUNT(*)
    3
*/    

-----------------------------------MEDIUM QUERIES--------------------------------------


--Show the name of the first stop of every train route
--get IDs of stations which are the first stops
--group the stations by their route IDs and station names
--order ascending by the route IDs

SELECT sl.ROUTEID, s.STATIONNAME
FROM STATION s, STATION_LIST sl
WHERE s.STATIONID = sl.STATIONID AND sl.STOPORDER = 0
GROUP BY sl.ROUTEID, s.STATIONNAME
ORDER BY sl.ROUTEID ASC;

-- expected output:
/*

    ROUTEID 	STATIONNAME
    1	        London St Pancras
    2	        Paris
    3	        London St Pancras
    4	        London Stratford
    5	        Cologne
    6	        Cologne
    7	        Brussels
    8	        Vienna New
    9       	Brussels
*/

--Show difference between average duration of travel of routes having more and less than 1000 kilometers
--create two representations of the same table, r1 and r2
--get specific routes which are over and under 1000 km

SELECT (AVG(r1.DURATIONOFTRAVEL)-AVG(r2.DURATIONOFTRAVEL)) as DifferenceBetweenAverages
FROM ROUTELENGTH r1, ROUTELENGTH r2
WHERE r1.DISTANCETRAVELLED > 1000 AND r2.DISTANCETRAVELLED < 1000;

-- expected output 
/*
    DIFFERENCEBETWEENAVERAGES
    8.6
*/

--Show all head of crews whose names contain O, order by the length of route their train takes in descending order
--get drivers who are head of crew and their name contains O
--get the crew ID of these drivers
--get the train routes these crew ID are operating

SELECT d.DRIVERNAME, rl.DISTANCETRAVELLED
FROM DRIVERS d, CREWHEAD c, CREWEMPLOYEES ce, CREW cr, TRAINROUTE tr, ROUTELENGTH rl
WHERE c.HEADOFCREWID = d.DRIVERID AND d.DRIVERNAME LIKE '%O%'
AND d.DRIVERID = ce.EMPLOYEEID AND ce.CREWID = cr.CREWID
AND cr.TRAINID = tr.TRAINID AND tr.ROUTEID = rl.ROUTEID
ORDER BY rl.DISTANCETRAVELLED DESC;

-- expected output
/*

    DRIVERNAME	DISTANCETRAVELLED
    TOM	            2000
    ALDOUS	        750
    TIMOTHY	        700

*/

--Show all head of crews whose names contain O, order by the length of route their train takes in descending order
SELECT d.DRIVERNAME, rl.DISTANCETRAVELLED
FROM DRIVERS d, CREWHEAD c, CREWEMPLOYEES ce, CREW cr, TRAINROUTE tr, ROUTELENGTH rl

--get drivers who are head of crew and their name contains O
WHERE c.HEADOFCREWID = d.DRIVERID AND d.DRIVERNAME LIKE '%O%'

--get the crew ID of these drivers
AND d.DRIVERID = ce.EMPLOYEEID AND ce.CREWID = cr.CREWID

--get the train routes these crew ID are operating
AND cr.TRAINID = tr.TRAINID AND tr.ROUTEID = rl.ROUTEID
ORDER BY rl.DISTANCETRAVELLED DESC;

--expected output 
/*  DRIVERNAME	DISTANCETRAVELLED
    TOM	            2000
    ALDOUS	        750
    TIMOTHY	        700
*/

-----------------------------------ADVANCED QUERIES--------------------------------------

-- 1. Where the train number is 109, find the names, ticket numbers, and tripId of passengers on that train:
-- This is an advanced query because it uses subqueries to find the routeID from one table, then passes that information to be used in another table through a second subquery, after which the original query can be computed.

SELECT DISTINCT t.trainId, p.tripId, p.passengerName, p.PASSENGERTICKETNO FROM PassengerDetails p, TrainRoute t WHERE t.trainId=109 and p.tripId = (SELECT tripId FROM TripInfo WHERE routeId = (SELECT routeID FROM TrainRoute WHERE trainId = 109));


-- 2. Where the train number is 109, use a query to count and display the total number of crewmembers train 109:
-- This is an advanced query because it uses an aggregate function (count) and a subquery to find and display the number of crew members working on a specific train.

SELECT count(crewId) as "Total Crew Members" FROM CREWEMPLOYEES HAVING crewId = (SELECT crewId FROM TRAINCREWROTA WHERE trainId = 109) group by crewID;


-- 3. Create a view showing all stations which pass through the country GB. Use the view to show details of these stations.
-- This is an advanced query that creates and uses views and subqueries to find and display stations that pass through a specific country.

CREATE view stations_in_GB AS SELECT stationName, stationID FROM Station WHERE countryId IN (SELECT CountryId FROM Country WHERE stationcountry = 'GB');
SELECT * FROM stations_in_GB;

-------------------------------OUTPUT FOR ADVANCED QUERIES------------------------------

-- Query 1:

-- TRAINID	TRIPID	PASSENGERNAME	PASSENGERTICKETNO
-- 109		309	SELMA		756357
-- 109		309	MARY		756356
-- 109		309	JIM		756358
-- 109		309	JEAN		756359

-- Query 2:

-- Total Crew Members
-- 9

-- Query 3:

-- STATIONID	STATIONNAME	
-- 1		London St Pancras	
-- 2		London Stratford	


----------------------------------------END OF SECTION---------------------------------

