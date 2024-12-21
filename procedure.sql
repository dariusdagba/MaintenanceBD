CREATE TABLE etudiant(id VARCHAR(15),nom  VARCHAR(15),prenom  VARCHAR(15), noteSRD int, noteCBD int, noteMAB int);
INSERT INTO etudiant VALUES('NICOLE01','MARAN','NICOLE',70,80,60);
INSERT INTO etudiant VALUES('SEKOU01','SEKOU','AHMED',50,30,10);
INSERT INTO etudiant VALUES('DIALLE01','DIALLE','OUSMANE',80,90,85);
INSERT INTO etudiant VALUES('ATIQ01','ATIQ','SALAH',65,60,55);

CREATE OR REPLACE PROCEDURE supp_etudiant(v_identifiant varchar) IS
v_nom etudiant.nom%type;
v_prenom etudiant.prenom%type;
BEGIN
SELECT nom, prenom INTO v_nom,v_prenom FROM etudiant WHERE id=v_identifiant;
DELETE from etudiant WHERE id=v_identifiant;
DBMS_OUTPUT.PUT_LINE(v_nom||' '||v_prenom);
END;

CREATE OR REPLACE FUNCTION somme(v_numb number,v_numb2 number) return number is
v_numb3 number(10);
BEGIN
v_numb3:=v_numb+v_numb2;
return v_numb3;
END;

SET SERVEROUTPUT ON
DECLARE
v_n1 number(10):=&nbre1;
v_n2 number(10):=&nbre2;
v_r number(10);
BEGIN
v_r:=somme(v_n1,v_n2);
DBMS_OUTPUT.PUT_LINE(v_r);
END;

SET SERVEROUTPUT ON
DECLARE
v_id varchar(10):='&identifiant';
BEGIN
supp_etudiant(v_id);
END;
CREATE OR REPLACE PROCEDURE num_tel(v_tel varchar)is
v_n1 varchar(10);
v_n2 varchar(10);
v_n3 varchar(10);
BEGIN
    v_n1:=SUBSTR(v_tel, 1, 3);
    v_n2:=SUBSTR(v_tel, 4, 3);
    v_n3:=SUBSTR(v_tel, 7);
    DBMS_OUTPUT.PUT_LINE('('||v_n1||') '||v_n2||'-'||v_n3);
END;
SET SERVEROUTPUT ON
DECLARE
v_n varchar(10):='5141234567';
BEGIN
num_tel(v_n);
END;
