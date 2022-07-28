SELECT
    empno,ename,job
FROM emp;

SELECT empno,deptno FROM emp;

SELECT DISTINCT deptno FROM emp;

SELECT
    empno as 사원번호
FROM emp; 

SELECT ename, sal , comm , sal*12+comm AS "연 봉" FROM emp;

SELECT ename, sal FROM emp ORDER BY sal ASC;

SELECT * FROM emp ORDER BY empno DESC;

SELECT *FROM emp ORDER BY deptno ASC, sal DESC;

--조회할 테이블은 xmp 테이블이며 모든 열을 출력하려고 하는데 출력되는 열의 별칭을 지정하고 부서번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면 사원이름을 기준으로 오름차순 정렬한다.
SELECT empno AS 사원번호, ename AS 이름, mgr AS 매니저, sal AS 월급, comm AS "보 너스", deptno AS 부서번호 FROM emp ORDER BY deptno DESC, ename ASC;


SELECT * FROM emp WHERE deptno=30;

SELECT * FROM emp WHERE emptno=30 AND job='SALESMAN'; 

SELECT *FROM emp WHERE empno=7499 AND deptno=30;

SELECT * FROM emp WHERE deptno=30 OR job='CLERK';

SELECT * FROM emp WHERE ename >='f';


SELECT * FROM emp WHERE sal>=2500 AND job='ANALYST';
SELECT * FROM emp WHERE job IN ('MANAGER','CLERK','SALESMAN');

SELECT * FROM emp WHERE NOT sal=3000;

SELECT * FROM emp WHERE deptno IN(10,20);

SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000; 

SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000; 

SELECT * FROM emp WHERE ename LIKE 'S%'; 

SELECT * FROM emp WHERE ename LIKE '_S'; 

SELECT * FROM emp WHERE ename LIKE '%AM%';

SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

SELECT * FROM emp WHERE comm IS NULL;
