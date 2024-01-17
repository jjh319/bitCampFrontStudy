--문제1)
SELECT
    employee_id AS "사원번호",
    first_name || ' ' || last_name AS "이 름",
    salary*12 || '달러' AS "연 봉"
FROM
    employees
WHERE
     employee_id < 102;
     
--문제2)
SELECT
    last_name || ' is a ' || job_id AS "Employee Detail"
FROM
    employees;
    
--문제3)
SELECT
    first_name || ' ' || last_name AS "사원명",
    '$' || salary AS "월급",
    department_id
FROM
    employees
WHERE
    department_id = 90;
    
--문제4)
SELECT
    last_name AS "이름",
    job_id AS "업무ID",
    salary || '원'
FROM
    employees
WHERE
    job_id in( 'SA_REP' , 'AD_PRES') AND
    salary > 10000;
    
--문제5)
SELECT DISTINCT
    job_id AS "업무ID"
FROM
    employees;
    
--문제6)
SELECT
    employee_id AS "사원번호",
    first_name || ' ' || last_name AS "이름",
    hire_date AS "입사일"
FROM
    employees
WHERE
--    hire_date between '2005-01-01' and '2005-12-31';
    to_char(hire_date, 'yyyy') = '2005';
    

-- 2일차 --
SELECT last_name, department_id, hire_date
FROM employees
ORDER BY 2 DESC;

SELECT last_name, department_id, hire_date
FROM employees
ORDER BY 2 DESC, 3 ASC;

SELECT employee_id, last_name, department_id
FROM employees
WHERE lower(last_name) = 'higgins';

SELECT mod(10,3) FROM dual;

SELECT round(35765.357,2) FROM dual;

SELECT round(35765.357,-2) FROM dual;

SELECT concat('Hello', ' World') FROM dual;

-- 문제2)
SELECT
    employee_id,
    concat(first_name, last_name) AS "NAME",
    length(concat(first_name ,last_name)) AS "LENGTH"
FROM
    employees
WHERE
    substr(concat(first_name, last_name), -1) = 'n';




