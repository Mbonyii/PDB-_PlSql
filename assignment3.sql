--create user/
CREATE USER C##na_plsqlauca IDENTIFIED BY auca;
GRANT ALL PRIVILEGES TO C##na_plsqlauca;
--
----create pdb
SHOW con_name;
ALTER SESSION SET container = CDB$ROOT;
CREATE PLUGGABLE DATABASE na_to_delete_pdb
ADMIN USER na_plsqlauca IDENTIFIED BY auca
FILE_NAME_CONVERT = ('C:\ORACLE_21C\ORADATA\ORCL\PDBSEED\', 'C:\ORACLE_21C\ORADATA\ORCL\PDBSEED\na_to_delete_pdb\');

----after creation this is how you connecto to pdb
ALTER SESSION SET CONTAINER = CDB$ROOT;
CONNECT SYS/1234 AS SYSDBA;
ALTER PLUGGABLE DATABASE na_to_delete_pdb OPEN;
ALTER SESSION SET CONTAINER = na_to_delete_pdb;
ALTER SESSION SET CONTAINER = na_to_delete_pdb;

------delete pdb
CONNECT SYS/1234 AS SYSDBA;
ALTER SESSION SET CONTAINER = CDB$ROOT;
ALTER PLUGGABLE DATABASE na_to_delete_pdb CLOSE IMMEDIATE;
DROP PLUGGABLE DATABASE na_to_delete_pdb INCLUDING DATAFILES;
SELECT con_id, name, open_mode FROM v$containers;




