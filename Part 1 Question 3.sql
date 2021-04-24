CREATE DATABASE IF NOT EXISTS `ALUSystem`;
USE `ALUSystem`;

CREATE TABLE `attendance` (
  `AttendanceID` int(11) NOT NULL,
  `UnitID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `Date` varchar(45) DEFAULT NULL,
  `Attendance` varchar(2) DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AttendanceID`),
  KEY `FK_Att_Unit_idx` (`UnitID`),
  KEY `FK_Att_Student_idx` (`StudentID`),
  CONSTRAINT `FK_Att_Student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`studentid`),
  CONSTRAINT `FK_Att_Unit` FOREIGN KEY (`UnitID`) REFERENCES `courseunit` (`unitid`)
) 

INSERT INTO `attendance` VALUES (613,50008,1013,'9-Oct-18','P',''),(614,50008,1014,'9-Oct-18','P',''),(615,50008,1015,'9-Oct-18','U',''),(616,50008,1016,'9-Oct-18','L',''),(617,50008,1017,'9-Oct-18','L',''),(618,50008,1018,'9-Oct-18','P',''),(619,50014,1019,'9-Oct-18','P',''),(620,50014,1020,'9-Oct-18','E','Attended a conference'),(621,50014,1021,'9-Oct-18','P',''),(622,50014,1022,'9-Oct-18','P',''),(623,50014,1023,'9-Oct-18','P',''),(624,50014,1024,'9-Oct-18','P',''),(625,50010,1025,'9-Oct-18','L',''),(626,50010,1026,'9-Oct-18','P',''),(627,50010,1027,'9-Oct-18','U',''),(628,50010,1028,'9-Oct-18','P',''),(629,50010,1029,'9-Oct-18','P',''),(630,50010,1030,'9-Oct-18','P',''),(631,50003,1001,'10-Oct-18','P',''),(632,50003,1002,'10-Oct-18','P',''),(633,50003,1003,'10-Oct-18','P',''),(634,50003,1004,'10-Oct-18','P',''),(635,50003,1005,'10-Oct-18','P',''),(636,50003,1006,'10-Oct-18','P',''),(637,50003,1007,'10-Oct-18','P',''),(638,50003,1008,'10-Oct-18','P',''),(639,50003,1009,'10-Oct-18','L',''),(640,50003,1010,'10-Oct-18','P',''),(641,50005,1011,'10-Oct-18','P',''),(642,50005,1012,'10-Oct-18','L',''),(643,50005,1013,'10-Oct-18','P',''),(644,50005,1014,'10-Oct-18','P',''),(645,50005,1015,'10-Oct-18','U',''),(646,50005,1016,'10-Oct-18','P',''),(647,50005,1017,'10-Oct-18','P',''),(648,50005,1018,'10-Oct-18','P',''),(649,50013,1019,'10-Oct-18','P',''),(650,50013,1020,'10-Oct-18','E','Attended a conference'),(651,50013,1021,'10-Oct-18','P',''),(652,50013,1022,'10-Oct-18','P',''),(653,50013,1023,'10-Oct-18','P',''),(654,50013,1024,'10-Oct-18','P',''),(655,50012,1025,'10-Oct-18','L',''),(656,50012,1026,'10-Oct-18','L',''),(657,50012,1027,'10-Oct-18','L',''),(658,50012,1028,'10-Oct-18','P',''),(659,50012,1029,'10-Oct-18','P',''),(660,50012,1030,'10-Oct-18','P','');

CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) 

INSERT INTO `course` VALUES (20001,'Computer Science'),(20002,'Global Challenges'),(20003,'International Business and Trade'),(20004,'Entrepreneurship');


CREATE TABLE `courseunit` (
  `UnitID` int(11) NOT NULL,
  `UnitName` varchar(45) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `FacilitatorID` int(11) NOT NULL,
  PRIMARY KEY (`UnitID`),
  KEY `FK_Unit_Course_idx` (`CourseID`),
  KEY `FK_Unit_Facilitator_idx` (`FacilitatorID`),
  CONSTRAINT `FK_Unit_Course` FOREIGN KEY (`CourseID`) REFERENCES `course` (`courseid`),
  CONSTRAINT `FK_Unit_Facilitator` FOREIGN KEY (`FacilitatorID`) REFERENCES `facilitators` (`FacilitatorID`)
) 

INSERT INTO `courseunit` VALUES (50001,'Discrete Maths',20001,4001),(50002,'Foundational Maths',20001,4007),(50003,'Database Systems',20001,4011),(50004,'Programming I',20001,4002),(50005,'Business Analytics',20003,4005),(50006,'Business Communication',20003,4010),(50007,'Human Resource Management',20003,4009),(50008,'Microeconomics',20003,4015),(50009,'Introduction to Global Challenges',20002,4006),(50010,'Research',20002,4004),(50011,'Project Management',20002,4003),(50012,'Plan Your Mission',20002,4014),(50013,'Intoduction to Ventures',20004,4008),(50014,'Ventures Lab',20004,4012);


CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `DepartmentHead` int(11) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `FK_Dept__idx` (`DepartmentHead`),
  KEY `FK_Dept_Facilitator_idx` (`DepartmentHead`),
  CONSTRAINT `FK_Dept_Facilitator` FOREIGN KEY (`DepartmentHead`) REFERENCES `facilitators` (`FacilitatorID`)
) 

INSERT INTO `department` VALUES (300000,'Registrar',4014),(300001,'Faculty',4008);


CREATE TABLE `event` (
  `EventID` int(11) NOT NULL,
  `EventName` varchar(45) NOT NULL,
  `Date` varchar(25) DEFAULT NULL,
  `Venue` varchar(80) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `EventOrganiser` int(11) NOT NULL,
  PRIMARY KEY (`EventID`),
  KEY `FK_idx` (`EventOrganiser`),
  CONSTRAINT `FK_Event_Facilitator` FOREIGN KEY (`EventOrganiser`) REFERENCES `facilitators` (`FacilitatorID`)
) 
INSERT INTO `event` VALUES (7001,' Day of Silence','14-Oct-18','Kenya','Optional',4021),(7002,' Elevator Pitch Session','19-Oct-18','Zimbabwe','Optional',4020),(7003,'Assembly','29-Oct-18','Open Space','Complusory',4022),(7004,' Deloitte Case Challenge','1-Nov-18','Botwswana','Optional',4018),(7005,' Resume Review','5-Nov-18','Open Space','Complusory',4020),(7006,' Interview with Amory Lovins','10-Nov-18','Morocco','Optional',4019);


CREATE TABLE `event_attendance` (
  `EventAttID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `Attendance` varchar(45) NOT NULL,
  `Date` varchar(45) DEFAULT NULL,
  `Reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EventAttID`),
  KEY `FK_GA_Student_idx` (`StudentID`),
  KEY `FK_GA_Event_idx` (`EventID`),
  CONSTRAINT `FK_GA_Event` FOREIGN KEY (`EventID`) REFERENCES `event` (`eventid`),
  CONSTRAINT `FK_GA_Student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`studentid`)
) 

INSERT INTO `event_attendance` VALUES (818,1018,7001,'U','14-Oct-18',''),(819,1019,7001,'P','14-Oct-18',''),(820,1020,7001,'U','14-Oct-18',''),(821,1021,7001,'P','14-Oct-18',''),(822,1022,7001,'L','14-Oct-18',''),(823,1023,7001,'P','14-Oct-18',''),(824,1024,7001,'L','14-Oct-18',''),(825,1025,7001,'U','14-Oct-18',''),(826,1026,7001,'U','14-Oct-18',''),(827,1027,7001,'U','14-Oct-18',''),(828,1028,7001,'L','14-Oct-18',''),(829,1029,7001,'U','14-Oct-18',''),(830,1030,7001,'P','14-Oct-18',''),(831,1001,7005,'P','5-Nov-18',''),(832,1002,7005,'U','5-Nov-18',''),(833,1003,7005,'P','5-Nov-18',''),(834,1004,7005,'P','5-Nov-18',''),(835,1005,7005,'U','5-Nov-18',''),(836,1006,7005,'P','5-Nov-18',''),(837,1007,7005,'P','5-Nov-18',''),(838,1008,7005,'P','5-Nov-18',''),(839,1009,7005,'P','5-Nov-18',''),(840,1010,7005,'P','5-Nov-18',''),(841,1011,7005,'P','5-Nov-18',''),(842,1012,7005,'U','5-Nov-18',''),(843,1013,7005,'P','5-Nov-18',''),(844,1014,7005,'P','5-Nov-18',''),(845,1015,7005,'L','5-Nov-18',''),(846,1016,7005,'P','5-Nov-18',''),(847,1017,7005,'U','5-Nov-18',''),(848,1018,7005,'U','5-Nov-18',''),(849,1019,7005,'L','5-Nov-18',''),(850,1020,7005,'P','5-Nov-18',''),(851,1021,7005,'P','5-Nov-18',''),(852,1022,7005,'P','5-Nov-18',''),(853,1023,7005,'P','5-Nov-18',''),(854,1024,7005,'E','5-Nov-18','Attended a conference'),(855,1025,7005,'P','5-Nov-18',''),(856,1026,7005,'P','5-Nov-18',''),(857,1027,7005,'U','5-Nov-18',''),(858,1028,7005,'P','5-Nov-18',''),(859,1029,7005,'P','5-Nov-18',''),(860,1030,7005,'P','5-Nov-18','');


CREATE TABLE `facilitators` (
  `FacilitatorID` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  `EmailAddress` varchar(45) NOT NULL,
  `Access` varchar(45) DEFAULT NULL,
  `DepartmentID` int(11) NOT NULL,
  PRIMARY KEY (`FacilitatorID`),
  KEY `FK_Facilitator_Dept_idx` (`DepartmentID`),
  CONSTRAINT `FK_Facilitator_Dept` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`departmentid`)
) 

INSERT INTO `facilitators` VALUES (4008,' Mubariz',' Shariff','M',' mubarizs@andrew.cmu.edu','D',300001),(4009,' Natalie',' Gil','F',' ngil@andrew.cmu.edu','C',300001),(4010,' Nidhi',' Jain','F',' nidhi@cmu.edu','C',300001),(4011,' Nolan',' Leavitt','F',' nleavitt@andrew.cmu.edu','C',300001),(4012,' Nicole',' Van Maanen','M',' nvanmaan@andrew.cmu.edu','C',300001),(4013,' Jessica',' Obergas','M',' jobergas@andrew.cmu.edu','C',300001),(4014,' Pooja',' Bandu','F',' pbandu@andrew.cmu.edu','A',300000),(4015,' Paritosh',' Bansal','M',' pbansal@andrew.cmu.edu','C',300001),(4016,' Philip',' Burdette','F',' pfb@andrew.cmu.edu','C',300001),(4017,'Julie','Blackwood','F','jblackwood@andrew.cmu.edu','D',300001),(4018,'Charles','Brummit','M','charlie@cmu.edu','E',300001),(4019,'Brandon','Crain','M','bncrain@andrew.cmu.edu','D',300001),(4020,'Adam','Dobrin','M','adamdob@cmu.edu','E',300001),(4021,'Claire','Ericksen','F','erickson@cmu.edu','E',300001),(4022,'Linda','Grecki','F','lgrecki@andrew.cmu.edu','D',300001);


CREATE TABLE `grades` (
  `RegUnitID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `UnitID` int(11) NOT NULL,
  `Grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RegUnitID`),
  KEY `FK_RU_Student_idx` (`StudentID`),
  KEY `FK_RU_Unit_idx` (`UnitID`),
  CONSTRAINT `FK_RU_Student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`studentid`),
  CONSTRAINT `FK_RU_Unit` FOREIGN KEY (`UnitID`) REFERENCES `courseunit` (`unitid`)
) 

INSERT INTO `grades` VALUES (90029,1029,50010,'B'),(90030,1030,50010,'B'),(90031,1001,50003,'B'),(90032,1002,50003,'C'),(90033,1003,50003,'B'),(90034,1004,50003,'A'),(90035,1005,50003,'B'),(90036,1006,50003,'A'),(90037,1007,50003,'B'),(90038,1008,50003,'B'),(90039,1009,50003,'D'),(90040,1010,50003,'C'),(90041,1011,50005,'E'),(90042,1012,50005,'D'),(90043,1013,50005,'B'),(90044,1014,50005,'A'),(90045,1015,50005,'B'),(90046,1016,50005,'D'),(90047,1017,50005,'A'),(90048,1018,50005,'C'),(90049,1019,50013,'E'),(90050,1020,50013,'A'),(90051,1021,50013,'D'),(90052,1022,50013,'B'),(90053,1023,50013,'E'),(90054,1024,50013,'C'),(90055,1025,50012,'C'),(90056,1026,50012,'E'),(90057,1027,50012,'E'),(90058,1028,50012,'A'),(90059,1029,50012,'D'),(90060,1030,50012,'B');


CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `EmailAddress` varchar(80) NOT NULL,
  `D.O.B` varchar(25) NOT NULL,
  `Age` int(2) NOT NULL,
  `Sex` varchar(1) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Cohort` varchar(45) NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `FK_Student_Course_idx` (`CourseID`),
  CONSTRAINT `FK_Student_Course` FOREIGN KEY (`CourseID`) REFERENCES `course` (`courseid`)
) 

