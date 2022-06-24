--2014 ~ 2015년 사이의 4개 회사 구매 데이터
SELECT * FROM PURPROD;
SELECT COUNT(*) FROM PURPROD WHERE 제휴사='A' ; 
-- 고객 속성정보
SELECT * FROM CUSTDEMO;
-- 고객은 19383명임 (성별과 연령대를 믹스할 수 있음)
SELECT COUNT(*) FROM CUSTDEMO;
-- 구매한 회사(백화점, 마트 , 슈퍼 , 롭스) >> 고객이 구매한 채널
SELECT * FROM COMPET;

SELECT * FROM CHANNEL;
--개별멤버십
SELECT * FROM MEMBERSHIP;
--상품 분류코드 (서로 상품분류가 다르다) >> 통합분류체계를 만드는게 중요. -- 기준정보가 중요하다.(결과도 기준정보에 의해 정확하게 해설이 가능하다)
SELECT * FROM PRODCL2;
SELECT COUNT(*) FROM prodcl2;
select count(*) from prodcl2 where 제휴사='A';

SELECT * FROM PURPROD;

-- 고객 속성정보와 매칭을 하여 출력
SELECT * FROM PURPROD;
-- 큰 그림을 그리기 위해서 매출분석을 해야한다.
-- 구매(매출)분석
SELECT YEAR, ROUND(SUM(구매금액)) 총구매액, ROUND( AVG(구매금액)) 평균구매액
FROM PURPROD
GROUP BY YEAR;

-- # 고객속성
-- 성별, 연령별, 거주지별, 다양한 조합별 매출 변화
-- 경쟁사 이용, 멤버십 이용, 온라인 채널에 대한 매출 특이성


-- 동적인 건
-- ## 구매행동패턴의 변화

-- 다양한 고객 유형별 구매 증감, 상품 구매 패턴의 변화, 구매 형태(시간,장소등)

-- # 유통 환경에 대한 이해(도메인)
ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR=substr(구매일자,1,4);
COMMIT;

SELECT * FROM PURPROD;
COMMIT;

CREATE TABLE PURBYYEAR AS
SELECT 고객번호, YEAR, SUM(구매금액) 구매액
FROM PURPROD
GROUP BY 고객번호, YEAR
ORDER BY 고객번호;

SELECT * FROM PURBYYEAR;




CREATE TABLE pur_amt AS
SELECT 고객번호 cusno, sum(구매금액) puramt
FROM PURPROD
GROUP BY 고객번호 
ORDER BY 고객번호;


ALTER TABLE PURPROD ADD MONTH NUMBER;
UPDATE PURPROD SET MONTH = substr(구매일자,5,2);
COMMIT;

SELECT 상품분류, COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN 구매금액 END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN 구매금액 END) "PP2015"
FROM PURPROD, PRODCL2 WHERE PURPROD.소분류코드 = PRODCL2.소분류코드
GROUP BY 상품분류;

SELECT 상품분류, 소비재분류, COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015"
FROM PURPROD, PRODCL2 WHERE PURPROD.소분류코드 = PRODCL2.소분류코드
GROUP BY 상품분류, 소비재분류 ORDER BY 상품분류;



SELECT 소비재분류, COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN 구매금액 END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN 구매금액 END) "PP2015"
FROM PURPROD, PRODCL2 WHERE PURPROD.소분류코드 = PRODCL2.소분류코드
GROUP BY 소비재분류;



--월별 구매건수, 구매금액
CREATE TABLE PUR_MONTH AS SELECT MONTH,
COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN 구매금액 END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN 구매금액 END) "PP2015"
FROM PURPROD GROUP BY MONTH ORDER BY MONTH;

SELECT * FROM PUR_MONTH;
DROP TABLE PUR_MONTH;

CREATE TABLE PUR_PERIOD AS SELECT channel.제휴사,
COUNT(CASE WHEN YEAR=2014 THEN channel.고객번호 END) "14년구매건수", 
COUNT(CASE WHEN YEAR=2015 THEN channel.고객번호 END) "15년구매건수",
SUM(CASE WHEN year=2014 THEN 구매금액 END) "14년구매총액",
SUM(CASE WHEN year=2015 THEN 구매금액 END) "15년구매총액" FROM purprod
LEFT OUTER JOIN channel ON PURPROD.고객번호 = channel.고객번호
GROUP BY channel.제휴사;

select*

select * from pur_area2
order by 제휴사;

drop table c3;
select * from prodcl2;
select count(*) from prodcl2;

--월별 구매건수, 구매금액
CREATE TABLE PUR_MONTH1 AS SELECT MONTH,
COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN 구매금액 END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN 구매금액 END) "PP2015"
FROM PURPROD WHERE 제휴사='A', GROUP BY MONTH ORDER BY MONTH;


SELECT*FROM PUR_MONTH1;
SELECT*FROM PUR_MONTH2;
SELECT* FROM PUR_MONTH3;
select* from PUR_MONTH4;
DROP TABLE PUR_MONTH;

SELECT*FROM PRODCL2;
SELECT COUNT(*) FROM PURPROD WHERE 점포코드='042';



----A제휴사
SELECT 고객번호, count(CASE WHEN 제휴사='A' THEN 고객번호 END) A경쟁사이용건수 FROM COMPET group by 고객번호
order by 고객번호;
----A제휴사, 10건이상
SELECT 고객번호, count(CASE WHEN 제휴사='A' THEN 고객번호 END) A경쟁사이용건수 FROM COMPET group by 고객번호
HAVING count(CASE WHEN 제휴사='A' THEN 고객번호 END) > 10
order by 고객번호;
--B 경쟁사 
SELECT 고객번호, count(CASE WHEN 제휴사='B' THEN 고객번호 END) B경쟁사이용건수 FROM COMPET group by 고객번호
order by 고객번호;
--B 경쟁사 10건 (224건)  (15 = 23)
SELECT 고객번호, count(CASE WHEN 제휴사='B' THEN 고객번호 END) B경쟁사이용건수 FROM COMPET group by 고객번호
HAVING count(CASE WHEN 제휴사='B' THEN 고객번호 END) > 15
order by 고객번호;
--C경쟁사 
SELECT 고객번호, count(CASE WHEN 제휴사='C' THEN 고객번호 END) C경쟁사이용건수 FROM COMPET group by 고객번호
order by 고객번호;
--c경정새 10 초과 =78건  (5 = 266건)  
SELECT 고객번호, count(CASE WHEN 제휴사='C' THEN 고객번호 END) C경쟁사이용건수 FROM COMPET group by 고객번호
HAVING count(CASE WHEN 제휴사='C' THEN 고객번호 END) > 10
order by 고객번호;
-- D 경쟁사 
SELECT 고객번호, count(CASE WHEN 제휴사='D' THEN 고객번호 END) D경쟁사이용건수 FROM COMPET group by 고객번호
order by 고객번호;
--D 경쟁사 10 = 12  (5 = 102건)
SELECT 고객번호, count(CASE WHEN 제휴사='D' THEN 고객번호 END) D경쟁사이용건수 FROM COMPET group by 고객번호
HAVING count(CASE WHEN 제휴사='D' THEN 고객번호 END) > 5
order by 고객번호;
