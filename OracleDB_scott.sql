SELECT
    empno,ename,job
FROM emp;

SELECT empno,deptno FROM emp;

SELECT DISTINCT deptno FROM emp;

SELECT
    empno as �����ȣ
FROM emp; 

SELECT ename, sal , comm , sal*12+comm AS "�� ��" FROM emp;

SELECT ename, sal FROM emp ORDER BY sal ASC;

SELECT * FROM emp ORDER BY empno DESC;

SELECT *FROM emp ORDER BY deptno ASC, sal DESC;

--��ȸ�� ���̺��� xmp ���̺��̸� ��� ���� ����Ϸ��� �ϴµ� ��µǴ� ���� ��Ī�� �����ϰ� �μ���ȣ�� �������� ������������ �����ϵ� �μ���ȣ�� ���ٸ� ����̸��� �������� �������� �����Ѵ�.
SELECT empno AS �����ȣ, ename AS �̸�, mgr AS �Ŵ���, sal AS ����, comm AS "�� �ʽ�", deptno AS �μ���ȣ FROM emp ORDER BY deptno DESC, ename ASC;


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
