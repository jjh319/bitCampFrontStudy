-- 문제 1 GROUP BY/HAVING)
SELECT
    major,
    trunc(avg(avr),1) AS 평균
FROM
    student
GROUP BY
    major
HAVING
    major != '화학';
    
SELECT
    major,
    trunc(avg(avr),1) AS 평균
FROM
    student
GROUP BY
    major
HAVING
    major in('생물','물리','유공','식영') AND
    trunc(avg(avr),1) < 2;
    
    
-- 문제1 JOIN)
SELECT
    pno,
    pname,
    cno,
    cname
FROM
    professor
    JOIN course  using(pno)
WHERE
    pname = '송강';


SELECT
    p.pno,
    p.pname,
    c.cno,
    c.cname
FROM
    professor p JOIN course c
    ON p.pno = c.pno
WHERE
    c.cname LIKE '%화학';