INSERT INTO `student` VALUES (1011,' Bryan',' Oh',' boh@andrew.cmu.edu',' 27-OCT-2015',21,'M',20003,'1'),(1012,' Brittany',' Pipes',' bpipes@andrew.cmu.edu',' 12-DEC-2014',20,'M',20003,'1'),(1013,' Christopher',' Algieri',' caalgieri@andrew.cmu.edu',' 27-OCT-2015',20,'M',20003,'1'),(1014,' Creed',' Erickson',' erickson@cmu.edu',' 15-APR-2007',23,'F',20003,'1'),(1015,' Chinmay',' Bijwe',' cbijwe@andrew.cmu.edu',' 15-APR-2014',23,'F',20003,'2'),(1016,' Charles',' Brummitt',' charlie@cmu.edu',' 06-Nov-2012',22,'F',20003,'2'),(1017,' Corinne',' Neal',' cneal@andrew.cmu.edu',' 13-APR-2015',19,'F',20003,'2'),(1018,' Chetan',' Shetty',' cshetty@andrew.cmu.edu',' 15-APR-2011',17,'M',20003,'2'),(1019,' Adam',' Dobrin',' adamdob@cmu.edu',' 20-APR-2012',18,'M',20004,'1'),(1020,' Scott',' Fullman',' fullman@andrew.cmu.edu',' 13-SEP-2012',17,'M',20004,'1'),(1021,' Leigh',' Halverson',' lhalvers@andrew.cmu.edu',' 25-SEP-2013',16,'F',20004,'1'),(1022,' Thomas',' Hunt',' hunttw@andrew.cmu.edu',' 01-OCT-2014',18,'M',20004,'2'),(1023,' Julie',' Blackwood',' jblackwood@andrew.cmu.edu',' 07-OCT-2015',19,'F',20004,'2'),(1024,' Jon',' Glick',' jonglick@cmu.edu',' 27-OCT-2015',20,'M',20004,'2'),(1025,' Joohee',' Hong',' jhong@andrew.cmu.edu',' 12-DEC-2014',21,'M',20002,'1'),(1026,' Jenna',' Knapp',' jknapp@andrew.cmu.edu',' 27-OCT-2015',20,'M',20002,'1'),(1027,' Jason',' Barnett',' jmbarnett@andrew.cmu.edu',' 15-APR-2016',22,'F',20002,'1'),(1028,' Jia',' Yin',' jyin@andrew.cmu.edu',' 22-OCT-2015',24,'F',20002,'2'),(1029,' Karen',' Mesko',' kmesko@andrew.cmu.edu',' 25-SEP-2013',21,'M',20002,'2'),(1030,' Luke',' Grecki',' lgrecki@andrew.cmu.edu',' 20-APR-2012',20,'M',20002,'2');

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminMain';
GRANT ALL PRIVILEGES ON * . * TO 'adminMain'@'localhost';

CREATE USER 'user1'@'localhost' IDENTIFIED BY 'userOne';
GRANT INSERT, SELECT, UPDATE ON * . * TO 'userOne'@'localhost';
 
CREATE USER 'registrar'@'localhost' IDENTIFIED BY 'registrarMain';
GRANT ALL PRIVILEGES ON ALUSystem.grades TO 'registrarMain'@'localhost';

CREATE USER 'newUser'@'localhost' IDENTIFIED BY 'newUser';
GRANT ALL DELETE, INSERT, UPDATE ON ALUSystem.grades TO 'newUser'@'localhost';

[GRANT PERMISSION TO DIFFERENT TABLES AND USE DIFFERENT USERNAMES AND PASSWORDS]


