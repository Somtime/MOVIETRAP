CREATE TABLE employee (
 id 	VARCHAR2(10) NOT NULL PRIMARY KEY,
 pass 	VARCHAR2(10)NOT NULL,
 name	VARCHAR2(24),
 lev	CHAR(1) DEFAULT'A',
 enter	DATE DEFAULT SYSDATE,
 gender	CHAR(1) DEFAULT '1',
 phone	VARCHAR2(30)
);

INSERT INTO employee (id, pass, name, lev, gender, phone)
    VALUES('sslee','1234','ÀÌ¼ø½Å','B','1','010-1111-2222');
    
COMMIT;