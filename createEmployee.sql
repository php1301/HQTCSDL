CREATE TABLE "EMPLOYEE" 
   ("EMPLOYEE_ID" NUMBER PRIMARY KEY, 
	"NAME" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER, 
	"TITLE" VARCHAR2(10 BYTE),
	"CREATED_DATE" DATE,
	"MODIFIED_DATE" DATE
   ) ;
CREATE TABLE "EMPLOYEE_CHANGE" 
   ("EMPLOYEE_ID" NUMBER, 
	"NAME" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER, 
	"TITLE" VARCHAR2(10 BYTE)
   ) ;
Insert into EMPLOYEE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (1,'John',1000,'Analyst');
Insert into EMPLOYEE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (2,'Mary',2000,'Manager');
Insert into EMPLOYEE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (3,'Stella',5000,'President');
Insert into EMPLOYEE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (4,'Fred',500,'Janitor');

Insert into EMPLOYEE_CHANGE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (1,'John',1500,'programmer');
Insert into EMPLOYEE_CHANGE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (3,'Stella',6000,'ceo');
Insert into EMPLOYEE_CHANGE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (3,'Stella',4000,'programmer');
Insert into EMPLOYEE_CHANGE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (4,'Fred',600,'clerk');
Insert into EMPLOYEE_CHANGE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (4,'Fred',300,'sale rep');
Insert into EMPLOYEE_CHANGE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (5,'Jean',800,'secretary');
Insert into EMPLOYEE_CHANGE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (6,'Betsy',2000,'sales rep');
