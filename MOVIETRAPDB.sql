-- TableSpace
CREATE TABLESPACE MOVIETRAP 
DATAFILE 'D:\DB\MOVIETRAPTS.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 10M;

-- Create User
ALTER SESSION SET"_ORACLE_SCRIPT" = TRUE;

CREATE USER MOVIETRAPDB IDENTIFIED BY ora123
DEFAULT TABLESPACE MOVIETRAP;
GRANT create session to MOVIETRAPDB;
GRANT create view, alter user to MOVIETRAPDB;
GRANT dba to MOVIETRAPDB;
COMMIT;


---- ���̺� �� ������ ����-----

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
pay_num     NUMBER,
pay_num_lstfour NUMBER,
pay_cvc     NUMBER  ,
pay_date    DATE    DEFAULT SYSDATE,
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

-- Qna Table
DROP TABLE qna CASCADE CONSTRAINTS;
CREATE TABLE qna (
cseq        NUMBER  PRIMARY KEY,
send_id   VARCHAR2(50)   REFERENCES member(email),
rcvd_id   VARCHAR2(50)    REFERENCES member(email),
chat_content VARCHAR2(50)   NOT NULL,
chat_time    TIMESTAMP      DEFAULT SYSDATE 
);

--QNA sequence
DROP SEQUENCE qna_seq;
CREATE SEQUENCE qna_seq START WITH 1; 

---- ������ ���� 

-- member 
INSERT INTO member (email, pwd, name, phone, pay_name, pay_num, pay_num_lstfour, pay_cvc) values
('kdpark@email.com','1111','�ڱ浿','010-1111-1111','payname','111111111111','1111','111');
INSERT INTO member (email, pwd, name, phone, admin) values
('admin','2222','������','0','y');

-- qna
INSERT INTO qna(cseq, send_id, rcvd_id, chat_content) values(qna_seq.nextval, 'kdpark@email.com', 'admin','����');
INSERT INTO qna(cseq, send_id, rcvd_id, chat_content) values(qna_seq.nextval, 'admin', 'kdpark@email.com','�亯');

COMMIT;

SELECT name FROM member WHERE email='kdpark@email.com';
update member set phone='010-1111-1111', pwd='1111' where email='kdpark@email.com';