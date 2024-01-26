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
    
-- 기말고사 평균 성적이 핵 화학과목보다 우수한 과목의 과목명과 담당 교수명을 검색하시오
SELECT
    CNO,
    CNAME,
    avg(RESULT),
    PNO,
    PNAME
FROM
    student JOIN score using(sno) JOIN course using(CNO) JOIN professor using(PNO)
GROUP BY
    CNO,CNAME,PNO,PNAME
HAVING
    avg(RESULT) > (SELECT avg(result)
                   FROM score JOIN course using(CNO) JOIN professor using(pno)
                   


 
SELECT A.CNO
       , A.CNAME
       , A.RESULT
       , B.PNO
       , B.PNAME
FROM (
		SELECT C.CNO
			  , C.CNAME
			  , C.PNO
			  , ROUND(AVG(D.RESULT), 2) AS RESULT
		FROM COURSE C, SCORE D
		WHERE C.CNO = D.CNO
		GROUP BY C.CNO, C.CNAME, C.PNO
       ) A
       , PROFESSOR B
WHERE A.PNO = B.PNO AND A.RESULT > (
                                SELECT ROUND(AVG(D.RESULT), 2)
                                FROM COURSE C, SCORE D
                                WHERE C.CNO = D.CNO
                                GROUP BY C.CNO, C.CNAME
                                HAVING C.CNAME = '핵화학'
                               );   









    
    








