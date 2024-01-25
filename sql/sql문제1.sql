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
    concat(first_name || ' ', last_name) AS "NAME",
    length(concat(first_name || ' ',last_name)) AS "LENGTH"
FROM
    employees
WHERE
    substr(last_name,-1,1) = 'n';

SELECT sysdate FROM dual;

-- 문제3)
SELECT
    last_day(sysdate) - sysdate AS "이번 달 말까지 남은 일"
FROM
    dual;


-- 문제4)
SELECT
    LAST_NAME,
    to_char(hire_date,'DD"-"fmMM"월 -"YYYY') AS "HIRE_DATE"
FROM
    employees
WHERE
    hire_date < '2005-01-01';
    

-- 문제5)
SELECT
    count(employee_id) AS " 커미션을 받지 않은 사원 수"
FROM
    employees
WHERE
    commission_pct is null;
 
 
 
-- 3일차 --


SELECT job_id, decode(job_id,
                        'SA_MAN','Sales Dept',
                        'SA_REP','Sales Dept',
                        'Another') AS "분류"
FROM employees
ORDER BY 2;

SELECT count(distinct department_id) FROM employees;

--문제6)
SELECT
    employee_id AS "사원번호",
    last_name AS "사원명",
    case when salary < 10000 then '초급'
         when salary < 20000 then '중급'
         else '고급'
         end "구분"
FROM
    employees
ORDER BY
    salary desc, last_name desc;
    
SELECT rank(3000) within group(ORDER BY salary desc) AS "rank" FROM employees;


-- 문제7)
SELECT
    employee_id AS "사원번호",
    last_name AS "이름",
    '$' || to_char((salary * 12 + (salary*12*nvl(commission_pct,0))),'9,999,999') AS "연봉",
    commission_pct AS "커미션"
FROM
    employees;


-- 문제8)
SELECT
    employee_id AS "사원번호",
    last_name AS "이름",
    nvl(manager_id,1000) AS "매니저ID"
FROM
    employees;


-- 문제1)
SELECT
    job_id,
    sum(salary) AS "급여합계"
FROM
    employees
GROUP BY
    job_id;

SELECT department_id, max(salary) AS max_salary
FROM employees
GROUP BY department_id
HAVING department_id in(10,20,30)
ORDER BY department_id ASC;


-- 프로그래머스 문제)
SELECT
    sum(price) AS "판매액"
FROM
    SELLINGS
GROUP BY
    created_at
HAVING
    created_at in('2016-11');


-- 4일차)

-- 문제2)
SELECT
    department_id,
    city
FROM
    departments d,
    locations l
WHERE
    d.location_id = l.location_id;

SELECT
    department_id,
    city
FROM
    departments JOIN locations using(location_id);


-- 문제3)
SELECT
    last_name AS 사원이름,
    city AS 도시,
    department_name AS 부서이름
FROM
    employees
    join departments using(department_id)
    join locations using(location_id)
WHERE
    city in('Seattle','Oxford')
ORDER BY
    city;


-- 문제4)
SELECT
    employee_id AS 사원번호,
    last_name AS 사원이름,
    department_name AS 부서이름,
    city AS 도시,
    street_address AS 도시주소,
    country_name AS 나라이름
FROM
    employees
    LEFT JOIN departments using(department_id)
    JOIN locations using(location_id)
    JOIN countries using(country_id)
WHERE
    street_address LIKE '%Ch%' or
    street_address LIKE '%Sh%' or
    street_address LIKE '%Rd%'
ORDER BY
    country_name asc, city asc;


-- 5일차 --

SELECT e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

SELECT last_name, department_id,department_name
FROM employees
left join departments using(department_id);


SELECT last_name, department_id,department_name
FROM employees
right join departments using(department_id);

SELECT last_name, department_id, department_name
FROM employees
full join departments using(department_id);

create table salgrade(
salvel varchar2(2),
lowst number,
highst number);

insert into salgrade values('A',20000, 29999);
insert into salgrade values('B',10000, 19999);
insert into salgrade values('C',0, 9999);
commit;

