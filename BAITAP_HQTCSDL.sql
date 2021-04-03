
--set feedback off
--BEGIN
--
--FOR c IN (SELECT table_name FROM user_tables) LOOP
--EXECUTE IMMEDIATE ('DROP TABLE "' || c.table_name || '" CASCADE CONSTRAINTS');
--END LOOP;
--
--FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
--EXECUTE IMMEDIATE ('DROP SEQUENCE ' || s.sequence_name);
--END LOOP;
--
--END;
--

PROMPT 	Creating tables in the student schema...
PROMPT 		Creating Table 'INSTRUCTOR'...
--DROP TABLE GRADE;
--DROP TABLE CLASS;
--DROP TABLE ENROLLMENT;
--DROP TABLE STUDENT;
--DROP TABLE COURSE;
--DROP TABLE INSTRUCTOR;
CREATE TABLE INSTRUCTOR (
	InstructorID 	NUMBER(8,0),
	Salutation		VARCHAR2(5),
	FirstName	VARCHAR2(25),
	LastName	VARCHAR2(25),
	Address		VARCHAR2(50),
	Phone		VARCHAR2(15),
	CreatedBy	VARCHAR2(30),
	CreatedDate	DATE,
	ModifiedBy	VARCHAR2(30),
	ModifiedDate 	DATE 
 )
/


PROMPT 		Creating Table 'GRADE'...
CREATE TABLE GRADE(
	StudentID 	NUMBER(8,0),
	ClassID 		NUMBER(8,0),
	Grade		NUMBER(3,0) DEFAULT 0,
	Comments	VARCHAR2(2000),
	CreatedBy	VARCHAR2(30),
	CreatedDate	DATE,
	ModifiedBy	VARCHAR2(30),
	ModifiedDate 	DATE 
 )
/






PROMPT 		Creating Table 'CLASS'...
CREATE TABLE CLASS(
	ClassID		NUMBER(8,0),
	CourseNo		NUMBER(8,0),
	ClassNo		NUMBER(3,0),
	StartDateTime	DATE,
	Location		VARCHAR2(50),
	InstructorID	NUMBER(8,0),
	Capacity		NUMBER(3,0),
	CreatedBy	VARCHAR2(30),
	CreatedDate	DATE,
	ModifiedBy	VARCHAR2(30),
	ModifiedDate 	DATE 
 )
/


PROMPT 		Creating Table 'COURSE'...
CREATE TABLE COURSE(
	CourseNo		NUMBER(38,0),
	Description	VARCHAR2(50),
	Cost		NUMBER(9,2) ,
	Prerequisite	NUMBER(8,0),
	CreatedBy	VARCHAR2(30),
	CreatedDate	DATE,
	ModifiedBy	VARCHAR2(30),
	ModifiedDate 	DATE 
 )
/

PROMPT 		Creating Table 'ENROLLMENT'...
CREATE TABLE ENROLLMENT(
	StudentID		NUMBER(8,0),
	ClassID		NUMBER(8,0) ,
	EnrollDate	DATE ,
	FinalGrade	NUMBER(3,0),
	CreatedBy	VARCHAR2(30),
	CreatedDate	DATE,
	ModifiedBy	VARCHAR2(30),
	ModifiedDate 	DATE 
 )
/


PROMPT 		Creating Table 'STUDENT'...
CREATE TABLE STUDENT(
	StudentID		NUMBER(8,0) ,
	Salutation		VARCHAR2(5),
	FirstName	VARCHAR2(25),
	LastName	VARCHAR2(25) ,
	Address		VARCHAR2(50),
	Phone		VARCHAR2(15) ,
	Employer		VARCHAR2(50),
	RegistrationDate	DATE ,
	CreatedBy	VARCHAR2(30),
	CreatedDate	DATE,
	ModifiedBy	VARCHAR2(30),
	ModifiedDate 	DATE 
 )
/








REM ******************************************************************
REM  description: used for creating the sequences in the student 
REM                 schema
REM ******************************************************************



 
PROMPT 		Creating Sequence 'INSTRUCTOR_ID_SEQ'...
CREATE SEQUENCE INSTRUCTOR_ID_SEQ
 INCREMENT BY 1
 START WITH 112
 NOMAXVALUE
 MINVALUE 1
 NOCYCLE
 NOCACHE
/

PROMPT 		Creating Sequence 'SECTION_ID_SEQ'....
CREATE SEQUENCE SECTION_ID_SEQ
 INCREMENT BY 1
 START WITH 158
 NOMAXVALUE
 MINVALUE 1
 NOCYCLE
 NOCACHE
/

PROMPT 		Creating Sequence 'STUDENT_ID_SEQ'....
CREATE SEQUENCE STUDENT_ID_SEQ
 INCREMENT BY 1
 START WITH 401
 NOMAXVALUE
 MINVALUE 1
 NOCYCLE
 NOCACHE
/

PROMPT 		Creating Sequence 'COURSE_NO_SEQ'...
CREATE SEQUENCE COURSE_NO_SEQ
 INCREMENT BY 1
 START WITH 452
 NOMAXVALUE
 MINVALUE 1
 NOCYCLE
 NOCACHE
/




ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR';

REM ******************************************************************
REM  description: used for loading Course data
REM ******************************************************************

PROMPT  Inserting the data.... 
PROMPT  	Inserting the data for Course table....

