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