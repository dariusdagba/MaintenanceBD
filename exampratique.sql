----question1-----
CREATE TABLE JOUEURS( ID_Joueurs number(20),Nom VARCHAR(40), Salaire decimal(10,2),ID_EQUIPE number(20),PRIMARY KEY(ID_Joueurs));
CREATE TABLE EQUIPE(ID_EQUIPE number(20), NOM_EQUIPE VARCHAR(50),PRIMARY KEY(ID_EQUIPE) );
ALTER TABLE JOUEURS ADD CONSTRAINT fk_joueur_equipe FOREIGN KEY(ID_EQUIPE) REFERENCES EQUIPE(ID_EQUIPE);

----question2-----
INSERT INTO EQUIPE VALUES(1,'BAYEN MUNICH');
INSERT INTO EQUIPE VALUES(2,'REAL MADRID');
INSERT INTO EQUIPE VALUES(3,'FC BARCELONE');
INSERT INTO EQUIPE VALUES(4,'FC MIAMI');

INSERT INTO JOUEURS VALUES(1,'LIONEL MESSI',550000.00,4);
INSERT INTO JOUEURS VALUES(2,'DAVID ALABA',150000.00,2);
INSERT INTO JOUEURS VALUES(3,'HARRY KEAN',230000.00,1);
INSERT INTO JOUEURS VALUES(4,'VINICIUS JUNIOR',270000.00,2);
INSERT INTO JOUEURS VALUES(5,'MARC TER STEGEN',210000.00,3);
INSERT INTO JOUEURS VALUES(6,'RONALD ARAUJO',190000.00,3);

----question3-----
SET SERVEROUTPUT ON 
DECLARE 
 cursor Cur_dec_gr2 is
 SELECT Nom, Salaire, NOM_EQUIPE FROM JOUEURS JOIN EQUIPE ON JOUEURS.ID_EQUIPE=EQUIPE.ID_EQUIPE;
 v_jou Cur_dec_gr2%rowtype;
 BEGIN
    open Cur_dec_gr2;
    loop
    fetch Cur_dec_gr2 into v_jou;
    exit when Cur_dec_gr2%notfound;
    DBMS_OUTPUT.PUT_LINE('Nom : '||v_jou.Nom||' Salaire : '||v_jou.Salaire||' Equipe : '||v_jou.NOM_EQUIPE);
    end loop;
    close Cur_dec_gr2;
 END;

----question4-----
SET SERVEROUTPUT ON
DECLARE
cursor Cur_dec_gr2 is
 SELECT Nom, Salaire, NOM_EQUIPE FROM JOUEURS JOIN EQUIPE ON JOUEURS.ID_EQUIPE=EQUIPE.ID_EQUIPE WHERE Salaire>200000.00;
 v_jou Cur_dec_gr2%rowtype;
BEGIN
open Cur_dec_gr2;
 fetch Cur_dec_gr2 into v_jou;
 while Cur_dec_gr2%found loop
 DBMS_OUTPUT.PUT_LINE('Nom : '||v_jou.Nom||' Salaire : '||v_jou.Salaire||' Equipe : '||v_jou.NOM_EQUIPE);
 fetch Cur_dec_gr2 into v_jou;
 end loop;
close Cur_dec_gr2;
END;