SELECT last_name, salary, salvel
FROM employees
join salgrade on(salary between lowst and highst)
ORDER BY salary DESC;

SELECT e.employee_id AS 사원번호,
       e.last_name AS 사원이름,
       m.last_name AS 관리자
FROM employees e
JOIN employees m on(m.employee_id = e.manager_id);


create table employees_role as select * from employees where 1=0;

insert into employees_role values(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', 
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', 
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(101, 'Nee', 'Ko', 'NKOCHHAR', '515.123.4568', 
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(200, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', 
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(200, 'Nee', 'Kochhar', 'NKOCHHAR', '515.123.4568', 
'1989-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(300, 'GilDong', 'Hong', 'NKOCHHAR', '010-123-4567', 
'2009-03-01', 'IT_PROG', 23000.00, NULL, 100, 90);
commit;

SELECT employee_id, last_name FROM employees
union
SELECT employee_id, last_name FROM employees_role;

SELECT employee_id, last_name FROM employees
intersect
SELECT employee_id, last_name FROM employees_role;

-- 문제1)
SELECT 
    last_name AS 사원이름,
    job_id AS 업무ID,
    department_id AS 부서ID
FROM
    employees
WHERE
    department_id in('10')
UNION
SELECT
    last_name,
    job_id,
    department_id
FROM
    employees_role
WHERE
    job_id in('IT_PROG');
    
SELECT last_name, job_title
FROM employees
join jobs using(job_id)
WHERE job_title in('Stock Manager', 'Programmer');

SELECT last_name, job_title
FROM employees
join jobs using(job_id)
WHERE job_title='Stock Manager'
union
SELECT last_name, job_title
FROM employees
join jobs using(job_id)
WHERE job_title='Programmer'
ORDER BY job_title asc;

-- 5일차 -- 
SELECT department_name
FROM departments
WHERE department_id = (SELECT department_id FROM employees WHERE first_name='Neena');

SELECT last_name, department_id, salary
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE first_name='Neena')
    AND salary > (SELECT salary FROM employees WHERE first_name='Neena');
    
-- 문제 1)
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary = (SELECT min(salary) FROM employees);
    
-- 문제2)
SELECT
    department_name,
    sum(salary)
FROM
    employees JOIN departments using(department_id)
GROUP BY
    department_name
HAVING
    sum(salary) = (SELECT max(sum(salary)) FROM employees GROUP BY department_id);


SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'
      AND
      salary > any(SELECT salary FROM employees WHERE job_id='ST_MAN');
      
-- 문제3)
SELECT
    last_name AS 사원명,
    job_id AS 업무ID,
    to_char((salary*1380),'99,999,999') || '원' AS 급여
FROM 
    employees
WHERE
    (job_id = 'FI_ACCOUNT' OR job_id = 'SA_REP')
    AND
    salary >= any(SELECT max(salary) FROM employees WHERE job_id='IT_PROG')
ORDER BY
    salary DESC;
    
SELECT employee_id AS 사원번호,
       last_name AS 이름,
       CASE
            WHEN employee_id in(SELECT manager_id FROM employees) then '관리자'
            ELSE '직원'
            END AS 구분
FROM employees
ORDER BY 3,1;


-- 문제4)
SELECT
    last_name AS 사원이름,
    job_id AS 업무ID,
    job_title AS 직무,
    '$' || to_char(trunc(salary,-3),'9,999,999') AS 급여
FROM
    employees JOIN jobs using(job_id)
WHERE
    (job_id,salary) in ( SELECT job_id, trunc(AVG(salary),-3)
    FROM employees
    GROUP BY job_id
    )
ORDER BY
    salary DESC;


-- 6일차 --

create table user1(
idk number primary key,
id varchar2(10) unique,
name varchar2(10) not null,
phone varchar2(15),
address varchar2(50),
score number(6,2) check(score >= 0 and score <= 100),
subject_code number(5),
hire_date date default sysdate,
marriage char(1) default 'N' check(marriage in('Y','N')));

INSERT INTO user1(idk,id,name,phone,address,score,subject_code,hire_date,marriage)
VALUES(1,'aaa','kim','010-0000-0000','서울',75,100,'2010-08-01','Y');

