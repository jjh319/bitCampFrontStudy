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



-- 문제 3)
SELECT
    st.sno,
    st.sname,
    st.major,
    st.syear,
    sc.cno,
    co.cname,
    sc.result
FROM
    student st,
    score sc,
    course co
WHERE
    st.sno = sc.sno AND
    sc.cno = co.cno AND
    major = '화학' AND
    st.syear = 1;
    

--------------------------

-- 기말고사 평균 60점 이상인 학생의 정보를 구하시오.
SELECT
    SNO,
    SNAME,
    avg(RESULT)
FROM
    student JOIN score using(sno)
GROUP BY
    SNO,SNAME
HAVING
    avg(RESULT) >= 60;
    


    









    
    








