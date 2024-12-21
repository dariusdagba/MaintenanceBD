-------Exercice1-----
CREATE TABLE CLIENTS(noclient number(20), nom VARCHAR2(30), prenom VARCHAR2(30), telephone VARCHAR2(30),PRIMARY KEY(noclient));
INSERT INTO CLIENTS VALUES(1,'Stephan','jumper','5143201598');
INSERT INTO CLIENTS VALUES(2,'alex','browski','4389201687');
INSERT INTO CLIENTS VALUES(3,'simou','lefdass','5149201683');
DROP TABLE CLIENT
CREATE OR REPLACE PROCEDURE p_printEmps IS
CURSOR c_emp IS select * from clients;
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

SET SERVEROUTPUT ON
BEGIN
p_printEmps();
END;

-----Exercice2-----
CREATE TABLE VOITURE(code varchar(40),marque varchar(30),PRIMARY KEY(code));

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE PROC_Voitures(nbre number,v_marque varchar)is
BEGIN
for i in 1..nbre loop
INSERT into voiture values(v_marque||i,v_marque);
DBMS_OUTPUT.PUT_LINE(v_marque||i||' '||v_marque);
end loop;
END;

SET SERVEROUTPUT ON
DECLARE
v_nbres number(20):=&nbres;
v_marques varchar(30):='&marques';
BEGIN
PROC_Voitures(v_nbres,v_marques);
END;

-----Exercice3----------
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION operation(a number, b number, oper varchar) return number is
r number(20);
BEGIN
    if oper='+' then
        r:=a+b;
        return r;
    elsif oper='-' then
        r:=a-b;
        return r;
    elsif oper='*' then
        r:=a*b;
        return r;
    elsif oper='/' then
        r:=a/b;
        return r;
    else
        return null;
    end if;
END;

DROP FUNCTION operation;

SET SERVEROUTPUT ON
DECLARE
v_a number(20):=&a;
v_b number(20):=&b;
v_op varchar(20):='&op';
v_res number(20);
BEGIN
v_res:=operation(v_a,v_b,v_op);
DBMS_OUTPUT.PUT_LINE('Résultat '||v_res);
END;

---Exercice4-----

CREATE OR REPLACE FUNCTION Factorielle(p_MyNum INTEGER)RETURN
NUMBER iS
BEGIN
IF p_MyNum = 1 THEN
RETURN 1;
ELSE
RETURN(p_MyNum * Factorielle(p_MyNum-1));
END IF;
END;

SET SERVEROUTPUT ON
DECLARE
v_nombre number(20):=&nombres;
v_r number(20);
BEGIN
v_r:=Factorielle(v_nombre);
DBMS_OUTPUT.PUT_LINE('Factoriel de '||v_nombre||' est : '||v_r);
END;

