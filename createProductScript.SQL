--------------------------------------------------------
--  File created - Thursday-March-19-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence S_CUSTOMER_ID
--------------------------------------------------------

   CREATE SEQUENCE  "S_CUSTOMER_ID"  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 216 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence S_DEPT_ID
--------------------------------------------------------

   CREATE SEQUENCE  "S_DEPT_ID"  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 51 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence S_EMP_ID
--------------------------------------------------------

   CREATE SEQUENCE  "S_EMP_ID"  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 26 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence S_ORD_ID
--------------------------------------------------------

   CREATE SEQUENCE  "S_ORD_ID"  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 113 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence S_PRODUCT_ID
--------------------------------------------------------

   CREATE SEQUENCE  "S_PRODUCT_ID"  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 50537 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence S_REGION_ID
--------------------------------------------------------

   CREATE SEQUENCE  "S_REGION_ID"  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table S_CUSTOMER
--------------------------------------------------------

  CREATE TABLE "S_CUSTOMER" 
   (	"ID" NUMBER(7,0), 
	"NAME" VARCHAR2(50 BYTE), 
	"PHONE" VARCHAR2(25 BYTE), 
	"ADDRESS" VARCHAR2(400 BYTE), 
	"CITY" VARCHAR2(30 BYTE), 
	"STATE" VARCHAR2(20 BYTE), 
	"COUNTRY" VARCHAR2(30 BYTE), 
	"ZIP_CODE" VARCHAR2(75 BYTE), 
	"CREDIT_RATING" VARCHAR2(9 BYTE), 
	"SALES_REP_ID" NUMBER(7,0), 
	"REGION_ID" NUMBER(7,0), 
	"COMMENTS" VARCHAR2(255 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table S_DEPT
--------------------------------------------------------

  CREATE TABLE "S_DEPT" 
   (	"ID" NUMBER(7,0), 
	"NAME" VARCHAR2(25 BYTE), 
	"REGION_ID" NUMBER(7,0)
   ) ;
--------------------------------------------------------
--  DDL for Table S_EMP
--------------------------------------------------------

  CREATE TABLE "S_EMP" 
   (	"ID" NUMBER(7,0), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"FIRST_NAME" VARCHAR2(25 BYTE), 
	"USERID" VARCHAR2(8 BYTE), 
	"START_DATE" DATE, 
	"COMMENTS" VARCHAR2(255 BYTE), 
	"MANAGER_ID" NUMBER(7,0), 
	"TITLE" VARCHAR2(25 BYTE), 
	"DEPT_ID" NUMBER(7,0), 
	"SALARY" NUMBER(11,2), 
	"COMMISSION_PCT" NUMBER(4,2)
   ) ;
--------------------------------------------------------
--  DDL for Table S_ITEM
--------------------------------------------------------

  CREATE TABLE "S_ITEM" 
   (	"ORD_ID" NUMBER(7,0), 
	"ITEM_ID" NUMBER(7,0), 
	"PRODUCT_ID" NUMBER(7,0), 
	"PRICE" NUMBER(11,2), 
	"QUANTITY" NUMBER(9,0), 
	"QUANTITY_SHIPPED" NUMBER(9,0)
   ) ;
--------------------------------------------------------
--  DDL for Table S_ORD
--------------------------------------------------------

  CREATE TABLE "S_ORD" 
   (	"ID" NUMBER(7,0), 
	"CUSTOMER_ID" NUMBER(7,0), 
	"DATE_ORDERED" DATE, 
	"DATE_SHIPPED" DATE, 
	"SALES_REP_ID" NUMBER(7,0), 
	"TOTAL" NUMBER(11,2), 
	"PAYMENT_TYPE" VARCHAR2(6 BYTE), 
	"ORDER_FILLED" VARCHAR2(1 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table S_PRODUCT
--------------------------------------------------------

  CREATE TABLE "S_PRODUCT" 
   (	"ID" NUMBER(7,0), 
	"NAME" VARCHAR2(50 BYTE), 
	"SHORT_DESC" VARCHAR2(255 BYTE), 
	"SUGGESTED_WHLSL_PRICE" NUMBER(11,2), 
	"WHLSL_UNITS" VARCHAR2(25 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table S_REGION
--------------------------------------------------------

  CREATE TABLE "S_REGION" 
   (	"ID" NUMBER(7,0), 
	"NAME" VARCHAR2(50 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table S_TITLE
--------------------------------------------------------

  CREATE TABLE "S_TITLE" 
   (	"TITLE" VARCHAR2(25 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table T
--------------------------------------------------------

  CREATE TABLE "T" 
   (	"ID" NUMBER
   ) ;
REM INSERTING into S_CUSTOMER
SET DEFINE OFF;
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (201,'Unisports','55-2066101','72 Via Bahia','Sao Paolo',null,'Brazil',null,'EXCELLENT',12,2,'Customer usually orders large amounts and has a high order total.  This is okay as long as the credit rating remains excellent.');
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (202,'Simms Athletics','81-20101','6741 Takashi Blvd.','Osaka',null,'Japan',null,'POOR',14,4,'Customer should always pay by cash until his credit rating improves.');
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (203,'Delhi Sports','91-10351','11368 Chanakya','New Delhi',null,'India',null,'GOOD',14,4,'Customer specializes in baseball equipment and is the largest retailer in India.');
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (204,'Womansport','1-206-104-0103','281 King Street','Seattle','Washington','USA','98101','EXCELLENT',11,1,null);
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (205,'Kam''s Sporting Goods','852-3692888','15 Henessey Road','Hong Kong',null,null,null,'EXCELLENT',15,4,null);
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (206,'Sportique','33-2257201','172 Rue de Rivoli','Cannes',null,'France',null,'EXCELLENT',15,5,'Customer specializes in Soccer.  Likes to order accessories in bright colors.');
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (207,'Sweet Rock Sports','234-6036201','6 Saint Antoine','Lagos',null,'Nigeria',null,'GOOD',null,3,null);
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (208,'Muench Sports','49-527454','435 Gruenestrasse','Stuttgart',null,'Germany',null,'GOOD',15,5,'Customer usually pays small orders by cash and large orders on credit.');
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (209,'Beisbol Si!','809-352689','792 Playa Del Mar','San Pedro de Macon''s',null,'Dominican Republic',null,'EXCELLENT',11,1,null);
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (210,'Futbol Sonora','52-404562','3 Via Saguaro','Nogales',null,'Mexico',null,'EXCELLENT',12,2,'Customer is difficult to reach by phone.  Try mail.');
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (211,'Kuhn''s Sports','42-111292','7 Modrany','Prague',null,'Czechoslovakia',null,'EXCELLENT',15,5,null);
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (212,'Hamada Sport','20-1209211','57A Corniche','Alexandria',null,'Egypt',null,'EXCELLENT',13,3,'Customer orders sea and water equipment.');
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (213,'Big John''s Sports Emporium','1-415-555-6281','4783 18th Street','San Francisco','CA','USA','94117','EXCELLENT',11,1,'Customer has a dependable credit record.');
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (214,'Ojibway Retail','1-716-555-7171','415 Main Street','Buffalo','NY','USA','14202','POOR',11,1,null);
Insert into S_CUSTOMER (ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS) values (215,'Sporta Russia','7-3892456','6000 Yekatamina','Saint Petersburg',null,'Russia',null,'POOR',15,5,'This customer is very friendly, but has difficulty paying bills.  Insist upon cash.');
REM INSERTING into S_DEPT
SET DEFINE OFF;
Insert into S_DEPT (ID,NAME,REGION_ID) values (10,'Finance',1);
Insert into S_DEPT (ID,NAME,REGION_ID) values (31,'Sales',1);
Insert into S_DEPT (ID,NAME,REGION_ID) values (32,'Sales',2);
Insert into S_DEPT (ID,NAME,REGION_ID) values (33,'Sales',3);
Insert into S_DEPT (ID,NAME,REGION_ID) values (34,'Sales',4);
Insert into S_DEPT (ID,NAME,REGION_ID) values (35,'Sales',5);
Insert into S_DEPT (ID,NAME,REGION_ID) values (41,'Operations',1);
Insert into S_DEPT (ID,NAME,REGION_ID) values (42,'Operations',2);
Insert into S_DEPT (ID,NAME,REGION_ID) values (43,'Operations',3);
Insert into S_DEPT (ID,NAME,REGION_ID) values (44,'Operations',4);
Insert into S_DEPT (ID,NAME,REGION_ID) values (45,'Operations',5);
Insert into S_DEPT (ID,NAME,REGION_ID) values (50,'Administration',1);
REM INSERTING into S_EMP
SET DEFINE OFF;
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (1,'Velasquez','Carmen','cvelasqu',to_date('03-MAR-90','DD-MON-RR'),null,null,'President',50,2500,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (2,'Ngao','LaDoris','lngao',to_date('08-MAR-90','DD-MON-RR'),null,1,'VP, Operations',41,1450,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (3,'Nagayama','Midori','mnagayam',to_date('17-JUN-91','DD-MON-RR'),null,1,'VP, Sales',31,1400,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (4,'Quick-To-See','Mark','mquickto',to_date('07-APR-90','DD-MON-RR'),null,1,'VP, Finance',10,1450,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (5,'Ropeburn','Audry','aropebur',to_date('04-MAR-90','DD-MON-RR'),null,1,'VP, Administration',50,1550,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (6,'Urguhart','Molly','murguhar',to_date('18-JAN-91','DD-MON-RR'),null,2,'Warehouse Manager',41,1200,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (7,'Menchu','Roberta','rmenchu',to_date('14-MAY-90','DD-MON-RR'),null,2,'Warehouse Manager',42,1250,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (8,'Biri','Ben','bbiri',to_date('07-APR-90','DD-MON-RR'),null,2,'Warehouse Manager',43,1100,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (9,'Catchpole','Antoinette','acatchpo',to_date('09-FEB-92','DD-MON-RR'),null,2,'Warehouse Manager',44,1300,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (10,'Havel','Marta','mhavel',to_date('27-FEB-91','DD-MON-RR'),null,2,'Warehouse Manager',45,1307,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (11,'Magee','Colin','cmagee',to_date('14-MAY-90','DD-MON-RR'),null,3,'Sales Representative',31,1400,10);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (12,'Giljum','Henry','hgiljum',to_date('18-JAN-92','DD-MON-RR'),null,3,'Sales Representative',32,1490,12.5);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (13,'Sedeghi','Yasmin','ysedeghi',to_date('18-FEB-91','DD-MON-RR'),null,3,'Sales Representative',33,1515,10);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (14,'Nguyen','Mai','mnguyen',to_date('22-JAN-92','DD-MON-RR'),null,3,'Sales Representative',34,1525,15);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (15,'Dumas','Andre','adumas',to_date('09-OCT-91','DD-MON-RR'),null,3,'Sales Representative',35,1450,17.5);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (16,'Maduro','Elena','emaduro',to_date('07-FEB-92','DD-MON-RR'),null,6,'Stock Clerk',41,1400,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (17,'Smith','George','gsmith',to_date('08-MAR-90','DD-MON-RR'),null,6,'Stock Clerk',41,940,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (18,'Nozaki','Akira','anozaki',to_date('09-FEB-91','DD-MON-RR'),null,7,'Stock Clerk',42,1200,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (19,'Patel','Vikram','vpatel',to_date('06-AUG-91','DD-MON-RR'),null,7,'Stock Clerk',42,795,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (20,'Newman','Chad','cnewman',to_date('21-JUL-91','DD-MON-RR'),null,8,'Stock Clerk',43,750,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (21,'Markarian','Alexander','amarkari',to_date('26-MAY-91','DD-MON-RR'),null,8,'Stock Clerk',43,850,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (22,'Chang','Eddie','echang',to_date('30-NOV-90','DD-MON-RR'),null,9,'Stock Clerk',44,800,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (23,'Patel','Radha','rpatel',to_date('17-OCT-90','DD-MON-RR'),null,9,'Stock Clerk',34,795,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (24,'Dancs','Bela','bdancs',to_date('17-MAR-91','DD-MON-RR'),null,10,'Stock Clerk',45,860,null);
Insert into S_EMP (ID,LAST_NAME,FIRST_NAME,USERID,START_DATE,COMMENTS,MANAGER_ID,TITLE,DEPT_ID,SALARY,COMMISSION_PCT) values (25,'Schwartz','Sylvie','sschwart',to_date('09-MAY-91','DD-MON-RR'),null,10,'Stock Clerk',45,1100,null);
REM INSERTING into S_ITEM
SET DEFINE OFF;
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (100,1,10011,135,500,500);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (100,2,10013,380,400,400);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (100,3,10021,14,500,500);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (100,5,30326,582,600,600);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (100,7,41010,8,250,250);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (100,6,30433,20,450,450);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (100,4,10023,36,400,400);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (101,1,30421,16,15,15);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (101,3,41010,8,20,20);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (101,5,50169,4.29,40,40);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (101,6,50417,80,27,27);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (101,7,50530,45,50,50);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (101,4,41100,45,35,35);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (101,2,40422,50,30,30);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (102,1,20108,28,100,100);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (102,2,20201,123,45,45);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (103,1,30433,20,15,15);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (103,2,32779,7,11,11);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (104,1,20510,9,7,7);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (104,4,30421,16,35,35);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (104,2,20512,8,12,12);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (104,3,30321,1669,19,19);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (105,1,50273,22.89,16,16);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (105,3,50532,47,28,28);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (105,2,50419,80,13,13);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (106,1,20108,28,46,46);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (106,4,50273,22.89,75,75);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (106,5,50418,75,98,98);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (106,6,50419,80,27,27);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (106,2,20201,123,21,21);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (106,3,50169,4.29,125,125);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (107,1,20106,11,50,50);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (107,3,20201,115,130,130);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (107,5,30421,16,55,55);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (107,4,30321,1669,75,75);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (107,2,20108,28,22,22);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (108,1,20510,9,9,9);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (108,6,41080,35,50,50);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (108,7,41100,45,42,42);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (108,5,32861,60,57,57);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (108,2,20512,8,18,18);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (108,4,32779,7,60,60);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (108,3,30321,1669,85,85);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (109,1,10011,140,150,150);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (109,5,30426,18.25,500,500);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (109,7,50418,75,43,43);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (109,6,32861,60,50,50);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (109,4,30326,582,1500,1500);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (109,2,10012,175,600,600);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (109,3,10022,21.95,300,300);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (110,1,50273,22.89,17,17);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (110,2,50536,50,23,23);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (111,1,40421,65,27,27);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (111,2,41080,35,29,29);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (97,1,20106,9,1000,1000);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (97,2,30321,1500,50,50);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (98,1,40421,85,7,7);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (99,1,20510,9,18,18);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (99,2,20512,8,25,25);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (99,3,50417,80,53,53);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (99,4,50530,45,69,69);
Insert into S_ITEM (ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED) values (112,1,20106,11,50,50);
REM INSERTING into S_ORD
SET DEFINE OFF;
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (100,204,to_date('31-AUG-92','DD-MON-RR'),to_date('10-SEP-92','DD-MON-RR'),11,601100,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (101,205,to_date('31-AUG-92','DD-MON-RR'),to_date('15-SEP-92','DD-MON-RR'),14,8056.6,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (102,206,to_date('01-SEP-92','DD-MON-RR'),to_date('08-SEP-92','DD-MON-RR'),15,8335,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (103,208,to_date('02-SEP-92','DD-MON-RR'),to_date('22-SEP-92','DD-MON-RR'),15,377,'CASH','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (104,208,to_date('03-SEP-92','DD-MON-RR'),to_date('23-SEP-92','DD-MON-RR'),15,32430,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (105,209,to_date('04-SEP-92','DD-MON-RR'),to_date('18-SEP-92','DD-MON-RR'),11,2722.24,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (106,210,to_date('07-SEP-92','DD-MON-RR'),to_date('15-SEP-92','DD-MON-RR'),12,15634,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (107,211,to_date('07-SEP-92','DD-MON-RR'),to_date('21-SEP-92','DD-MON-RR'),15,142171,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (108,212,to_date('07-SEP-92','DD-MON-RR'),to_date('10-SEP-92','DD-MON-RR'),13,149570,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (109,213,to_date('08-SEP-92','DD-MON-RR'),to_date('28-SEP-92','DD-MON-RR'),11,1020935,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (110,214,to_date('09-SEP-92','DD-MON-RR'),to_date('21-SEP-92','DD-MON-RR'),11,1539.13,'CASH','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (111,204,to_date('09-SEP-92','DD-MON-RR'),to_date('21-SEP-92','DD-MON-RR'),11,2770,'CASH','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (97,201,to_date('28-AUG-92','DD-MON-RR'),to_date('17-SEP-92','DD-MON-RR'),12,84000,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (98,202,to_date('31-AUG-92','DD-MON-RR'),to_date('10-SEP-92','DD-MON-RR'),14,595,'CASH','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (99,203,to_date('31-AUG-92','DD-MON-RR'),to_date('18-SEP-92','DD-MON-RR'),14,7707,'CREDIT','Y');
Insert into S_ORD (ID,CUSTOMER_ID,DATE_ORDERED,DATE_SHIPPED,SALES_REP_ID,TOTAL,PAYMENT_TYPE,ORDER_FILLED) values (112,210,to_date('31-AUG-92','DD-MON-RR'),to_date('10-SEP-92','DD-MON-RR'),12,550,'CREDIT','Y');
REM INSERTING into S_PRODUCT
SET DEFINE OFF;
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (10011,'Bunny Boot','Beginner''s ski boot',150,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (10012,'Ace Ski Boot','Intermediate ski boot',200,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (10013,'Pro Ski Boot','Advanced ski boot',410,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (10021,'Bunny Ski Pole','Beginner''s ski pole',16.25,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (10022,'Ace Ski Pole','Intermediate ski pole',21.95,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (10023,'Pro Ski Pole','Advanced ski pole',40.95,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (20106,'Junior Soccer Ball','Junior soccer ball',11,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (20108,'World Cup Soccer Ball','World cup soccer ball',28,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (20201,'World Cup Net','World cup net',123,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (20510,'Black Hawk Knee Pads','Knee pads, pair',9,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (20512,'Black Hawk Elbow Pads','Elbow pads, pair',8,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (30321,'Grand Prix Bicycle','Road bicycle',1669,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (30326,'Himalaya Bicycle','Mountain bicycle',582,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (30421,'Grand Prix Bicycle Tires','Road bicycle tires',16,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (30426,'Himalaya Tires','Mountain bicycle tires',18.25,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (30433,'New Air Pump','Tire pump',20,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (32779,'Slaker Water Bottle','Water bottle',7,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (32861,'Safe-T Helmet','Bicycle helmet',60,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (40421,'Alexeyer Pro Lifting Bar','Straight bar',65,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (40422,'Pro Curling Bar','Curling bar',50,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (41010,'Prostar 10 Pound Weight','Ten pound weight',8,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (41020,'Prostar 20 Pound Weight','Twenty pound weight',12,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (41050,'Prostar 50 Pound Weight','Fifty pound weight',25,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (41080,'Prostar 80 Pound Weight','Eighty pound weight',35,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (41100,'Prostar 100 Pound Weight','One hundred pound weight',45,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (50169,'Major League Baseball','Baseball',4.29,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (50273,'Chapman Helmet','Batting helmet',22.89,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (50417,'Griffey Glove','Outfielder''s glove',80,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (50418,'Alomar Glove','Infielder''s glove',75,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (50419,'Steinbach Glove','Catcher''s glove',80,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (50530,'Cabrera Bat','Thirty inch bat',45,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (50532,'Puckett Bat','Thirty-two inch bat',47,null);
Insert into S_PRODUCT (ID,NAME,SHORT_DESC,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS) values (50536,'Winfield Bat','Thirty-six inch bat',50,null);
REM INSERTING into S_REGION
SET DEFINE OFF;
Insert into S_REGION (ID,NAME) values (1,'North America');
Insert into S_REGION (ID,NAME) values (2,'South America');
Insert into S_REGION (ID,NAME) values (3,'Africa / Middle East');
Insert into S_REGION (ID,NAME) values (4,'Asia');
Insert into S_REGION (ID,NAME) values (5,'Europe');
REM INSERTING into S_TITLE
SET DEFINE OFF;
Insert into S_TITLE (TITLE) values ('President');
Insert into S_TITLE (TITLE) values ('Sales Representative');
Insert into S_TITLE (TITLE) values ('Stock Clerk');
Insert into S_TITLE (TITLE) values ('VP, Administration');
Insert into S_TITLE (TITLE) values ('VP, Finance');
Insert into S_TITLE (TITLE) values ('VP, Operations');
Insert into S_TITLE (TITLE) values ('VP, Sales');
Insert into S_TITLE (TITLE) values ('Warehouse Manager');
REM INSERTING into T
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index S_CUSTOMER_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_CUSTOMER_ID_PK" ON "S_CUSTOMER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index S_DEPT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_DEPT_ID_PK" ON "S_DEPT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index S_DEPT_NAME_REGION_ID_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_DEPT_NAME_REGION_ID_UK" ON "S_DEPT" ("NAME", "REGION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index S_EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_EMP_ID_PK" ON "S_EMP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index S_EMP_USERID_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_EMP_USERID_UK" ON "S_EMP" ("USERID") 
  ;
--------------------------------------------------------
--  DDL for Index S_ITEM_ORDID_ITEMID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_ITEM_ORDID_ITEMID_PK" ON "S_ITEM" ("ORD_ID", "ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index S_ITEM_ORDID_PRODID_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_ITEM_ORDID_PRODID_UK" ON "S_ITEM" ("ORD_ID", "PRODUCT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index S_ORD_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_ORD_ID_PK" ON "S_ORD" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index S_PRODUCT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_PRODUCT_ID_PK" ON "S_PRODUCT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index S_PRODUCT_NAME_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_PRODUCT_NAME_UK" ON "S_PRODUCT" ("NAME") 
  ;
--------------------------------------------------------
--  DDL for Index S_REGION_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_REGION_ID_PK" ON "S_REGION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index S_REGION_NAME_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_REGION_NAME_UK" ON "S_REGION" ("NAME") 
  ;
--------------------------------------------------------
--  DDL for Index S_TITLE_TITLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "S_TITLE_TITLE_PK" ON "S_TITLE" ("TITLE") 
  ;
--------------------------------------------------------
--  Constraints for Table S_TITLE
--------------------------------------------------------

  ALTER TABLE "S_TITLE" MODIFY ("TITLE" CONSTRAINT "S_TITLE_TITLE_NN" NOT NULL ENABLE);
  ALTER TABLE "S_TITLE" ADD CONSTRAINT "S_TITLE_TITLE_PK" PRIMARY KEY ("TITLE")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table S_ITEM
--------------------------------------------------------

  ALTER TABLE "S_ITEM" MODIFY ("ORD_ID" CONSTRAINT "S_ITEM_ORD_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_ITEM" MODIFY ("ITEM_ID" CONSTRAINT "S_ITEM_ITEM_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_ITEM" MODIFY ("PRODUCT_ID" CONSTRAINT "S_ITEM_PRODUCT_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_ITEM" ADD CONSTRAINT "S_ITEM_ORDID_ITEMID_PK" PRIMARY KEY ("ORD_ID", "ITEM_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "S_ITEM" ADD CONSTRAINT "S_ITEM_ORDID_PRODID_UK" UNIQUE ("ORD_ID", "PRODUCT_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table S_CUSTOMER
--------------------------------------------------------

  ALTER TABLE "S_CUSTOMER" MODIFY ("ID" CONSTRAINT "S_CUSTOMER_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_CUSTOMER" MODIFY ("NAME" CONSTRAINT "S_CUSTOMER_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "S_CUSTOMER" ADD CONSTRAINT "S_CUSTOMER_CREDIT_RATING_CK" CHECK (credit_rating IN ('EXCELLENT', 'GOOD', 'POOR')) ENABLE;
  ALTER TABLE "S_CUSTOMER" ADD CONSTRAINT "S_CUSTOMER_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table S_ORD
--------------------------------------------------------

  ALTER TABLE "S_ORD" MODIFY ("ID" CONSTRAINT "S_ORD_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_ORD" MODIFY ("CUSTOMER_ID" CONSTRAINT "S_ORD_CUSTOMER_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_ORD" ADD CONSTRAINT "S_ORD_PAYMENT_TYPE_CK" CHECK (payment_type in ('CASH', 'CREDIT')) ENABLE;
  ALTER TABLE "S_ORD" ADD CONSTRAINT "S_ORD_ORDER_FILLED_CK" CHECK (order_filled in ('Y', 'N')) ENABLE;
  ALTER TABLE "S_ORD" ADD CONSTRAINT "S_ORD_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table S_PRODUCT
--------------------------------------------------------

  ALTER TABLE "S_PRODUCT" MODIFY ("ID" CONSTRAINT "S_PRODUCT_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_PRODUCT" MODIFY ("NAME" CONSTRAINT "S_PRODUCT_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "S_PRODUCT" ADD CONSTRAINT "S_PRODUCT_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "S_PRODUCT" ADD CONSTRAINT "S_PRODUCT_NAME_UK" UNIQUE ("NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table S_REGION
--------------------------------------------------------

  ALTER TABLE "S_REGION" ADD CONSTRAINT "S_REGION_NAME_UK" UNIQUE ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "S_REGION" MODIFY ("ID" CONSTRAINT "S_REGION_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_REGION" MODIFY ("NAME" CONSTRAINT "S_REGION_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "S_REGION" ADD CONSTRAINT "S_REGION_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table S_DEPT
--------------------------------------------------------

  ALTER TABLE "S_DEPT" MODIFY ("ID" CONSTRAINT "S_DEPT_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_DEPT" MODIFY ("NAME" CONSTRAINT "S_DEPT_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "S_DEPT" ADD CONSTRAINT "S_DEPT_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "S_DEPT" ADD CONSTRAINT "S_DEPT_NAME_REGION_ID_UK" UNIQUE ("NAME", "REGION_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table S_EMP
--------------------------------------------------------

  ALTER TABLE "S_EMP" MODIFY ("ID" CONSTRAINT "S_EMP_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_EMP" MODIFY ("LAST_NAME" CONSTRAINT "S_EMP_LAST_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "S_EMP" MODIFY ("USERID" CONSTRAINT "S_EMP_USERID_NN" NOT NULL ENABLE);
  ALTER TABLE "S_EMP" ADD CONSTRAINT "S_EMP_COMMISSION_PCT_CK" CHECK (commission_pct IN (10, 12.5, 15, 17.5, 20)) ENABLE;
  ALTER TABLE "S_EMP" ADD CONSTRAINT "S_EMP_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "S_EMP" ADD CONSTRAINT "S_EMP_USERID_UK" UNIQUE ("USERID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table S_CUSTOMER
--------------------------------------------------------

  ALTER TABLE "S_CUSTOMER" ADD CONSTRAINT "S_SALES_REP_ID_FK" FOREIGN KEY ("SALES_REP_ID")
	  REFERENCES "S_EMP" ("ID") ENABLE;
  ALTER TABLE "S_CUSTOMER" ADD CONSTRAINT "S_CUSTOMER_REGION_ID_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "S_REGION" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table S_DEPT
--------------------------------------------------------

  ALTER TABLE "S_DEPT" ADD CONSTRAINT "S_DEPT_REGION_ID_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "S_REGION" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table S_EMP
--------------------------------------------------------

  ALTER TABLE "S_EMP" ADD CONSTRAINT "S_EMP_MANAGER_ID_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "S_EMP" ("ID") ENABLE;
  ALTER TABLE "S_EMP" ADD CONSTRAINT "S_EMP_DEPT_ID_FK" FOREIGN KEY ("DEPT_ID")
	  REFERENCES "S_DEPT" ("ID") ENABLE;
  ALTER TABLE "S_EMP" ADD CONSTRAINT "S_EMP_TITLE_FK" FOREIGN KEY ("TITLE")
	  REFERENCES "S_TITLE" ("TITLE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table S_ITEM
--------------------------------------------------------

  ALTER TABLE "S_ITEM" ADD CONSTRAINT "S_ITEM_ORD_ID_FK" FOREIGN KEY ("ORD_ID")
	  REFERENCES "S_ORD" ("ID") ENABLE;
  ALTER TABLE "S_ITEM" ADD CONSTRAINT "S_ITEM_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "S_PRODUCT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table S_ORD
--------------------------------------------------------

  ALTER TABLE "S_ORD" ADD CONSTRAINT "S_ORD_CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "S_CUSTOMER" ("ID") ENABLE;
  ALTER TABLE "S_ORD" ADD CONSTRAINT "S_ORD_SALES_REP_ID_FK" FOREIGN KEY ("SALES_REP_ID")
	  REFERENCES "S_EMP" ("ID") ENABLE;