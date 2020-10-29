-- ------------------------------------------------------------------------
--  Name:  CONN.SQL 
-- ------------------------------------------------------------------------
--  Usage: @conn    
--
--  Connects to the first PDB as sysdba
--  Useful where there is only 1 PDB in a MTA environment
--
--  mike.bratt@gmail.com
--  ------------------------------------------------------------------------
--  Modified     DD/MM/YYYY
--  M BRATT      29/10/2020  v1 - Created
--  ------------------------------------------------------------------------
SET TERM OFF TRIM ON TRIMS ON HEA ON FEED OFF PAU OFF VER ON 
CLEAR BRE BUFF COL COMP SQL TIMI
SET LINESIZE 200
SET PAGESIZE 60
CONNECT / AS SYSDBA
DECLARE
  l_pdb V$PDBS.name%TYPE;
BEGIN
  SELECT NAME INTO l_pdb FROM V$PDBS WHERE NAME <> 'PDB$SEED' AND ROWNUM = 1;
  EXECUTE IMMEDIATE 'ALTER SESSION SET CONTAINER=' || l_pdb ;
END;
/
SET TERM ON FEED ON 
SHOW CON_NAME
