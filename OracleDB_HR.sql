SELECT last_name,department_id FROM employees WHERE employee_id=176;

SELECT last_name,salary FROM employees WHERE salary>=1200;

SELECT last_name,salary FROM employees WHERE salary BETWEEN 5000 AND 12000;
SELECT last_name,salary FROM employees WHERE salary<5000 OR salary>12000;

SELECT * FROM EMPLOYEES WHERE salary*12 =36000;

SELECT * FROM EMPLOYEES WHERE salary>3000;

SELECT * FROM EMPLOYEES WHERE salary>=3000;

SELECT * FROM EMPLOYEES WHERE enmae>='F';

SELECT last_name, department_id FROM employees WHERE department_id IN(20,50) ORDER BY department_id , last_name;

SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date BETWEEN '2008/02/20' AND '2008/05/01' ORDER BY hire_date DESC;

SELECT last_name, hire_date FROM employees WHERE hire_date BETWEEN '2004/01/01'AND '2004/12/31' ORDER BY hire_date;



SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 5000 AND 12000;

SELECT last_name, department_id FROM employees WHERE department_id IN (20,50) AND salary BETWEEN 5000 AND 12000;

SELECT last_name, hire_date FROM employees WHERE hire_date BETWEEN '2008/02/20'AND '2008/05/01' ORDER BY hire_date DESC;
SELECT last_name, hire_date FROM employees WHERE hire_date  BETWEEN '2004/01/01'AND '2004/12/31' ORDER BY hire_date;


SELECT last_name,employee_id FROM employees WHERE last_name LIKE '%u%';
SELECT last_name,employee_id FROM employees WHERE last_name LIKE '____a%';
SELECT last_name FROM employees WHERE last_name LIKE '%a%'or last_name LIKE '%e%' ORDER BY last_name;

SELECT last_name,job_id FROM employees WHERE manager_id IS NULL;
SELECT department_id FROM employees WHERE department_id IS NOT NULL AND job_id ='ST_CLERK';
SELECT employee_id, first_name, job_id,commission_pct*salary AS commission FROM employees WHERE commission_pct IS NOT NULL;