select * FROM user1;

alter table user1 rename to user2;

desc user2;

alter table user2 drop column address;

create table book(
no number primary key,
subject varchar2(50),
price number,
year date);

create sequence no_seq nocycle nocache;

insert into book(no, subject, price, year)
values (no_seq.nextval,'오라클 무작정 따라하기',10000,sysdate);

select * from book;

select constraint_name, constraint_type, search_condition
from user_constraints
where table_name='USER2';

create table dept(
deptno number constraint DNO primary key,
dname varchar2(30) constraint DNAME not null);

create table emp(
empno number constraint ENO primary key,
ename varchar2(30) constraint ENAME not null,
deptno number, constraint FKNO foreign key(deptno) 
references dept on delete set null);


-- 7일차 --
CREATE OR REPLACE VIEW v_view1
AS SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id = 90;

SELECT * FROM v_view1;

-- 문제1)
CREATE OR REPLACE VIEW v_view2
AS SELECT employee_id AS 사원ID, last_name AS 사원이름, salary AS 급여, department_id AS 부서ID
FROM employees
WHERE salary between 5000 AND 10000;

SELECT * FROM v_view2 ORDER BY 급여;

update v_view2 set 급여=12000 WHERE 사원ID=103;
commit;


-- 문제2)
CREATE OR REPLACE VIEW v_view3(사원번호,사원명,부서명)
AS SELECT employee_id, last_name, department_name
FROM employees JOIN departments using(department_id)
WHERE department_id = 10 OR department_id = 90;

SELECT * FROM v_view3 ORDER BY 사원번호;

-- 문제3)
CREATE OR REPLACE VIEW v_view4(사원번호,사원명,급여,입사일,부서명,부서위치)
AS SELECT employee_id,last_name,salary,hire_date,department_name,city
FROM employees JOIN departments using(department_id) JOIN locations using(location_id);

SELECT
    사원번호,
    사원명,
    to_char(trunc(급여,-3),'9,999,999') || '원' AS 급여,
    to_char(입사일,'YYYY"년" MM"월" DD"일"') AS 입사일,
    부서명,
    부서위치 
FROM
    v_view4
ORDER BY
    사원번호;


-- 문제4) 
create table bookshop(
isbn varchar2(10) constraint PISBN primary key,
title varchar2(50) constraint CTIT NOT NULL,
author varchar2(50),
price number,
company varchar2(30));

INSERT INTO bookshop(isbn,title,author,price,company)
VALUES ('is001','자바3일완성','김자바',25000,'야메루출판사');

INSERT INTO bookshop(isbn,title,author,price,company)
VALUES ('pa002','JSP달인되기','이달인',28000,'공갈닷컴');

INSERT INTO bookshop(isbn,title,author,price,company)
VALUES ('or003','오라클무작정따라하기','박따라',23500,'야메루출판사');

CREATE table bookorder(
idx number primary key,
isbn varchar2(10),
constraint FKISBN foreign key(isbn) references bookshop on delete set null,
-- isbn varchar2(10) constraint FKISBN references bookshop(isbn),
qty number);

create sequence idx_seq nocycle nocache;

INSERT INTO bookorder(idx,isbn,qty)
VALUES (idx_seq.nextval,'is001',2);

INSERT INTO bookorder(idx,isbn,qty)
VALUES (idx_seq.nextval,'or003',3);

INSERT INTO bookorder(idx,isbn,qty)
VALUES (idx_seq.nextval,'pa002',5);

INSERT INTO bookorder(idx,isbn,qty)
VALUES (idx_seq.nextval,'is001',3);

INSERT INTO bookorder(idx,isbn,qty)
VALUES (idx_seq.nextval,'or003',10);

SELECT * FROM bookorder;

CREATE OR REPLACE VIEW bs_view(책제목,저자,총판매금액)
AS 
SELECT
    title,
    author,
    to_char(sum(qty*price),'9,999,999')
FROM
    bookshop JOIN bookorder using(isbn)
GROUP BY
    title , author
WITH READ ONLY;

SELECT * FROM bs_view ORDER BY 총판매금액 DESC;































