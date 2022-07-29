CREATE TABLE snack(
                      s_num NUMBER(3) PRIMARY KEY,
                      s_name VARCHAR2(10 CHAR) NOT NULL,
                      s_date DATE NOT NULL,
                      s_price NUMBER(10) NOT NULL,
                      s_wieght NUMBER(5,2) NOT NULL
);
CREATE SEQUENCE snack_seq;
DROP SEQUENCE snack_seq;
INSERT INTO snack VALUES (snack_seq.nextval,'꼬깔콘',SYSDATE+10,1500,300.145);
INSERT INTO snack VALUES (snack_seq.nextval,'초코송이',SYSDATE+5,3000,450.145);
INSERT INTO snack VALUES (snack_seq.nextval,'프링글스',SYSDATE+3,2000,454.145);

INSERT INTO snack VALUES (snack_seq.nextval,'초코초코',TO_DATE('2022-10-01','YYYY-MM-DD'),1335,570.145);
INSERT INTO snack VALUES (snack_seq.nextval,'똥덩어리',TO_DATE('2021-11-01','YYYY-MM-DD'),1355,580.145);


SELECT * FROM snack;

SELECT MAX(s_price) AS 최고가,AVG(s_price) AS 평균가,AVG(s_price/snack.s_wieght) AS "g당 최저가",COUNT(*) AS "과자 총 개수" FROM snack;

SELECT * FROM snack WHERE s_date-SYSDATE<0;
SELECT * FROM snack WHERE
                        s_date >= TO_DATE(CONCAT(TO_CHAR(SYSDATE,'YYYY-MM-DD'),'23:59:59'),'YYYY-MM-DD HH24:MI:SS');

SELECT s_name, s_price FROM snack WHERE s_price=(SELECT MAX(s_price) FROM snack);

SELECT s_name,s_price FROM snack WHERE s_price>(SELECT AVG(s_price) FROM snack);
SELECT s_name,s_price/snack.s_wieght AS 그람당가격 FROM snack WHERE s_price>(SELECT MIN(s_price) FROM snack);
SELECT s_name,s_price FROM snack WHERE s_price/snack.s_wieght = (SELECT MAX(s_price/snack.s_wieght) FROM snack);

DROP TABLE snack CASCADE CONSTRAINTS;