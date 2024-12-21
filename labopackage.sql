CREATE TABLE CLIENT(noclient number(20), nom VARCHAR2(30), prenom VARCHAR2(30), telephone VARCHAR2(30),PRIMARY KEY(noclient));
INSERT INTO CLIENT VALUES(1,'Stephan','jumper','5143201598');
INSERT INTO CLIENT VALUES(2,'alex','browski','4389201687');
INSERT INTO CLIENT VALUES(3,'simou','lefdass','5149201683');

CREATE TABLE VOITURES(code varchar(40),marque varchar(30),PRIMARY KEY(code));

CREATE OR REPLACE PACKAGE  PACKTP5 as 
    PROCEDURE p_printEmps;
    PROCEDURE PROC_Voitures(nbre number,v_marque varchar);
    FUNCTION Factorielle(p_MyNum INTEGER)RETURN NUMBER;
end PACKTP5;
DROP PACKAGE PACKTP5;

CREATE OR REPLACE package body PACKTP5 as PROCEDURE p_printEmps IS 
    CURSOR c_emp IS select * from client;
    r_emp c_emp%ROWTYPE;
    BEGIN
    OPEN c_emp;
    LOOP
    FETCH c_emp INTO r_emp;
    EXIT WHEN c_emp%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(r_emp.nom);
    END LOOP;
    CLOSE c_emp;
    END;
    PROCEDURE PROC_Voitures(nbre number,v_marque varchar)is
    BEGIN
    for i in 1..nbre loop
    INSERT into voitures values(v_marque||i,v_marque);
    DBMS_OUTPUT.PUT_LINE(v_marque||i||' '||v_marque);
    end loop;
    END;
    FUNCTION Factorielle(p_MyNum INTEGER)RETURN
    NUMBER iS
    BEGIN
    IF p_MyNum = 1 THEN
    RETURN 1;
    ELSE
    RETURN(p_MyNum * Factorielle(p_MyNum-1));
    END IF;
    END;
end PACKTP5;

SET SERVEROUTPUT ON
DECLARE
v_nombre number(20):=&nombres;
v_r number(20);
v_nbres number(20):=&nbres;
v_marques varchar(30):='&marques';
BEGIN
packtp5.p_printemps();
packtp5.PROC_Voitures(v_nbres,v_marques);
v_r:=PACKTP5.Factorielle(v_nombre);
DBMS_OUTPUT.PUT_LINE('Factoriel de '||v_nombre||' est : '||v_r);
END;