INSERT INTO course VALUES (10,'DP Overview',1195,NULL,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                                   
INSERT INTO course VALUES (20,'Intro to Computers',1195,NULL,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                            
INSERT INTO course VALUES (25,'Intro to Programming',1195,140,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                           
INSERT INTO course VALUES (80,'Structured Programming Techniques',1595,204,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                              
INSERT INTO course VALUES (100,'Hands-On Windows',1195,20,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                               
INSERT INTO course VALUES (120,'Intro to Java Programming',1195,80,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                      
INSERT INTO course VALUES (122,'Intermediate Java Programming',1195,120,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                 
INSERT INTO course VALUES (124,'Advanced Java Programming',1195,122,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                     
INSERT INTO course VALUES (125,'JDeveloper',1195,122,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                                    
INSERT INTO course VALUES (130,'Intro to Unix',1195,310,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                                 
INSERT INTO course VALUES (132,'Basics of Unix Admin',1195,130,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                          
INSERT INTO course VALUES (134,'Advanced Unix Admin',1195,132,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                           
INSERT INTO course VALUES (135,'Unix Tips and Techniques',1095,134,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                      
INSERT INTO course VALUES (140,'Structured Analysis',1195,20,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                            
INSERT INTO course VALUES (142,'Project Management',1195,20,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                             
INSERT INTO course VALUES (144,'Database Design',1195,420,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                               
INSERT INTO course VALUES (145,'Internet Protocols',1195,310,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                            
INSERT INTO course VALUES (146,'Java for C/C++ Programmers',1195,NULL,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                   
INSERT INTO course VALUES (147,'GUI Programming',1195,20,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                                
INSERT INTO course VALUES (204,'Intro to SQL',1195,20,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                                   
INSERT INTO course VALUES (210,'Oracle Tools',1195,220,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                                  
INSERT INTO course VALUES (220,'PL/SQL Programming',1195,80,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                             
INSERT INTO course VALUES (230,'Intro to Internet',1095,10,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                              
INSERT INTO course VALUES (240,'Intro to the Basic Language',1095,25,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                    
INSERT INTO course VALUES (310,'Operating Systems',1195,NULL,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                            
INSERT INTO course VALUES (330,'Network Administration',1195,130,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                        
INSERT INTO course VALUES (350,'JDeveloper Lab',1195,125,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                                
INSERT INTO course VALUES (420,'Database System Principles',1195,25,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                     
INSERT INTO course VALUES (430,'JDeveloper Techniques',1195,350,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                         
INSERT INTO course VALUES (450,'DB Programming in Java',NULL,350,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                        

COMMIT;


REM ******************************************************************
REM  description: used for loading Enrollment data
REM ******************************************************************
PROMPT  	Inserting the data for Enrollment table....


INSERT INTO enrollment VALUES (102,86,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (102,89,'30-JAN-99',92,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                      
INSERT INTO enrollment VALUES (103,81,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (104,81,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (105,155,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (106,99,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (106,101,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (107,87,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (108,86,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (109,99,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (109,101,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (110,95,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (110,154,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (111,133,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (111,142,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (112,95,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (112,154,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (113,128,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (113,156,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (114,128,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (114,156,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (117,94,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (117,130,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (118,90,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (119,103,'02-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (120,103,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (121,87,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (122,87,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (123,87,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (124,83,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (124,87,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (124,116,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (124,148,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (127,95,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (127,155,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (128,80,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (129,113,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (130,106,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (130,141,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (133,107,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (133,131,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (134,102,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (135,112,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (136,89,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (137,89,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (138,126,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (138,152,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (139,95,'04-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (140,94,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (141,100,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (142,143,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (143,85,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (144,152,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (145,106,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (146,147,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (147,117,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (147,120,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (148,123,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (149,147,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (150,89,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (151,89,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (152,89,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (153,144,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (154,88,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (156,147,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (157,147,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (158,84,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (159,85,'07-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (160,130,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (161,104,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (162,133,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (163,92,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (164,89,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (165,156,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (166,88,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (167,88,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (168,133,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (169,150,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (170,156,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (171,127,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (172,155,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (173,150,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (173,156,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (174,156,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (175,141,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (176,115,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (176,132,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (178,120,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (178,135,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (179,116,'10-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (180,116,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (180,119,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (181,117,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (182,117,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (184,116,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (184,138,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (184,146,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (185,116,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (186,107,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (187,120,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (188,117,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (189,116,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (189,137,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (190,117,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (191,117,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (192,117,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (193,119,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (194,116,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (195,141,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (196,108,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (197,109,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (198,108,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (199,84,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (199,142,'11-FEB-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                   
INSERT INTO enrollment VALUES (200,106,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (200,144,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (201,143,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (202,105,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (203,132,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (204,88,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (205,88,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (206,152,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (207,152,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (208,147,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (209,147,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (210,147,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (211,86,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (211,141,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (212,86,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (214,123,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (214,135,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (214,146,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (214,156,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (215,135,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (215,146,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (215,156,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (216,154,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (217,86,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (218,90,'13-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (220,119,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (221,104,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (223,104,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (223,119,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (224,89,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (225,89,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (227,89,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (227,96,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (228,148,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (229,111,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (230,86,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (232,91,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (232,147,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (232,149,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (233,90,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (233,112,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (234,137,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (235,83,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (235,150,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (236,138,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (236,140,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (237,85,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (237,141,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (238,85,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (238,103,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (238,141,'16-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (240,81,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (241,155,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (242,148,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (243,103,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (244,82,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (245,82,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (246,85,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (247,92,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (248,148,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (248,155,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (250,126,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (250,146,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (250,154,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (251,99,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (251,101,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (252,99,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (252,101,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (253,89,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (254,87,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (256,87,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (256,89,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (257,90,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (258,106,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (259,105,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (259,135,'19-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (260,105,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (260,148,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (261,105,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (262,100,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (263,105,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (264,116,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (265,92,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (266,92,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (267,95,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (267,125,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (268,126,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (269,126,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (270,126,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (270,153,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (271,91,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (271,145,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (272,153,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (273,151,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (274,151,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (275,153,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (276,99,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (276,101,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (277,99,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (277,101,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (278,99,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (278,101,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (279,99,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (279,101,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (280,99,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (280,101,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (281,99,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (281,101,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (282,99,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (282,101,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 
INSERT INTO enrollment VALUES (283,99,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                  
INSERT INTO enrollment VALUES (283,101,'21-FEB-99',NULL,'DSCHERER','14-DEC-99','BROSENZW','05-JAN-00');                                                                                                 

COMMIT;


REM ******************************************************************
REM  description: used for loading Grade data
REM ******************************************************************

PROMPT  	Inserting the data for Grade table....

                                                                                               
INSERT INTO grade VALUES (102,86,97,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (102,89,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (104,81,74,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (105,155,92,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (106,99,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                                                                                                                 
INSERT INTO grade VALUES (106,101,83,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');           
INSERT INTO grade VALUES (107,87,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');    
INSERT INTO grade VALUES (108,86,98,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (109,99,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (109,101,84,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (110,95,99,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                            
INSERT INTO grade VALUES (110,154,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (111,133,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (111,142,97,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (112,95,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (112,154,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (113,128,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (113,156,83,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (114,128,92,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (114,156,83,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (117,94,96,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (117,130,98,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (118,90,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (120,103,83,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (121,87,92,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (122,87,83,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (123,87,84,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                        
INSERT INTO grade VALUES (124,148,99,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (127,95,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (127,155,83,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (128,80,73,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (129,113,98,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (130,106,82,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (130,141,83,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (133,107,75,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (133,131,98,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (134,102,74,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (135,112,82,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (137,89,83,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (138,126,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (138,152,84,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (139,95,82,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (140,94,97,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (141,100,96,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (142,143,77,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (143,85,98,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (144,152,75,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (145,106,73,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (146,147,96,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (147,117,81,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (147,120,98,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (148,123,87,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (149,147,97,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (152,89,76,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (153,144,92,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (154,88,88,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (157,147,99,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (158,84,77,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (159,85,99,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (160,130,99,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (161,104,82,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (162,133,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (163,92,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (164,89,77,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (165,156,84,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (166,88,99,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (167,88,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (168,133,92,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (169,150,76,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (170,156,85,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (171,127,80,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (172,155,84,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (173,150,77,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (174,156,77,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (175,141,84,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (176,115,76,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (176,132,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (178,120,99,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (178,135,98,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (179,116,76,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (180,116,87,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (180,119,99,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (181,117,82,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (182,117,73,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (184,116,98,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (184,138,75,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (184,146,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (185,116,99,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (186,107,76,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (187,120,80,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (188,117,74,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (189,116,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (189,137,88,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (190,117,85,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (191,117,96,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (192,117,97,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (193,119,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (194,116,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (195,141,75,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (196,108,90,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (197,109,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (198,108,91,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (199,84,88,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                           
INSERT INTO grade VALUES (199,142,98,NULL,'CBRENNAN','11-FEB-00','JAYCAF','11-FEB-00');                                                                                                          
INSERT INTO grade VALUES (200,106,74,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (200,144,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (201,143,88,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (202,105,75,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (203,132,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (205,88,92,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (206,152,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (207,152,87,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (208,147,80,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (209,147,81,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (210,147,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (211,86,99,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (211,141,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (212,86,80,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (214,123,98,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (214,135,99,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (214,146,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (214,156,88,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (215,135,80,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (215,156,99,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (216,154,92,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (217,86,81,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (218,90,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (220,119,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (221,104,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (223,104,84,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (223,119,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (227,89,90,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (227,96,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (228,148,90,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (229,111,90,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (230,86,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (232,91,85,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (232,147,73,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (232,149,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (233,90,92,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (233,112,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (234,137,99,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (235,83,99,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (235,150,88,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (236,138,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (236,140,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (237,85,90,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (237,141,87,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (238,85,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (238,103,84,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (238,141,98,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (240,81,85,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (241,155,85,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (242,148,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (243,103,75,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (244,82,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (245,82,77,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (246,85,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (247,92,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (248,148,92,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (248,155,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (250,126,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (250,146,84,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (250,154,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (251,99,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (251,101,75,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (252,99,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (252,101,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (253,89,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (254,87,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (256,87,77,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (256,89,92,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (257,90,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (258,106,85,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (259,105,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (259,135,81,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (260,105,87,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (260,148,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (261,105,98,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (262,100,97,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (263,105,99,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (264,116,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (266,92,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (267,95,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (267,125,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (268,126,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (270,126,84,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');   
INSERT INTO grade VALUES (270,153,98,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (271,91,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (271,145,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (272,153,99,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (274,151,92,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (275,153,80,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (276,99,84,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (276,101,87,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (277,99,75,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (277,101,98,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (278,99,76,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (278,101,99,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (279,99,87,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (279,101,90,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (280,99,98,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (280,101,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (281,99,99,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (281,101,82,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (282,99,90,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (282,101,83,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        
INSERT INTO grade VALUES (283,99,91,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                         
INSERT INTO grade VALUES (283,101,84,NULL,'BROSENZW','23-MAR-00','DSCHERER','23-MAR-00');                                                                                                        

COMMIT;

REM ******************************************************************
REM  description: used for loading Instructor data
REM  created January 30, 2000
REM ******************************************************************

PROMPT  	Inserting the data for Instructor table....

INSERT INTO instructor VALUES (101,'Mr','Fernand','Hanks','100 East 87th','2125551212','ESILVEST','02-JAN-99','ESILVEST','02-JAN-99');                                                          
INSERT INTO instructor VALUES (102,'Mr','Tom','Wojick','518 West 120th','2125551212','ESILVEST','02-JAN-99','ESILVEST','02-JAN-99');                                                            
INSERT INTO instructor VALUES (103,'Ms','Nina','Schorin','210 West 101st','2125551212','ESILVEST','02-JAN-99','ESILVEST','02-JAN-99');                                                          
INSERT INTO instructor VALUES (104,'Mr','Gary','Pertez','34 Sixth Ave','2125551212','ESILVEST','02-JAN-99','ESILVEST','02-JAN-99');                                                             
INSERT INTO instructor VALUES (105,'Ms','Anita','Morris','34 Maiden Lane','2125551212','ESILVEST','02-JAN-99','ESILVEST','02-JAN-99');                                                          
INSERT INTO instructor VALUES (106,'Rev','Todd','Smythe','210 West 101st','2125551212','ESILVEST','02-JAN-99','ESILVEST','02-JAN-99');                                                          
INSERT INTO instructor VALUES (107,'Dr','Marilyn','Frantzen','254 Bleeker','2125551212','ESILVEST','02-JAN-99','ESILVEST','02-JAN-99');                                                         
INSERT INTO instructor VALUES (108,'Mr','Charles','Lowry','518 West 120th','2125551212','ESILVEST','02-JAN-99','ESILVEST','02-JAN-99');                                                         
INSERT INTO instructor VALUES (109,'Hon','Rick','Chow','56 10th Avenue','2125551212','ESILVEST','02-JAN-99','ESILVEST','02-JAN-99');                                                            
INSERT INTO instructor VALUES (110,'Ms','Irene','Willig','415 West 101st','2125551212','ARISCHER','11-MAR-99','ARISCHER','11-MAR-99');                                                             

COMMIT;


REM ******************************************************************
REM  description: used for loading Class data
REM  created January 30, 2000
REM ****
PROMPT  	Inserting the data for Class table....

INSERT INTO class VALUES (79,350,3,'14-APR-99','L509',107,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                          
INSERT INTO class VALUES (80,10,2,'24-APR-99','L214',102,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (81,20,2,'24-JUL-99','L210',103,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (82,20,4,'03-MAY-99','L214',104,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (83,20,7,'11-JUN-99','L509',105,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (84,20,8,'11-JUN-99','L210',106,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (85,25,1,'14-JUL-99','M311',107,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (86,25,2,'10-JUN-99','L210',108,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (87,25,3,'14-APR-99','L507',101,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (88,25,4,'04-MAY-99','L214',102,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (89,25,5,'15-MAY-99','L509',103,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (90,25,6,'12-JUN-99','L509',104,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (91,25,7,'12-JUN-99','L210',105,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (92,25,8,'13-JUN-99','L509',106,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (93,25,9,'13-JUN-99','L507',107,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                           
INSERT INTO class VALUES (94,146,2,'24-JUL-99','L507',102,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                          
INSERT INTO class VALUES (95,147,1,'14-APR-99','L509',103,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                          
INSERT INTO class VALUES (96,204,1,'14-APR-99','L210',104,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                          
INSERT INTO class VALUES (97,210,1,'07-MAY-99','L507',105,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                          
INSERT INTO class VALUES (98,220,1,'15-APR-99','L509',106,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                          
INSERT INTO class VALUES (99,230,1,'07-MAY-99','L500',107,12,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                          
INSERT INTO class VALUES (100,230,2,'09-JUN-99','L214',108,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (101,240,1,'16-APR-99','L509',101,10,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (102,240,2,'24-MAY-99','L214',102,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (103,310,1,'29-APR-99','L507',103,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (104,330,1,'14-JUL-99','L511',104,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (105,350,1,'09-MAY-99','L509',105,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (106,350,2,'03-JUN-99','L214',106,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (107,130,1,'14-JUL-99','L507',103,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (108,420,1,'07-MAY-99','M311',108,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (109,450,1,'14-APR-99','L507',101,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (110,134,2,'10-JUN-99','L509',102,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (111,134,3,'08-APR-00','L509',103,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (112,135,1,'16-MAY-99','L509',104,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (113,135,2,'02-JUN-99','L214',105,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (114,135,3,'15-APR-99','L509',106,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (115,135,4,'07-MAY-99','M200',107,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (116,140,1,'14-JUL-99','L509',108,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (117,140,2,'02-JUN-99','L210',101,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (118,140,3,'09-MAY-99','L507',102,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (119,142,1,'14-JUL-99','L211',103,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (120,142,2,'10-JUN-99','L214',104,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (121,142,3,'09-APR-99','L507',105,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (122,144,2,'15-APR-99','L214',106,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (123,145,1,'14-JUL-99','L214',107,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (124,145,3,'09-MAY-99','L210',108,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (125,146,1,'29-APR-99','L509',101,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (126,124,1,'14-JUL-99','M500',102,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (127,124,2,'24-JUL-99','H310',103,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (128,124,3,'09-APR-99','L214',104,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (129,124,4,'07-MAY-99','L210',105,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (130,125,1,'22-MAY-99','L509',106,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (131,125,2,'24-JUL-99','L509',107,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (132,125,3,'09-APR-99','L214',108,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (133,125,4,'03-MAY-99','L211',101,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (134,125,6,'11-JUN-99','L507',102,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (135,130,2,'15-APR-99','L214',104,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (136,130,3,'24-APR-99','L509',105,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (137,130,4,'03-MAY-99','L509',106,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (138,132,1,'21-MAY-99','L509',107,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (139,132,3,'09-JUN-99','L509',108,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (140,134,1,'16-APR-99','L509',101,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (141,100,1,'14-APR-99','L214',102,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (142,100,2,'24-JUL-99','L500',103,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (143,100,3,'03-JUN-99','L509',104,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (144,100,4,'04-MAY-99','L507',105,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (145,100,5,'15-MAY-99','L214',106,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (146,120,1,'16-MAY-99','L507',107,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (147,120,2,'24-JUL-99','L206',108,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (148,120,3,'24-MAY-99','L509',101,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (149,120,4,'04-MAY-99','L509',102,15,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (150,120,5,'15-MAY-99','L210',103,25,'CBRENNAN','02-JAN-99','CBRENNAN','02-JAN-99');                                                                                         
INSERT INTO class VALUES (151,120,7,'12-JUN-99','L507',104,25,'CBRENNAN','02-JAN-99','CBRENNAN','10-FEB-99');                                                                                         
INSERT INTO class VALUES (152,122,1,'29-APR-99','M311',105,25,'CBRENNAN','02-JAN-99','CBRENNAN','10-FEB-99');                                                                                         
INSERT INTO class VALUES (153,122,2,'24-JUL-99','L211',106,15,'CBRENNAN','02-JAN-99','CBRENNAN','10-FEB-99');                                                                                         
INSERT INTO class VALUES (154,122,3,'21-MAY-99','L507',107,25,'CBRENNAN','02-JAN-99','CBRENNAN','10-FEB-99');                                                                                         
INSERT INTO class VALUES (155,122,4,'04-MAY-99','L210',108,15,'CBRENNAN','02-JAN-99','ARISCHER','02-MAR-99');                                                                                         
INSERT INTO class VALUES (156,122,5,'15-MAY-99','L507',101,25,'CBRENNAN','02-JAN-99','ARISCHER','02-MAR-99');                                                                                         

COMMIT;

REM ******************************************************************
REM  description: used for loading Student data
REM  created January 30, 2000
REM ******************************************************************

PROMPT  	Inserting the data for Student table....

INSERT INTO student VALUES (102,'Mr.','Fred','Crocitto','101-09 120th St.','718-555-5555','Albert Hildegard Co.','22-JAN-99','BROSENZWEIG','19-JAN-99','BROSENZW','22-JAN-99');                 
INSERT INTO student VALUES (103,'Ms.','J.','Landry','7435 Boulevard East #45','201-555-5555','Albert Hildegard Co.','22-JAN-99','BROSENZWEIG','19-JAN-99','BROSENZW','22-JAN-99');              
INSERT INTO student VALUES (104,'Ms.','Laetia','Enison','144-61 87th Ave','718-555-5555','Albert Hildegard Co.','22-JAN-99','BROSENZWEIG','19-JAN-99','BROSENZW','22-JAN-99');                  
INSERT INTO student VALUES (105,'Mr.','Angel','Moskowitz','320 John St.','201-555-5555','Alex.  Alexander','22-JAN-99','BROSENZWEIG','19-JAN-99','BROSENZW','22-JAN-99');                      
INSERT INTO student VALUES (106,'Ms.','Judith','Olvsade','29 Elmwood Ave.','201-555-5555','Allied Corp.','22-JAN-99','BROSENZWEIG','19-JAN-99','BROSENZW','22-JAN-99');                         
INSERT INTO student VALUES (107,'Ms.','Catherine','Mierzwa','22-70 41st St.','718-555-5555','Amer.Contract Desgn.','22-JAN-99','BROSENZWEIG','19-JAN-99','BROSENZW','22-JAN-99');               
INSERT INTO student VALUES (108,'Ms.','Judy','Sethi','Stratton Hall','617-555-5555','Amer.Contract Desgn.','22-JAN-99','BROSENZWEIG','19-JAN-99','BROSENZW','22-JAN-99');                       
INSERT INTO student VALUES (109,'Mr.','Larry','Walter','38 Bay 26th ST. #2A','718-555-5555','Amer.Health Found.','22-JAN-99','BROSENZWEIG','19-JAN-99','BROSENZW','22-JAN-99');                 
INSERT INTO student VALUES (110,'Ms.','Maria','Martin','1674 Woodbine St.','718-555-5555','The Stock Exchange','25-JAN-99','BROSENZWEIG','22-JAN-99','BROSENZW','25-JAN-99');                   
INSERT INTO student VALUES (111,'Ms.','Peggy','Noviello','155 Union Ave #211',NULL,'The Stock Exchange','25-JAN-99','BROSENZWEIG','22-JAN-99','BROSENZW','25-JAN-99');                          
INSERT INTO student VALUES (112,'Mr.','Thomas','Thomas','501 W Elm St.','201-555-5555','The Stock Exchange','25-JAN-99','BROSENZWEIG','22-JAN-99','BROSENZW','25-JAN-99');                      
INSERT INTO student VALUES (113,'Mr.','Anil','Kulina','43-44 Kissena Blvd. #155','718-555-5555','ARFBO','25-JAN-99','BROSENZWEIG','22-JAN-99','BROSENZW','25-JAN-99');                          
INSERT INTO student VALUES (114,'Ms.','Winsome','Laporte','268 E. 3rd St','718-555-5555','ARFBO','25-JAN-99','BROSENZWEIG','22-JAN-99','BROSENZW','25-JAN-99');                                 
INSERT INTO student VALUES (117,'Mr.','N','Kuehn','44-25 59th St.','718-555-5555','Beauty Products','25-JAN-99','BROSENZWEIG','22-JAN-99','BROSENZW','25-JAN-99');                              
INSERT INTO student VALUES (118,'Ms.','Hiedi','Lopez','168 Rowayton Ave','203-555-5555','Banque de Paris','25-JAN-99','BROSENZWEIG','22-JAN-99','BROSENZW','25-JAN-99');                        
INSERT INTO student VALUES (119,'Mr.','Mardig','Abdou','160-04 32nd Ave.','718-555-5555','Raymond Capital','25-JAN-99','BROSENZWEIG','22-JAN-99','BROSENZW','25-JAN-99');                       
INSERT INTO student VALUES (120,'Mr.','Ralph','Alexander','2054 73rd St','718-555-5555','Raymond Capital','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                        
INSERT INTO student VALUES (121,'Ms.','Sean','Pineda','3 Salem Rd.','212-555-5555','Burke  Co.','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                                 
INSERT INTO student VALUES (122,'Ms.','Julita','Lippen','51-76 Van Kleeck St.','718-555-5555','Burke  Co.','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                      
INSERT INTO student VALUES (123,'Mr.','Pierre','Radicola','322 Atkins Ave.','718-555-5555','Burke  Co.','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                         
INSERT INTO student VALUES (124,'Mr.','Daniel','Wicelinski','27 Brookdale Gdns.','201-555-5555','Burke  Co.','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                    
INSERT INTO student VALUES (127,'Mr.','Gary','Aung','135-32 Louis Blvd','718-555-5555','New York Pop','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                            
INSERT INTO student VALUES (128,'Mr.','Jeff','Runyan','109-15 Queens Blvd.','718-555-5555','New York Pop','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                        
INSERT INTO student VALUES (129,'Mr.','Omaira','Grant','1065 Vermont St. 7F.','718-555-5555','New York Pop','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                      
INSERT INTO student VALUES (130,'Ms.','Lula','Oates','11A Emory St.','201-555-5555','New York Pop','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                               
INSERT INTO student VALUES (133,'Mr.','James','Reed','109-62 196th St','718-555-5555','New York Pop','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                             
INSERT INTO student VALUES (134,'Ms.','Angela','Torres','509 2nd St #4L','718-555-5555','New York Pop','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                           
INSERT INTO student VALUES (135,'Ms.','Michelle','Masser','379 Ovington Ave','718-555-5555','New York Pop','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                       
INSERT INTO student VALUES (136,'Ms.','Hazel','Lasseter','9720 57th Ave #10G','718-555-5555','DUCCA','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                             
INSERT INTO student VALUES (137,'Mr.','James','Miller','9830 57th Ave #3E','718-555-5555','DUCCA','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                                
INSERT INTO student VALUES (138,'Mr.','John','Smith','45 Plaza St. West #2D','718-555-5555','Hanon USA, Inc.','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                    
INSERT INTO student VALUES (139,'Mr.','Angelo','Garshman','82 Western Ave.','201-555-5555','Chase.Young NY Inc','27-JAN-99','BROSENZWEIG','24-JAN-99','BROSENZW','27-JAN-99');                  
INSERT INTO student VALUES (140,'Mr.','Derrick','Baltazar','9111 Church Ave. #3N','718-555-5555','Chase Young NY Inc','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');            
INSERT INTO student VALUES (141,'Mr.','Robert','Boyd','96-04 57th Ave #12A','718-555-5555','Chicago Pneumat.Tool','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');                
INSERT INTO student VALUES (142,'Ms.','Monica','Waldman','257 Depot Rd.','718-555-5555','Hallowhill Center','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');                      
INSERT INTO student VALUES (143,'Mr.','Gerard','Biers','205 19th St.','718-555-5555','Civil Court','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');                               
INSERT INTO student VALUES (144,'Mr.','David','Essner','96 E. Ave.','203-555-5555','Medical Presbyterian Hospital','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');               
INSERT INTO student VALUES (145,'Mr.','Paul','Lefkowitz','2 World Trade Cnt. 18','212-555-5555','Gleeson Law School','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');             
INSERT INTO student VALUES (146,'Mr.','Joseph','German','19 75th St.','201-555-5555','Anna Soehner','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');                              
INSERT INTO student VALUES (147,'Ms.','Judy','Cahouet','6406 10th Ave','718-555-5555','Competrol Real Estate','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');                    
INSERT INTO student VALUES (148,'Mr.','D.','Orent','117 Knapp Ave.','201-555-5555','Competrol Real Estate','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');                       
INSERT INTO student VALUES (149,'Ms.','Judith','Prochaska','49 Martindale Rd','201-555-5555','Competrol Real Estate','30-JAN-99','BROSENZWEIG','27-JAN-99','BROSENZW','30-JAN-99');             
INSERT INTO student VALUES (150,'Ms.','Regina','Gates','29 Cygnet Dr.','718-555-5555','Coney I.Med. Group','30-JAN-99','BROSENZWEIG','30-JAN-99','BROSENZW','30-JAN-99');                       
INSERT INTO student VALUES (151,'Ms.','Arlyne','Sheppard','33-54 28th St #2C','718-555-5555','Contnl Resources','30-JAN-99','BROSENZWEIG','30-JAN-99','BROSENZW','30-JAN-99');                  
INSERT INTO student VALUES (152,'Mr.','Thomas','Edwards','501 W. Elm','201-555-5555','Contnl Resources','30-JAN-99','BROSENZWEIG','30-JAN-99','BROSENZW','30-JAN-99');                          
INSERT INTO student VALUES (153,'Ms.','Mrudula','Philpotts','86-16 60 Ave. #6L','718-555-5555','Crow Construction','30-JAN-99','BROSENZWEIG','30-JAN-99','BROSENZW','30-JAN-99');               
INSERT INTO student VALUES (154,'Ms.','Dawn','Dennis','26 Indian Field Rd.','203-555-5555','Cusack  Stiles','30-JAN-99','BROSENZWEIG','30-JAN-99','BROSENZW','30-JAN-99');                     
INSERT INTO student VALUES (156,'Mr.','Scott','Grant','8402 14th Ave.','718-555-5555','Naiwa Securities','30-JAN-99','BROSENZWEIG','30-JAN-99','BROSENZW','30-JAN-99');                         
INSERT INTO student VALUES (157,'Ms.','Shirley','Jameson','101 Daniel St.','201-555-5555','Christa Publishing','30-JAN-99','BROSENZWEIG','30-JAN-99','BROSENZW','30-JAN-99');                   
INSERT INTO student VALUES (158,'Mr.','Roy','Limate','5 Horizon Rd.','201-555-5555','Documt.Mgmt.Group','30-JAN-99','BROSENZWEIG','30-JAN-99','BROSENZW','30-JAN-99');                          
INSERT INTO student VALUES (159,'Mr.','Thomas','Edwards','45 Maplewood Ave.','201-555-5555','Kodiak Island','30-JAN-99','BROSENZWEIG','30-JAN-99','BROSENZW','30-JAN-99');                      
INSERT INTO student VALUES (160,'Mr.','John T.','Beitler','100 Plaza Dr, ITT CSI Emp. Dpt','201-555-5555','Asylum Publishing','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');    
INSERT INTO student VALUES (161,'Ms.','Eilene','Grant','245 Henry St. #2I','718-555-5555','Worldwide Delivery','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                   
INSERT INTO student VALUES (162,'Ms.','Genny','Andrew','5 Sylvan Ln.','203-555-5555','Miro Life Insurance','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                       
INSERT INTO student VALUES (163,'Ms.','Nicole','Gillen','4301 N Ocean #103','904-555-5555','Oil of America Corp.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                
INSERT INTO student VALUES (164,'Ms.','Sylvia','Perrin','716a Union St.','718-555-5555','Baxxon Corp.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                           
INSERT INTO student VALUES (165,'Mr.','Peter','Daly','1219 Ave Y','718-555-5555','Foster Wheeler','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                                
INSERT INTO student VALUES (166,'Ms.','May','Jodoin','162-01 78 th Ave','718-555-5555','Gaum, Inc.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                              
INSERT INTO student VALUES (167,'Mr.','Jim','Joas','53-33 192nd St.','718-555-5555','Gaum, Inc.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                                 
INSERT INTO student VALUES (168,'Ms.','Sally','Naso','812 79th St.','201-555-5555','Motors National','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                             
INSERT INTO student VALUES (169,'Mr.','Frantz','McLean','23-08 Newtown Ave.','718-555-5555','Guenther Soehner','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                   
INSERT INTO student VALUES (170,'Ms.','P.','Balterzar','30 Carriage Rd.','718-555-5555','Parton Corp.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                           
INSERT INTO student VALUES (171,'Ms.','Denise','Brownstein','104-36 196th St.','718-555-5555','Nearst Corp.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                     
INSERT INTO student VALUES (172,'Ms.','Maria','Arias','Box 216','718-555-5555','Lising Corp.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                                    
INSERT INTO student VALUES (173,'Mr.','Oscar','McGill','578 E 40th ST.','718-555-5555','Nearst Corp.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                            
INSERT INTO student VALUES (174,'Mr.','Michael','Brown','265 Hawthorne St #2D','718-555-5555','Nearst Corp.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                     
INSERT INTO student VALUES (175,'Ms.','Debra','Boyce','294 East 98 St.','718-555-5555','Hoare Govett, Inc.','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                      
INSERT INTO student VALUES (176,'Ms.','Beth','Satterfield','140 Amity St','718-555-5555','Hosp. Jt. Diseases','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                    
INSERT INTO student VALUES (178,'Mr.','Ricardo','Kurtz','31-21 30th St.','718-555-5555','Electronic Engineers','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                   
INSERT INTO student VALUES (179,'Mr.','Simon','Ramesh','92-14 51st Ave','718-555-5555','Electronic Engineers','02-FEB-99','BROSENZWEIG','02-FEB-99','BROSENZW','02-FEB-99');                    
INSERT INTO student VALUES (180,'Mr.','E.A.','Torres','1495 Union','718-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                         
INSERT INTO student VALUES (181,'Mr.','Anthony','Bullock','53 Pauklie St.','718-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                 
INSERT INTO student VALUES (182,'Mr.','Jeffrey','Delbrun','PO Box 1091','201-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                    
INSERT INTO student VALUES (184,'Ms.','Salewa','Zuckerberg','1614 64th St.','718-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                
INSERT INTO student VALUES (185,'Mr.','Dennis','Mehta','371 Monmouth St.','201-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                  
INSERT INTO student VALUES (186,'Ms.','Christine','Sheppard','16 Seymour St.','201-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');              
INSERT INTO student VALUES (187,'Mr.','O.','Garnes','125 Great Hills Rd','201-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                   
INSERT INTO student VALUES (188,'Mr.','Phil','Gilloon','4244 Morestown Ct. E','614-555-5555','The Electronic Publishing Company','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99'); 
INSERT INTO student VALUES (189,'Ms.','Deborah','Reyes','91 S 10th St','201-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                     
INSERT INTO student VALUES (190,'Mr.','Alan','Affinito','735 W. Crescent Ave.','201-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');             
INSERT INTO student VALUES (191,'Mr.','Steven','M. Orent','223 Crabapple Rd.','718-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');              
INSERT INTO student VALUES (192,'Mr.','Frank','Viotty','299 Ocean Ae.','718-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                     
INSERT INTO student VALUES (193,'Mr.','Al','Jamerncy','16 Eldor Ave.','212-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                      
INSERT INTO student VALUES (194,'Ms.','Verona','Grant','17 Gould St.','201-555-5555','Electronic Engineers','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                      
INSERT INTO student VALUES (195,'Ms.','Regina','Bose','29 Cygnet Dr.','718-555-5555','Millhover Publishing','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                      
INSERT INTO student VALUES (196,'Mr.','Victor','Meshaj','22 Coach Lame Lane','203-555-5555','Interchurch','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                        
INSERT INTO student VALUES (197,'Mr.','J.','Dalvi','Skaarup Oil Co. 66 Field Pt. R','203-555-5555','Interchurch','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                 
INSERT INTO student VALUES (198,'Mr.','Edwin','Allende','276 Fillo St.','203-555-5555','Interchurch','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                             
INSERT INTO student VALUES (199,'Mr.','J.','Segall','53-35 192 St.','718-555-5555','Johnson  Higgins','03-FEB-99','BROSENZWEIG','03-FEB-99','BROSENZW','03-FEB-99');                           
INSERT INTO student VALUES (200,'Mr.','Gene','Bresser, HR Rep.','81 Shady Ln','201-555-5555','Judicial Center','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','05-FEB-99');                   
INSERT INTO student VALUES (201,'Mr.','Michael','Lefbowitz','1438 E 100th St','718-555-5555','Judicial Center','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                   
INSERT INTO student VALUES (202,'Ms.','Mary','Axch','144-70 41st Ave. #4T','718-555-5555','Kenyon  Kenyon','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                      
INSERT INTO student VALUES (203,'Mr.','Angel','Cook','320 John St','201-555-5555','Lambert, Brussels','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                            
INSERT INTO student VALUES (204,'Mr.','Arun','Griffen','Box 86','718-555-5555','Lambos, Flynn','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                                   
INSERT INTO student VALUES (205,'Mr.','Alfred','Hutheesing','43-11 National St','718-555-5555','Lambos, Flynn','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                   
INSERT INTO student VALUES (206,'Mr.','Freedon','annunziato','45 Adelphi St. #2W','718-555-5555','Lamont Doherty','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                
INSERT INTO student VALUES (207,'Ms.','Bernadette','Montanez','7 St. Lukes Place #202','201-555-5555','Lamont Doherty','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');           
INSERT INTO student VALUES (208,'Mr.','A.','Tucker','117 Olcott Way','203-555-5555','Lowenthal  Horwalk','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                        
INSERT INTO student VALUES (209,'Mr.','Lloyd','Kellam','156-02 Liberty Ave.','718-555-5555','Lowenthal  Horwalk','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                
INSERT INTO student VALUES (210,'Mr.','David','Thares','20 Charles Rd.','203-555-5555','MGIC Indemnity','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                          
INSERT INTO student VALUES (211,'Ms.','Jenny','Goldsmith','250 N. Van Dien Ave.','201-555-5555','Man.School Music','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');               
INSERT INTO student VALUES (212,'Ms.','Barbara','Robichaud','132 S Mountain View Dr.','212-555-5555','Man.School Music','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');          
INSERT INTO student VALUES (214,'Ms.','Yvonne','Williams','80-20 4th Ave.  #A3','718-555-5555','Iarriott Hotels','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                 
INSERT INTO student VALUES (215,'Mr.','Reynaldo','Chatman','9925 42nd Ave. #3B','718-555-5555','Iarriott Hotels','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                 
INSERT INTO student VALUES (216,'Mr.','Madhav','Dusenberry','6331 Durham Ave','201-555-5555','Micro Rental','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                      
INSERT INTO student VALUES (217,'Mr.','Jeffrey','Citron','PO Box 1091','201-555-5555','Mitsukoshi USA Inc.','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');                      
INSERT INTO student VALUES (218,'Mr.','Eric','Da Silva','90-36 53rd Avenue, #3D','718-555-5555','Mitsukoshi USA Inc.','05-FEB-99','BROSENZWEIG','05-FEB-99','BROSENZW','08-FEB-99');            
INSERT INTO student VALUES (220,'Mr.','Robert','Segall','36 Brookdale Dr.','203-555-5555','Board Utilities','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                      
INSERT INTO student VALUES (221,'Ms.','Sheradha','Malone','91-41 23rd Ave. 1st Floor','718-555-5555','Board Utilities','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');           
INSERT INTO student VALUES (223,'Mr.','Frank','Pace','13 Burlington Dr.','203-555-5555','Board Utilities','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                        
INSERT INTO student VALUES (224,'Mr.','M.','Diokno','44-20 64th St #6L','718-555-5555','Natnl Bank Hungary','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                      
INSERT INTO student VALUES (225,'Mr.','Edgar','Moffat','172 Lincoln St','201-555-5555','OPEIU','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                                   
INSERT INTO student VALUES (227,'Ms.','Bessie','Heedles','932 Carnegie Ave.','201-555-5555','Ogilvy  Bernard','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                   
INSERT INTO student VALUES (228,'Mr.','Mohamed','Valentine','35-33 83rd St. #D 12','718-555-5555','Omni Devel. Markt.','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');          
INSERT INTO student VALUES (229,'Ms.','Adrienne','Lopez','755 Anderson Ave. #3-25','201-555-5555','PS 3-401','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                    
INSERT INTO student VALUES (230,'Mr.','George','Kocka','24 Beaufield St.','617-555-5555','PC Values','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                             
INSERT INTO student VALUES (232,'Ms.','Janet','Jung','118-18 Union Tpke #3K','718-555-5555','Plannning, Health S.','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');               
INSERT INTO student VALUES (233,'Ms.','Kathleen','Mulroy','770 Anderson Ave.','201-555-5555','Hohenreuther','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                      
INSERT INTO student VALUES (234,'Mr.','Joel','Brendler','111 Village Hill Dr.','718-555-5555','Morninghill Presbyterian Hosp.','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');   
INSERT INTO student VALUES (235,'Mr.','Michael','Carcia','250 Senator St','718-555-5555','KO Pictures, Inc.','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                     
INSERT INTO student VALUES (236,'Mr.','Gerry','Tripp','35-15 84th St.','718-555-5555','Schl.of Nursing','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                          
INSERT INTO student VALUES (237,'Mr.','Rommel','Frost','P.O. Box 6294','201-555-5555','Seligman Harris','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                          
INSERT INTO student VALUES (238,'Mr.','Roger','Snow','1620 Cambridge Rd.','517-555-5555','Seligman Harris','08-FEB-99','BROSENZWEIG','08-FEB-99','BROSENZW','11-FEB-99');                       
INSERT INTO student VALUES (240,'Ms.','Z.A.','Scrittorale','27 Arrowhead Wy.','203-555-5555','Sibney Advertising','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                
INSERT INTO student VALUES (241,'Mr.','Joseph','Yourish','185 St. Marks Ave.','718-555-5555','Simpson, Thatcher','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                 
INSERT INTO student VALUES (242,'Mr.','Daniel','Ordes','117 Knapp Ave.','201-555-5555','St.Colg.Optometry','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                       
INSERT INTO student VALUES (243,'Mr.','Bharat','Roberts','175 Oakland Ave.','201-555-5555','Steinhauer,Sheiman','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                  
INSERT INTO student VALUES (244,'Ms.','Sarah','Wilson','457 77th St.','718-555-5555','Thacher, Proffitt','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                         
INSERT INTO student VALUES (245,'Mr.','Irv','Dalvi','1504 Harmon Cove Towers','201-555-5555','Thacher, Proffitt','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                 
INSERT INTO student VALUES (246,'Ms.','Meryl','Owens','94 Sycamore Rd.','201-555-5555','The COG Group,Inc.','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                      
INSERT INTO student VALUES (247,'Mr.','Frank','Bunnell','43 Lindstrom Rd.','203-555-5555','The Plaza Penn Hotel','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                 
INSERT INTO student VALUES (248,'Ms.','Tamara','Zapulla','818 E. Ridgewood Ave.','201-555-5555','Thyssen Stuttgart','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');              
INSERT INTO student VALUES (250,'Mr.','Evan','Fielding','194-07 58th Ave.','718-555-5555','Toronto Neuenstadt','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                   
INSERT INTO student VALUES (251,'Ms.','Catherine','Frangopoulos','2270 41st Street','718-555-5555','U.N.D.P.','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                    
INSERT INTO student VALUES (252,'Ms.','Nana','Barogh','4131 Hampton St.','718-555-5555','U.N.D.P.','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                               
INSERT INTO student VALUES (253,'Mr.','Walter','Boremmann','88 Old Fields Rd','617-555-5555','Union Bk.Bavaria','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                  
INSERT INTO student VALUES (254,'Ms.','Melvina','Chamnonkool','117-36 168th St.','718-555-5555','Union Bk.Bavaria','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');               
INSERT INTO student VALUES (256,'Ms.','Lorrane','Velasco','200 Winston Dr. #2212','201-555-5555','Union Bk.Bavaria','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');              
INSERT INTO student VALUES (257,'Ms.','Suzanne M.','Abid','279 Hempstead Ave.','718-555-5555','Whitney Comm.','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                    
INSERT INTO student VALUES (258,'Ms.','Suzanna','Velasco','1033 Springfield Ave, UCC','201-555-5555','Kirsten Stein','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');             
INSERT INTO student VALUES (259,'Mr.','George','Merriman','49 Adair Ct','718-555-5555','Powerhouse Publishing','11-FEB-99','BROSENZWEIG','11-FEB-99','BROSENZW','14-FEB-99');                   
INSERT INTO student VALUES (260,'Ms.','Jean','Griffith','1219 Mooney Pl.','201-555-5555','Willig Pub.','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                           
INSERT INTO student VALUES (261,'Mr.','Vinnie','Moon','32-67 35th St.','718-555-5555','Kirsten Stein','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                            
INSERT INTO student VALUES (262,'Ms.','Donna','Walston','236 Washington Ave.','201-555-5555','Willig Pub.','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                       
INSERT INTO student VALUES (263,'Mr.','Radharam','King','2416 38 Ave. #5G','718-555-5555','Kirsten Stein','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                        
INSERT INTO student VALUES (264,'Ms.','Lorraine','Harty','17 Beach St.','201-555-5555','A.D. Tihany, Intnl','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                      
INSERT INTO student VALUES (265,'Ms.','Adele','Rothstein','Box 6028','718-555-5555','A.H.R.B.','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                                   
INSERT INTO student VALUES (266,'Ms.','Kate','Page','130 8th Ave 38F','718-555-5555','A.H.R.B.','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                                  
INSERT INTO student VALUES (267,'Mr.','Julius','Kwong','3001 Edwin Ave. 2B','201-555-5555','Adler  Shaykin','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                     
INSERT INTO student VALUES (268,'Mr.','Ronald','Tangaribuan','140 Hepburn Rd #9J','201-555-5555','Alex.  Alexander','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');             
INSERT INTO student VALUES (269,'Ms.','Sharon','Thompson','390 Parkside Ave. #A4','718-555-5555','Alex.  Alexander','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');             
INSERT INTO student VALUES (270,'Mr.','Charles','Caro','6 Buena Vista St.','203-555-5555','Alex.  Alexander','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                    
INSERT INTO student VALUES (271,'Mr.','Jose','Benitez','69-68 St.','201-555-5555','Amer. Intl Group','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                             
INSERT INTO student VALUES (272,'Ms.','Kevin','Porch','102 Maple St.','201-555-5555','Diabetes Prevention Assoc.','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                
INSERT INTO student VALUES (273,'Ms.','Hedy','Naso','1072 Abbott Blvd.','201-555-5555','Diabetes Prevention Assoc.','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');              
INSERT INTO student VALUES (274,'Mr.','John','De Simone','107-28 115th St','718-555-5555','Diabetes Prevention Assoc.','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');           
INSERT INTO student VALUES (275,'Mr.','George','Ross','49 Adair Ct.','718-555-5555','Associate Diabetics Foundation','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');             
INSERT INTO student VALUES (276,'Ms.','Florence','Valamas','88-20 86 Street','718-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                 
INSERT INTO student VALUES (277,'Ms.','Evelyn','Liggons','67-19 49th Ave','718-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                    
INSERT INTO student VALUES (278,'Mr.','Thomas E.','La Blank','49 Raleigh Rd','617-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                 
INSERT INTO student VALUES (279,'Ms.','George','Korka','3 Aster Pl.','718-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                         
INSERT INTO student VALUES (280,'Mr.','Bill','Engongoro','37-55 77th St #5G','718-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                 
INSERT INTO student VALUES (281,'Ms.','Virginia','Ocampo','68 First Ave.','201-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                    
INSERT INTO student VALUES (282,'Mr.','Jonathan','Jaele','1543 Nostrant Ave. #3C','718-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');            
INSERT INTO student VALUES (283,'Ms.','Benita','Perkins','11 Mirrielees Circle','718-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');              
INSERT INTO student VALUES (284,'Ms.','Salewa','Lindeman','1614 64th St.','718-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                    
INSERT INTO student VALUES (285,'Mr.','Paul','Sikinger','38 Beaumont Pl','201-555-5555','Amer.Legal Systems','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                     
INSERT INTO student VALUES (286,'Ms.','Robin','Kelly','200 Winston Dr. #2212','201-555-5555','German Express Corp.','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');              
INSERT INTO student VALUES (288,'Ms.','Rosemary','Ellman','143.5 Bowers St.','201-555-5555','Anaesthesiology Associates','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');         
INSERT INTO student VALUES (289,'Ms.','Shirley','Murray','PO Box 143','718-555-5555','Arbank, T.A.S.','13-FEB-99','BROSENZWEIG','13-FEB-99','BROSENZW','16-FEB-99');                            
INSERT INTO student VALUES (290,'Mr.','Brian','Robles','45-08 11th St.','718-555-5555','Asch  Basch, P.A.','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                      
INSERT INTO student VALUES (291,'Mr.','D.','Dewitt','4 Rockledge Rd','201-555-5555','Assoc.Help Retarded','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                        
INSERT INTO student VALUES (292,'Mr.','Austin V.','Cadet','360 Sunset Rd.','201-555-5555','Assoc.Help Retarded','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                  
INSERT INTO student VALUES (293,'Mr.','Frank','M. Orent','37-21 80th St. #6J','718-555-5555','Assoc.Help Retarded','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');               
INSERT INTO student VALUES (294,'Ms.','Yvonne','Winnicki','8020 4th Ave.','718-555-5555','Assoc.Help Retarded','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                   
INSERT INTO student VALUES (296,'Mr.','Mike','Madej','214 Cottage St.','203-555-5555','TRS/Sanders','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                              
INSERT INTO student VALUES (298,'Ms.','Paula','Valentine','17 Orchard Farm','718-555-5555','TRS/Sanders','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                         
INSERT INTO student VALUES (299,'Mr.','Brian','Saluja','604 McDough St.','718-555-5555','Frontwater Music','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                       
INSERT INTO student VALUES (300,'Mr.','Frances','Lawson','70 Nevada Ave.','718-555-5555','Frontwater Music','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                      
INSERT INTO student VALUES (301,'Mr.','Barry','Dunkon','1 Marine Pl','201-555-5555','Banco Bueno','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                                
INSERT INTO student VALUES (302,'Ms.','Rita','Archor','30 Lakeview Dr.','203-555-5555','Barnard Love','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                            
INSERT INTO student VALUES (303,'Mr.','George','Milano','#1 Baycoub Dr.','718-555-5555','Barnard Love','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                           
INSERT INTO student VALUES (304,'Mr.','Kardik','Guarino','4141 48th St #3K','718-555-5555','Faerber','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                             
INSERT INTO student VALUES (305,'Mr.','Preston','Larcia','131-57 230th','718-555-5555','Schwaebische Landesbank','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                 
INSERT INTO student VALUES (306,'Mr.','Norman','Callender','6635 108th St.','718-555-5555','Beketon Dickenson','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                   
INSERT INTO student VALUES (307,'Ms.','Salondra','Galik','114-19 131st St.','718-555-5555','Schloomingdales','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                     
INSERT INTO student VALUES (309,'Ms.','Carlos','Airall','250 Sylvan Dr','718-555-5555','Breed, Abbott, Tristan','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                  
INSERT INTO student VALUES (310,'Mr.','Joseph','Jimenes','221-07 Braddock Ave.','718-555-5555','Breed, Abbott, Tristan','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');          
INSERT INTO student VALUES (311,'Mr.','Henry','Masser','5502 Tilden Ave.','718-555-5555','Hurlington Industries','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                 
INSERT INTO student VALUES (312,'Ms.','Maria','Allende','2885 Bayview Ave.','718-555-5555','HK Inc.','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                             
INSERT INTO student VALUES (313,'Mr.','John','Velie','135-24 233rd St.','718-555-5555','TK Inc.','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                                 
INSERT INTO student VALUES (314,'Ms.','Bernice','Dermody','209 Carlton Ave.','718-555-5555','New York Pop','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                       
INSERT INTO student VALUES (315,'Ms.','Daniel','McHowell','35 Sommerville St','718-555-5555','Rischert  Assoc.','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                 
INSERT INTO student VALUES (317,'Ms.','Cathy','Austin','64-18 Madison St.','718-555-5555','New York Culture','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                     
INSERT INTO student VALUES (319,'Mr.','George','Eakheit','40 Ramapo Rd','201-555-5555','New York Culture','17-FEB-99','BROSENZWEIG','17-FEB-99','BROSENZW','20-FEB-99');                        
INSERT INTO student VALUES (320,'Mr.','Mark','Miller','40-44 70th St.','718-555-5555','New York Culture','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                         
INSERT INTO student VALUES (321,'Ms.','Jeannette','Smagler','420 Greene Ave.','718-555-5555','New York Culture','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                  
INSERT INTO student VALUES (322,'Mr.','Oscar','Archer','578 E 40th ST.','718-555-5555','Capital Natnl Bank','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                      
INSERT INTO student VALUES (323,'Mr.','Gilbert','Ginestra','555 North Ave, 24C','201-555-5555','Capital Natnl Bank','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');              
INSERT INTO student VALUES (324,'Mr.','Price','Marten','328 Fenimore St. #2','718-555-5555','Xaticorp Retail','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                    
INSERT INTO student VALUES (325,'Ms.','Pat','Puetrino','Bldg #11, 1st St','212-555-5555','Hayworth Business School','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');              
INSERT INTO student VALUES (326,'Mr.','Piotr','Padel','14 Spring Grove','203-555-5555','Coley  McCarthy','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                        
INSERT INTO student VALUES (328,'Mr.','Lynwood A.','Thorton','68 Durand Pl','201-555-5555','Colt Industries','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                     
INSERT INTO student VALUES (330,'Mr.','John','Tabs','8821 16th Avenue','718-555-5555','Hayman Budget Offices','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                    
INSERT INTO student VALUES (331,'Ms.','Mei-Wah','Zopf','3448 76th ST.','718-555-5555','Millerman Libraries','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                      
INSERT INTO student VALUES (332,'Ms.','Paula','Mwangi','321 Hill Ave.','914-555-5555','Public Libraries','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                         
INSERT INTO student VALUES (333,'Mr.','Artie','Ward','951 Carroll St. #3B','718-555-5555','Millerman Libraries','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                  
INSERT INTO student VALUES (334,'Ms.','Sarah','Annina','64 Janes Ln','203-555-5555','Combustion Eng.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                            
INSERT INTO student VALUES (335,'Ms.','Jane','Jackson','34 Park Row','201-555-5555','Ray Reedy','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                                  
INSERT INTO student VALUES (336,'Mr.','Steven','Gallagher','522 60th St.','718-555-5555','Combustion Eng.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                       
INSERT INTO student VALUES (337,'Mr.','Preston','Cross','131-57 230th','718-555-5555','Competrol Real Estate','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                    
INSERT INTO student VALUES (338,'Ms.','Helga','Towle','87B Hastings Ave.','201-555-5555','Corp.Propty.Invstrs.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                  
INSERT INTO student VALUES (339,'Mr.','Piang','Nyziak','646 Argyle Rd. B20','718-555-5555','Cosmopolitan Reader, Inc.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');           
INSERT INTO student VALUES (340,'Mr.','David','Eng','547 Crown St.','718-555-5555','Counselor at Law','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                            
INSERT INTO student VALUES (341,'Mr.','Kevin','Porch','1531 John St.','201-555-5555','Craftex Creations','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                         
INSERT INTO student VALUES (342,'Ms.','Marianne','De Armas','25 Duncan Ave.','201-555-5555','Craftex Creations','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                  
INSERT INTO student VALUES (343,'Mr.','Ray','Schafer','73 Wilson St','718-555-5555','Craftex Joice','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                              
INSERT INTO student VALUES (344,'Rev','R.','Sprouse','525 E. Front St.','201-555-5555','Crane Co.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                               
INSERT INTO student VALUES (345,'Mr.','Peter','Carey','23 School Lane','718-555-5555','Crane Co.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                                
INSERT INTO student VALUES (346,'Dr.','Joane','Buckberg','311 Temple Pl.','201-555-5555','Crane Co.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                             
INSERT INTO student VALUES (347,'Ms.','Edith','Daly','1763 E 28th St','718-555-5555','Crane Co.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                                 
INSERT INTO student VALUES (348,'Mr.','Morty','Miller','14 Side Hill Rd','203-555-5555','Crane Co.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                              
INSERT INTO student VALUES (349,'Ms.','Margaret','Mandel','1701 Albemarne Wd. F3','718-555-5555','Crane Co.','19-FEB-99','BROSENZWEIG','19-FEB-99','BROSENZW','22-FEB-99');                     
INSERT INTO student VALUES (351,'Mr.','Alan','Galik','84-23 Mantuon St #4E','718-555-5555','Credit for Everyone','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                 
INSERT INTO student VALUES (352,'Ms.','Debra','Shah','118-48 203rd St','718-555-5555','DHJ Info Services','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                        
INSERT INTO student VALUES (353,'Mr.','Paul','Intal','62A Brookdale Grdns.','201-555-5555','Dean Reynolds','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                       
INSERT INTO student VALUES (355,'Mr.','Romeo','Ittoop','837 Pavonia Ave.','201-555-5555','Donaldson Lufkin','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                      
INSERT INTO student VALUES (356,'Mr.','John','Ancean','23 Pines Bridge Rd','203-555-5555','Donaldson Lufkin','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                     
INSERT INTO student VALUES (357,'Mr.','Tom','Vargas','86 Harmon St.','718-555-5555','Doyle  Assoc.','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                             
INSERT INTO student VALUES (358,'Ms.','Valerie','Avia','142-20 Franklin Ave. #3M','718-555-5555','Drummond  Hill','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');               
INSERT INTO student VALUES (359,'Mr.','Fermin','Galik','54 Grand St.','718-555-5555','Drummond  Hill','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                           
INSERT INTO student VALUES (360,'Mr.','Calvin','Kiraly','P.O. Box 1627','203-555-5555','E.Asian Library','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                         
INSERT INTO student VALUES (361,'Mr.','Rawan','Rosenberg','94-31 59th Ave #5A','718-555-5555','Millermont Public School','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');         
INSERT INTO student VALUES (362,'Mr.','Yu','Sentell','1679 Woodbine St.','718-555-5555','Emerging Image, Inc.','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                   
INSERT INTO student VALUES (363,'Ms.','Bridget','Hagel','640 E 94th St','718-555-5555','Emerging Image, Inc.','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                    
INSERT INTO student VALUES (364,'Mr.','Howard','Leopta','269 Vassar Ave','201-555-5555','Miro Life Insurance','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                    
INSERT INTO student VALUES (365,'Ms.','Kathleen','Mastandora','Box 165','718-555-5555','Mire Life Insurance','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                     
INSERT INTO student VALUES (366,'Mr.','Gabriel','Smith','451 E 26th St','718-555-5555','Miro Life Insurance','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                     
INSERT INTO student VALUES (367,'Mr.','Raymond','Cheevens','2 Broadview Rd.','203-555-5555','Miro Life Insurance','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                
INSERT INTO student VALUES (368,'Mr.','Kevin','Lin','1402 Easter Pkwy','718-555-5555','Ettlinger  Amerbach','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                     
INSERT INTO student VALUES (369,'Ms.','Lorraine','Tucker','200 Winston Dr.','201-555-5555','Ettlinger  Amerbach','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                
INSERT INTO student VALUES (370,'Mr.','John','Mithane','770 Amsterdam Ave. #20K','201-555-5555','Euclid Partners Corp','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');           
INSERT INTO student VALUES (371,'Mr.','Craig','Anglin','199-46 21st Ave.','718-555-5555','Baxxon Corp.','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                          
INSERT INTO student VALUES (372,'Ms.','Zalman','Draquez','5110 Ave. M','718-555-5555','Baxxon Corp.','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                             
INSERT INTO student VALUES (373,'Ms.','Reeva','Yeroushalmi','4500 Beach 45th St.','718-555-5555','Baxxon Corp.','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                  
INSERT INTO student VALUES (374,'Mr.','Leonard','Millstein','31 Thistle Lane','201-555-5555','FGIC','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                              
INSERT INTO student VALUES (375,'Mr.','Jack','Kasperovich','98-17 162nd Ave.','718-555-5555','Fashion Institute','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                 
INSERT INTO student VALUES (376,'Ms.','Lorelei','McNeal','432 Hunt Ln.','718-555-5555','Finle  Co.','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                             
INSERT INTO student VALUES (378,'Mr.','William','Gallo','P O Box 6309','201-555-5555','First Holland Corp.','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                      
INSERT INTO student VALUES (379,'Mr.','Craig','Padron','199-46 21st Ave.','718-555-5555','German Natnl Bank','21-FEB-99','BROSENZWEIG','21-FEB-99','BROSENZW','24-FEB-99');                     
INSERT INTO student VALUES (380,'Mr.','Joel','Krot','111 Village Hill Dr.','718-555-5555','Freeman, Davis','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                       
INSERT INTO student VALUES (381,'Mr.','Allan','Simmons','2422 Brigham St.','718-555-5555','Friedlander, Gaines','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                  
INSERT INTO student VALUES (382,'Mr.','Michael','Miroff','1316 South End Prkwy.','201-555-5555','Friedlander, Gaines','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');            
INSERT INTO student VALUES (383,'Ms.','Roger','Cowie','739 Willow St.','201-555-5555','G.C.Osnos Co.','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                            
INSERT INTO student VALUES (384,'Mr.','Asian','Chirichella','134-25 Franklin Ave. #512','718-555-5555','Peo Capital Corp.','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');       
INSERT INTO student VALUES (385,'Ms.','Yvonne','Allende','8020 Fort Ave. #A3','718-555-5555','Georval, Inc.','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                     
INSERT INTO student VALUES (386,'Ms.','Sengita','MacDonald, Jr.','144-35 32nd Ave','718-555-5555','Goddard Institute','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');            
INSERT INTO student VALUES (387,'Mr.','Paul','Braun','224 40th St','201-555-5555','FBO, Inc.','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                                    
INSERT INTO student VALUES (388,'Ms.','Anna','Bathmanapan','481 Van Buren St.#C1','718-555-5555','FBO, Inc.','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                     
INSERT INTO student VALUES (389,'Ms.','Shirley','Leung','88 Sherman St.','201-555-5555','FBO, Inc.','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                              
INSERT INTO student VALUES (390,'Mr.','V.','Greenberg','105-34 65th Ave.  #6B','718-555-5555','Handler,Danas Realty','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');             
INSERT INTO student VALUES (391,'Mr.','Rafael A.','Torres','142-20 Franklin Ave. #2Q','718-555-5555','Handler,Danas Realty','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');      
INSERT INTO student VALUES (392,'Mr.','V.','Saliternan','105-34 65th Ave.  #6B','718-555-5555','Handler,Danas Realty','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');            
INSERT INTO student VALUES (393,'Mr.','Melvin','Martin','88 Sherman St.','201-555-5555','Hanlon  McHeffey','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                      
INSERT INTO student VALUES (394,'Ms.','Vera','Wetcel','172-12 133rd Ave.','718-555-5555','Harold C.Hervon, PC','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                   
INSERT INTO student VALUES (396,'Mr.','James E.','Norman','PO Box 809 Curran Hwy','617-555-5555','Health  Hospitals','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');            
INSERT INTO student VALUES (397,'Ms.','Margaret','Lloyd','77-15 113th Street, #15','718-555-5555','Health  Hospitals','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');           
INSERT INTO student VALUES (399,'Mr.','Jerry','Abdou','460 15th St. #4','718-555-5555','Health Mgmt.Systems','23-FEB-99','BROSENZWEIG','23-FEB-99','BROSENZW','26-FEB-99');                     

COMMIT;

REM ******************************************************************
REM   file: student.con
REM  Description: used for creating constraints in the student schema
REM                 tables
REM  created January 30, 2000
REM ******************************************************************


 
PROMPT Creating Check Constraints on 'INSTRUCTOR'
ALTER TABLE INSTRUCTOR
 ADD CONSTRAINT INST_MODFIED_BY_NNULL CHECK ('ModifiedBy' IS NOT NULL)
 ADD CONSTRAINT INST_INSTRUCTOR_ID_NNULL CHECK ('InstructorID' IS NOT NULL)
 ADD CONSTRAINT INST_CREATED_BY_NNULL CHECK ('CreatedBy' IS NOT NULL)
 ADD CONSTRAINT INST_CREATED_DATE_NNULL CHECK ('CreatedDate' IS NOT NULL)
 ADD CONSTRAINT INST_MODIFIED_DATE_NNULL CHECK ('ModifiedDate' IS NOT NULL)
/
 
PROMPT Creating Check Constraints on 'GRADE'
ALTER TABLE GRADE
 ADD CONSTRAINT GR_CREATED_DATE_NNULL CHECK ('CreatedDate' IS NOT NULL)
 ADD CONSTRAINT GR_STUDENT_ID_NNULL CHECK ('StudentID ' IS NOT NULL)
 ADD CONSTRAINT GR_CLASS_ID_NNULL CHECK ('ClassID' IS NOT NULL)
 ADD CONSTRAINT GR_MODIFIED_DATE_NNULL CHECK ('ModifiedDate ' IS NOT NULL)
 ADD CONSTRAINT GR_CREATED_BY_NNULL CHECK ('CreatedBy' IS NOT NULL)
 ADD CONSTRAINT GR_MODIFIED_BY_NNULL CHECK ('ModifiedBy' IS NOT NULL)
/
 

PROMPT Creating Check Constraints on 'CLASS'
ALTER TABLE CLASS
 ADD CONSTRAINT SECT_CREATED_DATE_NNULL CHECK ('CreatedDate' IS NOT NULL)
 ADD CONSTRAINT SECT_MODIFIED_BY_NNULL CHECK ('ModifiedBy' IS NOT NULL)
 ADD CONSTRAINT SECT_CLASS_ID_NNULL CHECK ('ClassID' IS NOT NULL)
 ADD CONSTRAINT SECT_CLASS_NO_NNULL CHECK ('ClassNo' IS NOT NULL)
 ADD CONSTRAINT SECT_CREATED_BY_NNULL CHECK ('CreatedBy' IS NOT NULL)
 ADD CONSTRAINT SECT_INSTRUCTOR_ID_NNULL CHECK ('InstructorID' IS NOT NULL)
 ADD CONSTRAINT SECT_MODIFIED_DATE_NNULL CHECK ('ModifiedDate ' IS NOT NULL)
 ADD CONSTRAINT SECT_COURSE_NO_NNULL CHECK ('CourseNo' IS NOT NULL)
/
 
PROMPT Creating Check Constraints on 'COURSE'
ALTER TABLE COURSE
 ADD CONSTRAINT CRSE_CREATED_DATE_NNULL CHECK ('CreatedDate' IS NOT NULL)
 ADD CONSTRAINT CRSE_MODIFIED_BY_NNULL CHECK ('ModifiedBy' IS NOT NULL)
 ADD CONSTRAINT CRSE_MODIFIED_DATE_NNULL CHECK ('ModifiedDate ' IS NOT NULL)
 ADD CONSTRAINT CRSE_Description_NNULL CHECK ('Description' IS NOT NULL)
 ADD CONSTRAINT CRSE_COURSE_NO_NNULL CHECK ('CourseNo' IS NOT NULL)
 ADD CONSTRAINT CRSE_CREATED_BY_NNULL CHECK ('CreatedBy' IS NOT NULL)
/
 
PROMPT Creating Check Constraints on 'ENROLLMENT'
ALTER TABLE ENROLLMENT
 ADD CONSTRAINT ENR_MODIFIED_DATE_NNULL CHECK ('ModifiedDate ' IS NOT NULL)
 ADD CONSTRAINT ENR_STUDENT_ID_NNULL CHECK ('StudentID ' IS NOT NULL)
 ADD CONSTRAINT ENR_ENROLL_DATE_NNULL CHECK ('EnrollDate' IS NOT NULL)
 ADD CONSTRAINT ENR_MODIFIED_BY_NNULL CHECK ('ModifiedBy' IS NOT NULL)
 ADD CONSTRAINT ENR_CLASS_ID_NNULL CHECK ('ClassID' IS NOT NULL)
 ADD CONSTRAINT ENR_CREATED_BY_NNULL CHECK ('CreatedBy' IS NOT NULL)
 ADD CONSTRAINT ENR_CREATED_DATE_NNULL CHECK ('CreatedDate' IS NOT NULL)
/
 
PROMPT Creating Check Constraints on 'STUDENT'
ALTER TABLE STUDENT
 ADD CONSTRAINT STU_REGISTRATION_DATE_NNULL CHECK ('RegistrationDate' IS NOT NULL)
 ADD CONSTRAINT STU_CREATED_BY_NNULL CHECK ('CreatedBy' IS NOT NULL)
 ADD CONSTRAINT STU_LAST_NAME_NNULL CHECK ('LastName' IS NOT NULL)
 ADD CONSTRAINT STU_MODIFIED_DATE_NNULL CHECK ('ModifiedDate ' IS NOT NULL)
 ADD CONSTRAINT STU_STUDENT_ID_NNULL CHECK ('StudentID ' IS NOT NULL)
 ADD CONSTRAINT STU_MODIFIED_BY_NNULL CHECK ('ModifiedBy' IS NOT NULL)
 ADD CONSTRAINT STU_CREATED_DATE_NNULL CHECK ('CreatedDate' IS NOT NULL)
/
 



PROMPT Creating Primary Key on 'INSTRUCTOR'
ALTER TABLE INSTRUCTOR
 ADD CONSTRAINT INST_PK PRIMARY KEY 
  (InstructorID)
/

PROMPT Creating Primary Key on 'GRADE'
ALTER TABLE GRADE
 ADD CONSTRAINT GR_PK PRIMARY KEY 
  (StudentID 
  ,ClassID
 )
/


PROMPT Creating Primary Key on 'CLASS'
ALTER TABLE CLASS
 ADD CONSTRAINT SECT_PK PRIMARY KEY 
  (ClassID)
/

PROMPT Creating Primary Key on 'COURSE'
ALTER TABLE COURSE
 ADD CONSTRAINT CRSE_PK PRIMARY KEY 
  (CourseNo)
/

PROMPT Creating Primary Key on 'ENROLLMENT'
ALTER TABLE ENROLLMENT
 ADD CONSTRAINT ENR_PK PRIMARY KEY 
  (StudentID 
  ,ClassID)
/

PROMPT Creating Primary Key on 'STUDENT'
ALTER TABLE STUDENT
 ADD CONSTRAINT STU_PK PRIMARY KEY 
  (StudentID )
/

PROMPT Creating Unique Keys on 'CLASS'
ALTER TABLE CLASS 
 ADD ( CONSTRAINT SECT_SECT2_UK UNIQUE 
  (ClassNo
  ,CourseNo))
/

PROMPT Creating Foreign Keys on 'GRADE'
ALTER TABLE GRADE 
ADD CONSTRAINT
 GR_ENR_FK FOREIGN KEY 
  (StudentID 
  ,ClassID) REFERENCES ENROLLMENT
  (StudentID 
  ,ClassID) 
/


PROMPT Creating Foreign Keys on 'CLASS'
ALTER TABLE CLASS 
ADD CONSTRAINT
 SECT_INST_FK FOREIGN KEY 
  (InstructorID) REFERENCES INSTRUCTOR
  (InstructorID) 
ADD CONSTRAINT
 SECT_CRSE_FK FOREIGN KEY 
  (CourseNo) REFERENCES COURSE
  (CourseNo)
/

PROMPT Creating Foreign Keys on 'COURSE'
ALTER TABLE COURSE ADD CONSTRAINT
 CRSE_CRSE_FK FOREIGN KEY 
  (Prerequisite) REFERENCES COURSE
  (CourseNo)
/

PROMPT Creating Foreign Keys on 'ENROLLMENT'
ALTER TABLE ENROLLMENT ADD CONSTRAINT
 ENR_STU_FK FOREIGN KEY 
  (StudentID ) REFERENCES STUDENT
  (StudentID ) ADD CONSTRAINT
 ENR_SECT_FK FOREIGN KEY 
  (ClassID) REFERENCES CLASS
  (ClassID)
/
/*Câu a. Viết ràng buộc toàn vẹn mỗi sinh chỉ được đăng kí tối đa 4 môn */

/*Câu b. Viết thủ tục với mỗi môn h�?c in ra các lớp và số lượng sinh viên lớp đó nếu có*/

/*Câu c. Viết hàm nhập vào mã số sinh viên in ra tổng ti�?n mà sinh viên phải trả*/
SET SERVEROUTPUT ON;
SET DEFINE OFF;
CREATE OR REPLACE TRIGGER tga_enrollment
before insert or update on ENROLLMENT
for each row
DECLARE
v_studentid enrollment.StudentID%TYPE;
v_sumsomon number(8,0);
begin
    select count(E.classId) into v_sumsomon
    from Enrollment E
    where :NEW.StudentId = E.StudentId
    group by E.StudentId;
    
    IF(v_sumsomon >= 4)
    THEN
        RAISE_APPLICATION_ERROR(-20000, 'Hoc sinh nay da dang ky qua 4 mon');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Dang ky thanh cong cho');
    end if;
end;

INSERT INTO enrollment VALUES (117,154,'30-JAN-99',NULL,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');                                                                                                    
INSERT INTO enrollment VALUES (117,133,'30-JAN-99',92,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');  
INSERT INTO enrollment VALUES (117,142,'30-JAN-99',92,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');  
INSERT INTO enrollment VALUES (117,86,'30-JAN-99',92,'JAYCAF','03-NOV-99','CBRENNAN','12-DEC-99');  


-- Stored Procedure
CREATE OR REPLACE PROCEDURE prb (isbn int)
IS
CURSOR prb_res 
IS
SELECT Co.CourseNo, C.ClassId, C.Capacity
From Class C
LEFT JOIN Course Co
ON C.CourseNo = Co.CourseNo
Group by Co.CourseNo, C.ClassId, C.Capacity;

begin
    for i in prb_res
    loop
      dbms_output.put_line(i.CourseNo ||' '|| i.ClassId);
    end loop;
end;
set serveroutput on;
begin 
  prb(1);
end;


CREATE OR REPLACE FUNCTION fnc(mssv in number)
return number
IS
CURSOR fnc_res IS
SELECT Co.Cost, E.ClassId, C.CourseNo
FROM COURSE CO, STUDENT S, CLASS C, ENROLLMENT E
WHERE E.StudentId = mssv and E.ClassId=C.ClassId and C.CourseNo = Co.CourseNo
Group by Co.Cost, E.ClassId, C.CourseNo;

sumRes Number(8) := 0;
begin
    for i in fnc_res
    loop
        sumRes:= sumRes+i.Cost;
    end loop;
    return sumRes;
end;
set serveroutput on
DECLARE
test number;
begin
    test := fnc(117);
    dbms_output.put_line('Tong gia hoc phi cua ' || 117 || ' la ' || test);
end;