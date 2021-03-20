COLUMN name FORMAT a20;
SELECT name, open_mode FROM v$pdbs;
SELECT name FROM v$active_services  WHERE con_id =3;

ALTER USER hr IDENTIFIED BY test123 ACCOUNT UNLOCK;


