--테이블 만들기
CREATE TABLE jul28_DB(
    d_name VARCHAR2(10 CHAR) NOT NULL,
    d_age NUMBER(3)NOT NULL,
    d_home varchar2(10 char)NOT NULL
);

CREATE TABLE jul28_product(
    p_name VARCHAR2(10 char) NOT NULL,
    p_price NUMBER(6) NOT NULL,
    p_weight number(6,2) NOT NULL
);

INSERT INTO jul28_product VALUES ('lsc',10000,15.61);
INSERT INTO jul28_product VALUES ('홍길동',60000,1612);
INSERT INTO jul28_product VALUES ('김강남',20000,1538.98478);

SELECT * FROM jul28_product;

--CRUD
--CREATE = INSERT
INSERT INTO jul28_DB(d_name, d_age, d_home) VALUES ('lsc',25,'산본');
INSERT INTO jul28_DB(d_name, d_age, d_home) VALUES ('홍길동',30,'강남');
INSERT INTO jul28_DB(d_name, d_age, d_home) VALUES ('김강남',20,'인천');

INSERT INTO jul28_DB VALUES ('홍길동',50,'강남');

-- CASCADE CONSTRAINTS PURGE
DROP TABLE jul28_DB CASCADE CONSTRAINTS PURGE;


SELECT * FROM jul28_product WHERE p_price=10000;

-- sequence는 table과 관계가 없는 독립적인 관계
CREATE SEQUENCE jul28_DB_sq;
INSERT INTO jul28_DB values (jul28_DB_sq.nextval,123,'군포');

SELECT * FROM jul28_DB;
commit;

CREATE SEQUENCE jul28_student_sq;
CREATE TABLE jul28_student(
    num NUMBER(3) NOT NULL PRIMARY KEY ,
    s_age NUMBER(3) NOT NULL,
    s_name VARCHAR2(5 char) NOT NULL,
    s_birth DATE NOT NULL,
    s_height NUMBER(3) NOT NULL,
    s_weight NUMBER(3) NOT NULL
);
DROP TABLE jul28_student CASCADE CONSTRAINTS PURGE;

INSERT INTO jul28_student VALUES (jul28_student_sq.nextval,25,'lsc',SYSDATE,113,12 );
INSERT INTO jul28_student VALUES (jul28_student_sq.nextval,25,'lsc',TO_DATE('1999-07-07','YYYY-MM-DD'),170,70);

SELECT num,s_age,s_birth,(s_height-100)*0.9 AS 표준체중 FROM jul28_student;