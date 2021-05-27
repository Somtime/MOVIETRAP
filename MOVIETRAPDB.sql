-- TableSpace
CREATE TABLESPACE MOVIETRAP 
DATAFILE 'D:\DB\MOVIETRAPTS.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 10M;

-- Create User
ALTER SESSION SET"_ORACLE_SCRIPT" = TRUE;
select * from member;
CREATE USER MOVIETRAPDB IDENTIFIED BY ora123
DEFAULT TABLESPACE MOVIETRAP;
GRANT create session to MOVIETRAPDB;
GRANT create view, alter user to MOVIETRAPDB;
GRANT dba to MOVIETRAPDB;
COMMIT;

select * from member;
insert into member (image) values("default.png") where name="Gum" ;

-- Create Table

-- Member Table
DROP TABLE member CASCADE CONSTRAINTS;
CREATE TABLE member(
email       VARCHAR2(50) PRIMARY KEY,
pwd         VARCHAR2(50) NOT NULL,
name        VARCHAR2(50) NOT NULL,
image       VARCHAR2(50) DEFAULT 'user.png',
regdate     DATE         DEFAULT SYSDATE,
phone       VARCHAR2(40),
newsletter  CHAR    DEFAULT 'n',
pay_name    VARCHAR2(100),
pay_num     VARCHAR2(40),
pay_num_lstfour VARCHAR2(20),
pay_cvc     NUMBER  ,
pay_date    DATE    DEFAULT SYSDATE,
pay_exp_date   VARCHAR2(20),
pay_exp_yr  NUMBER,  
admin       CHAR    DEFAULT 'n'
);

-- Review Table
DROP TABLE review CASCADE CONSTRAINTS;
CREATE TABLE review (
rseq        NUMBER(5)    PRIMARY KEY,
writer      VARCHAR2(50) REFERENCES member(email),
pub_date    DATE    NOT NULL, 
title       VARCHAR2(50)    NOT NULL,
description VARCHAR2(1000)  NOT NULL,
score       NUMBER NOT NULL,
regdate     DATE    DEFAULT SYSDATE,
edit_date   DATE    DEFAULT SYSDATE
);

-- Review sequence
DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq START WITH 1; 

-- Chat Table
DROP TABLE chat CASCADE CONSTRAINTS;
CREATE TABLE chat(
cseq    NUMBER(5) PRIMARY KEY,
id      VARCHAR2(20) REFERENCES member(email),
regdate DATE  DEFAULT SYSDATE
);


-- Chat sequence
DROP SEQUENCE chat_seq;
CREATE SEQUENCE chat_seq START WITH 1; 



-- Qna Table
DROP TABLE qna CASCADE CONSTRAINTS;
CREATE TABLE qna (
qseq      NUMBER  PRIMARY KEY,
cseq      NUMBER  REFERENCES chat(cseq),
send_id   VARCHAR2(50)   REFERENCES member(email),
rcvd_id   VARCHAR2(50)    REFERENCES member(email),
chat_content VARCHAR2(50)   NOT NULL,
regdate    DATE      DEFAULT SYSDATE 
);

--QNA sequence
DROP SEQUENCE qna_seq;
CREATE SEQUENCE qna_seq START WITH 1; 

---- Insert Data

-- Member 
INSERT INTO member (email, pwd, name, phone, pay_name, pay_num, pay_num_lstfour, pay_cvc) values
('kdpark@email.com','1111','killdong park','010-1111-1111','payname','1111111','1111','111');
INSERT INTO member (email, pwd, name, phone, admin) values
('admin','2222','Admin','0','y');

-- Chat
INSERT INTO chat(cseq, id) values(chat_seq.nextval, 'kdpark@email.com');

-- Qna
INSERT INTO qna(qseq, cseq, send_id, rcvd_id, chat_content) values(qna_seq.nextval, 2,'kdpark@email.com', 'admin','question');
INSERT INTO qna(qseq, cseq, send_id, rcvd_id, chat_content) values(qna_seq.nextval, 2,'admin', 'kdpark@email.com','answer');

COMMIT;

SELECT name FROM member WHERE email='kdpark@email.com';
update member set phone='010-1111-1111', pwd='1111' where email='kdpark@email.com';

SELECT TO_CHAR(regdate,'YYYY-MM-DD HH24:MI') FROM qna;

SELECT * FROM member;
