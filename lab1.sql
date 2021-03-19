-- CAU 1
SELECT * FROM S_EMP
WHERE S_EMP.id = 23

-- CAU 2

SELECT E.first_name || last_name as fullname, dept_id
FROM S_EMP E
where E.dept_id between 10 and 50
ORDER BY E.first_name DESC


-- CAU 3
SELECT E.first_name || last_name as fullname, dept_id
FROM S_EMP E
where E.last_name like '%s'

-- CAU 4
SELECT E.id, E.start_date
from S_EMP E
where E.start_date between '5-MAY-90' and '26-MAY-90'

-- CAU 5
SELECT E.id, E.salary
from S_EMP E

MINUS

SELECT E.id, E.salary
from S_EMP E
where E.salary between 1000 and 2500

-- CAU 6
SELECT E.last_name as Lastname , salary as salaryPerMonth, dept_id
from S_EMP E
where E.salary > 1350 AND E.dept_id in (31, 42, 50)
-- CAU 7
SELECT E.last_name, start_date
from S_EMP E
where EXTRACT( year from e.start_date)=1991
-- CAU 8
SELECT E.ID, last_name, first_name, ROUND(salary*1.15) as SALARY15PCT
FROM S_EMP E, DUAL
-- CAU 9
select e.last_name || '(' ||  title || ')' as NameDept
from S_EMP E
-- CAU 10
SELECT P.name
from S_Product P
where lower(P.name) like '%ski%'
-- CAU 11
SELECT E.LAST_NAME, ROUND(MONTHS_BETWEEN(SYSDATE,E.start_date),0) as MONTHS_WORKED
FROM S_EMP E
ORDER BY 2;
-- CAU 12

select max(O.total) as Max, min(O.total) as Min
from S_ORD O

-- CAU 13

SELECT P.name, P.id, I.quantity as ORDERED, O.id
FROM S_PRODUCT P, S_ORD O, S_ITEM I
WHERE I.product_id = P.id and I.ord_id = 101 and I.ord_id = O.id

-- CAU 14

SELECT C.ID, E.last_name as RESLAST
FROM S_CUSTOMER C, S_EMP E, S_ORD O
WHERE C.SALES_REP_ID = O.SALES_REP_ID AND C.SALES_REP_ID = E.ID
ORDER BY E.last_name

-- CAU 15
SELECT C.ID, C.NAME, O.ID
FROM S_CUSTOMER C
LEFT JOIN S_ORD O
ON C.ID = O.CUSTOMER_ID

-- CAU 16
SELECT E.LAST_NAME, E.ID, M.LAST_NAME as MLAST , M.ID AS MID
FROM S_EMP E
INNER JOIN 
S_EMP M
ON E.MANAGER_ID=M.ID

-- CAU 17
SELECT C.ID, C.name, I.Product_ID
FROM S_CUSTOMER C, S_ITEM I, S_ORD O
WHERE O.CUSTOMER_ID = C.ID and O.ID = I.ORD_ID and O.total >100000


-- CAU 18
SELECT E.LAST_NAME, E.ID
FROM S_EMP E


MINUS

SELECT E.LAST_NAME, E.ID
FROM S_EMP E
INNER JOIN 
S_EMP M
ON E.MANAGER_ID=M.ID

-- CAU 19
SELECT P.NAME
FROM S_PRODUCT P
WHERE  P.NAME LIKE 'Pro%'
ORDER BY P.NAME 
-- CAU 20
SELECT P.NAME, SHORT_DESC
FROM S_PRODUCT P
WHERE lower(P.SHORT_DESC) LIKE '%bicycle%'
ORDER BY P.NAME 
-- CAU 21 
SELECT COUNT(DISTINCT E.MANAGER_ID)
FROM S_EMP E

-- CAU 22
SELECT P.ID, COUNT(O.ID) AS TIMESORDERED
FROM S_PRODUCT P, S_ORD O, S_ITEM I
WHERE P.ID = I.PRODUCT_ID AND I.ORD_ID = O.ID
GROUP BY P.ID
HAVING  COUNT(O.ID) >= 3
ORDER BY TIMESORDERED

-- CAU 23
SELECT R.ID, R.NAME, COUNT (D.ID) AS REGIONDEPARTMENT
FROM S_REGION R, S_DEPT D
WHERE R.ID = D.REGION_ID
GROUP BY R.ID, R.NAME

-- CAU 24
SELECT C.NAME, COUNT(O.ID) AS CUSORDER
FROM S_CUSTOMER c, S_ORD O
WHERE c.ID = O.CUSTOMER_ID
GROUP BY C.NAME

-- CAU 25
SELECT AVG(SALARY)
FROM S_EMP E

SELECT E.ID, FIRST_NAME, LAST_NAME, USERID, SALARY
FROM S_EMP E
WHERE E.SALARY > (SELECT AVG(SALARY) FROM S_EMP)

-- CAU 26

SELECT E.ID, FIRST_NAME, LAST_NAME
FROM S_EMP E
WHERE E.SALARY > (SELECT AVG(SALARY) FROM S_EMP) AND E.DEPT_ID IN (
    SELECT DEPT_ID
    FROM S_EMP
    WHERE lower(LAST_NAME) LIKE '%t%'
)

-- Cau 27
SELECT E.TITLE, MAX(e.SALARY) as MaxJob, MIN(e.SALARY) as MinJob
from s_emp E
group by E.title
order by e.title