--온라인 쇼핑몰
--aaa 샵 DDD 샵을 운영하는 1999-01-01 홍길동은 한사람
--
CREATE TABLE store(
  office_name varchar2(10 char) PRIMARY KEY,
  location VARCHAR2(5 CHAR) NOT NULL
);

CREATE TABLE management(
    m_num NUMBER(10) PRIMARY KEY,
    m_ceo_num NUMBER(10) NOT NULL REFERENCES ceo,
    m_store_name VARCHAR2(10 char) NOT NULL REFERENCES store
);

CREATE TABLE item(
    i_num NUMBER(10) PRIMARY KEY,
    i_name VARCHAR2(10 char) NOT NULL,
    i_category VARCHAR2(10 char) NOT NULL,
    i_price NUMBER(10) NOT NULL,
    i_store_name VARCHAR2(10 char) NOT NULL REFERENCES store
);
CREATE TABLE ceo(
    c_num NUMBER(10) PRIMARY KEY,
    c_name VARCHAR2(5 char) NOT NULL,
    c_birth DATE NOT NULL
);

CREATE SEQUENCE m_seq;
CREATE SEQUENCE i_seq;
CREATE SEQUENCE c_seq;
-------------------------------------INSERT--------------------------------------------------
INSERT INTO store VALUES ('AAA샵','잠실');
INSERT INTO store VALUES ('BBB샵','수원');

INSERT INTO ceo VALUES (c_seq.nextval,'홍길동',to_date('1999-01-01','YYYY-MM-DD'));
INSERT INTO ceo VALUES (c_seq.nextval,'김길동',to_date('1979-05-03','YYYY-MM-DD'));
INSERT INTO ceo VALUES (c_seq.nextval,'이길동',to_date('1989-03-14','YYYY-MM-DD'));

INSERT INTO item VALUES (i_seq.nextval,'마우스','전자기기',10000,'AAA샵');
INSERT INTO item VALUES (i_seq.nextval,'키보드','전자기기',20000,'AAA샵');
INSERT INTO item VALUES (i_seq.nextval,'모니터','전자기기',100000,'AAA샵');
INSERT INTO item VALUES (i_seq.nextval,'의자','가구',120000,'BBB샵');
INSERT INTO item VALUES (i_seq.nextval,'침대','가구',150000,'BBB샵');
INSERT INTO item VALUES (i_seq.nextval,'책상','가구',170000,'BBB샵');


INSERT INTO management VALUES (m_seq.nextval,1,'AAA샵');
INSERT INTO management VALUES (m_seq.nextval,2,'BBB샵');


---------------------------------------SELECT-------------------------------------------------
SELECT * FROM item;
--전체 상품명, 카테고리, 가격 조회
SELECT * FROM item;
--상품이 총 몇개있는지 평균 가격은 얼마인지
SELECT COUNT(*), AVG(i_price) AS 평균가격 FROM item;
--제일 싼 상품 구매하려면 어디로?
SELECT location FROM store WHERE office_name = (SELECT i_store_name FROM item WHERE i_price = (SELECT MIN(i_price) FROM item));
--최연소 사장 이름, 스토어 위치
SELECT c_name, location FROM ceo,store,management WHERE c_birth = (SELECT MAX(c_birth) FROM ceo) AND c_num=m_ceo_num AND office_name=management.m_store_name;
--전체 스토어 이름, 위치, 사장, 이름, 생일
SELECT office_name,location,c_name,c_birth FROM ceo,management,store WHERE c_num=m_ceo_num AND office_name=management.m_store_name;
--전체 스토어 이름, 위치 사랑이름, 상품, 카테고리, 가격
SELECT office_name,location,c_name,i_name,i_category,i_price FROM management,item,ceo,store WHERE c_num=m_ceo_num AND office_name=management.m_store_name AND m_store_name=i_store_name;



------------------------------------UPDATE-----------------------------------------------------
-- UPDATE 테이블명 SET 필드명 =값 WHERE 조건
UPDATE item SET i_price = 5000 WHERE i_price='마우스';
UPDATE item SET i_price= i_price*3;
-- 최연장자의 스토어의 상품을 반값으로
UPDATE item SET i_price= i_price/2 WHERE i_store_name=(SELECT m_store_name FROM management WHERE m_ceo_num IN (SELECT c_num FROM ceo WHERE c_birth=(SELECT MIN(c_birth) FROM ceo)));

SELECT * FROM item;
------------------------------------DELETE-----------------------------------------------------
-- DELETE FROM 테이블 => 테이블 데이터 삭제
DELETE item WHERE i_name='키보드';


