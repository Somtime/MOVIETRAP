-- TableSpace
CREATE TABLESPACE MOVIETRAP 
DATAFILE 'E:\DB\MOVIETRAPTS.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 10M;

-- Create User
ALTER SESSION SET"_ORACLE_SCRIPT" = TRUE;

CREATE USER MOVIETRAPDB IDENTIFIED BY ora123
DEFAULT TABLESPACE MOVIETRAP;
GRANT create session to MOVIETRAPDB;
GRANT create view, alter user to MOVIETRAPDB;
GRANT dba to MOVIETRAPDB;
COMMIT;


---- 테이블 및 시퀀스 생성-----

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
pay_date    DATE    DEFAULT SYSDATE
);

-- Review Table
DROP TABLE review CASCADE CONSTRAINTS;
CREATE TABLE review (
rseq        NUMBER(5)    PRIMARY KEY,
writer      VARCHAR2(50) REFERENCES member(email),
pub_date    DATE    NOT NULL, 
title       VARCHAR2(50)    NOT NULL,
description VARCHAR2(1000)  NOT NULL,
regdate     DATE    DEFAULT SYSDATE,
edit_date   DATE    DEFAULT SYSDATE
);

-- Review sequence
DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq START WITH 1; 

-- Worker Table
DROP TABLE worker CASCADE CONSTRAINTS;
CREATE TABLE worker (
id  VARCHAR2(50)    PRIMARY KEY,
pwd     VARCHAR2(50)    NOT NULL,
name    VARCHAR2(50)    NOT NULL,
image   VARCHAR2(50)    DEFAULT 'worker.png'
);

-- Qna Table
DROP TABLE qna CASCADE CONSTRAINTS;
CREATE TABLE qna (
cseq        NUMBER  PRIMARY KEY,
member_id   VARCHAR2(50)   REFERENCES member(email),
worker_id   VARCHAR2(50)    REFERENCES worker(id),
chat_content VARCHAR2(50)   NOT NULL,
chat_time    TIMESTAMP      DEFAULT SYSDATE
);

--QNA sequence
DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq START WITH 1; 