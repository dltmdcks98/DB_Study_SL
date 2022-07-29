-- 식당 프렌차이즈 관리
-- -김밥천국, 강남점, 02-1234-5678,10테이블, 제육덮밥,5000
-- -김밥천국, 서초점, 02-5678-9999,20테이블, 야채덮밥,3000
-- -김밥천국, 서초점, 02-1234-5678,10테이블, 소고기김밥,5000

CREATE TABLE restaurantManagement(
    num NUMBER(10) PRIMARY KEY NOT NULL,
    name VARCHAR2(10 char) NOT NULL,
    location VARCHAR2(5 char) NOT NULL,
    calNum VARCHAR2(13 char) NOT NULL,
    tableCount NUMBER(2) NOT NULL
);



CREATE TABLE menu(
    num NUMBER(10) PRIMARY KEY NOT NULL,
    menu VARCHAR2(10 char) NOT NULL,
    price NUMBER(5) NOT NULL,
    resaturantNum NUMBER(10) NOT NULL REFERENCES restaurantManagement
);

CREATE TABLE sajang(
                       s_num NUMBER(10) PRIMARY KEY,
                       s_name VARCHAR2(5 char) NOT NULL,
                       s_birth DATE NOT NULL,
                       s_location VARCHAR2(5 char) NOT NULL
);

CREATE TABLE management(
                           m_num NUMBER(10) PRIMARY KEY,
                           m_sajang NUMBER(10) REFERENCES sajang,
                           m_restaurant NUMBER(10) REFERENCES restaurantManagement
);

CREATE SEQUENCE reataurantNum;
CREATE SEQUENCE menuNum;
CREATE SEQUENCE sajangNum;
CREATE SEQUENCE mangemneteNum;

---------------------------------------DROP--------------------------------------------

DROP TABLE restaurantManagement;
DROP TABLE menu;
DROP TABLE sajang;
DROP TABLE management;

DROP SEQUENCE  reataurantNum;
DROP SEQUENCE  menuNum;
DROP SEQUENCE  sajangNum;
DROP SEQUENCE mangemneteNum;



---------------------------INSERT DATA----------------------------------------
INSERT INTO restaurantManagement VALUES (reataurantNum.nextval,'김밥천국', '강남점', '02-1234-5678',10);
INSERT INTO restaurantManagement VALUES (reataurantNum.nextval,'김밥천국', '서초점', '02-5678-9999',20);
INSERT INTO restaurantManagement VALUES (reataurantNum.nextval,'우동천국', '성남점', '031-1111-1111',30);


INSERT INTO menu VALUES (menuNum.nextval,'제육덮밥',5000,1);
INSERT INTO menu VALUES (menuNum.nextval,'야채덮밥',3000,2);
INSERT INTO menu VALUES (menuNum.nextval,'소고기김밥',5000,3);
INSERT INTO menu VALUES (menuNum.nextval,'튀김우동',6000,3);

INSERT INTO sajang VALUES (sajangNum.nextval,'홍길동',TO_DATE('1999-12-12','YYYY-MM-DD'),'서울');
INSERT INTO sajang VALUES (sajangNum.nextval,'김길동',TO_DATE('1979-03-02','YYYY-MM-DD'),'인청');
INSERT INTO sajang VALUES (sajangNum.nextval,'이길동',TO_DATE('1989-07-13','YYYY-MM-DD'),'안양');

INSERT INTO management VALUES (mangemneteNum.nextval,1,3);
INSERT INTO management VALUES (mangemneteNum.nextval,2,1);
INSERT INTO management VALUES (mangemneteNum.nextval,3,2);
INSERT INTO management VALUES (mangemneteNum.nextval,2,3);

-------------------------------------SELECT---------------------------------------------
SELECT * FROM restaurantManagement;
SELECT * FROM menu;
SELECT * FROM sajang;
SELECT * FROM management;

SELECT COUNT(*) FROM restaurantManagement;
SELECT AVG(price) FROM menu WHERE menuName LIKE '%우동%';

SELECT name,location FROM restaurantManagement WHERE tableCount=(SELECT MAX(TABLECOUNT) FROM restaurantManagement);

--김밥천국, 강남점의 메뉴, 가격을 출력
SELECT * FROM menu WHERE resaturantNum = (SELECT num FROM restaurantManagement WHERE location='강남점');

-- 제일 비싼 메뉴 파는 식당명, 지점명 '='값이 하나일때 사용
SELECT name,location FROM restaurantManagement WHERE num IN (SELECT resaturantNum FROM menu WHERE price IN (SELECT MAX(price) FROM menu));

-- 테이블이 제일 적은 매장 메뉴명, 가격
SELECT menuName,price FROM menu WHERE resaturantNum IN (SELECT num FROM restaurantManagement WHERE tableCount IN (SELECT MIN(tableCount)FROM restaurantManagement));

-- 김밥천국 강남점을 운영하는 사장 이름과 집을 출력
SELECT s_name,s_location FROM sajang WHERE s_num = (SELECT m_sajang FROM management WHERE m_restaurant = (SELECT num FROM restaurantManagement WHERE name='김밥천국' AND location='강남점'));

-- 최연장자가 운영하는 식당이름, 지점을 출력
SELECT name,location FROM restaurantManagement WHERE num IN (SELECT m_restaurant FROM management WHERE m_sajang=(SELECT s_num FROM sajang WHERE s_birth = (SELECT MIN(s_birth) FROM sajang)));

-- 최연소자가 운영하는 식당 메뉴명, 가격을 출력
SELECT menuName ,price FROM menu WHERE resaturantNum IN (SELECT m_restaurant FROM management WHERE m_sajang = (SELECT s_num FROM sajang WHERE s_birth = (SELECT MAX(s_birth)FROM sajang)));

-- 식당명, 지점명, 메뉴명 가격 출력
SELECT name,location,menuName,price FROM menu,restaurantManagement WHERE restaurantManagement.num=menu.num;

-- 최연장자 사장 이름, 생일 식당번호, 식당이름
SELECT s_name,s_birth,calNum,name FROM sajang,restaurantManagement,management WHERE num=M_NUM AND m_num=s_num ;

-- 사장이름, 식당명, 지점명, 메뉴명, 가격 출력 , 단 메뉴 가격의 평균 미만인 것만 출력
SELECT s_name,name,location,menuName,price FROM sajang,restaurantManagement,menu,management WHERE price<(SELECT AVG(price) FROM menu) AND m_sajang=sajang.s_num AND m_restaurant=restaurantManagement.num;


------------------------------------UPDATE-------------------------------------------------
ALTER TABLE menu RENAME COLUMN menu TO menuName;
