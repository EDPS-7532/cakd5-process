--2014 ~ 2015�� ������ 4�� ȸ�� ���� ������
SELECT * FROM PURPROD;
SELECT COUNT(*) FROM PURPROD WHERE ���޻�='A' ; 
-- �� �Ӽ�����
SELECT * FROM CUSTDEMO;
-- ���� 19383���� (������ ���ɴ븦 �ͽ��� �� ����)
SELECT COUNT(*) FROM CUSTDEMO;
-- ������ ȸ��(��ȭ��, ��Ʈ , ���� , �ӽ�) >> ���� ������ ä��
SELECT * FROM COMPET;

SELECT * FROM CHANNEL;
--���������
SELECT * FROM MEMBERSHIP;
--��ǰ �з��ڵ� (���� ��ǰ�з��� �ٸ���) >> ���պз�ü�踦 ����°� �߿�. -- ���������� �߿��ϴ�.(����� ���������� ���� ��Ȯ�ϰ� �ؼ��� �����ϴ�)
SELECT * FROM PRODCL2;
SELECT COUNT(*) FROM prodcl2;
select count(*) from prodcl2 where ���޻�='A';

SELECT * FROM PURPROD;

-- �� �Ӽ������� ��Ī�� �Ͽ� ���
SELECT * FROM PURPROD;
-- ū �׸��� �׸��� ���ؼ� ����м��� �ؾ��Ѵ�.
-- ����(����)�м�
SELECT YEAR, ROUND(SUM(���űݾ�)) �ѱ��ž�, ROUND( AVG(���űݾ�)) ��ձ��ž�
FROM PURPROD
GROUP BY YEAR;

-- # ���Ӽ�
-- ����, ���ɺ�, ��������, �پ��� ���պ� ���� ��ȭ
-- ����� �̿�, ����� �̿�, �¶��� ä�ο� ���� ���� Ư�̼�


-- ������ ��
-- ## �����ൿ������ ��ȭ

-- �پ��� �� ������ ���� ����, ��ǰ ���� ������ ��ȭ, ���� ����(�ð�,��ҵ�)

-- # ���� ȯ�濡 ���� ����(������)
ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR=substr(��������,1,4);
COMMIT;

SELECT * FROM PURPROD;
COMMIT;

CREATE TABLE PURBYYEAR AS
SELECT ����ȣ, YEAR, SUM(���űݾ�) ���ž�
FROM PURPROD
GROUP BY ����ȣ, YEAR
ORDER BY ����ȣ;

SELECT * FROM PURBYYEAR;




CREATE TABLE pur_amt AS
SELECT ����ȣ cusno, sum(���űݾ�) puramt
FROM PURPROD
GROUP BY ����ȣ 
ORDER BY ����ȣ;


ALTER TABLE PURPROD ADD MONTH NUMBER;
UPDATE PURPROD SET MONTH = substr(��������,5,2);
COMMIT;

SELECT ��ǰ�з�, COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD, PRODCL2 WHERE PURPROD.�Һз��ڵ� = PRODCL2.�Һз��ڵ�
GROUP BY ��ǰ�з�;

SELECT ��ǰ�з�, �Һ���з�, COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015"
FROM PURPROD, PRODCL2 WHERE PURPROD.�Һз��ڵ� = PRODCL2.�Һз��ڵ�
GROUP BY ��ǰ�з�, �Һ���з� ORDER BY ��ǰ�з�;



SELECT �Һ���з�, COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD, PRODCL2 WHERE PURPROD.�Һз��ڵ� = PRODCL2.�Һз��ڵ�
GROUP BY �Һ���з�;



--���� ���ŰǼ�, ���űݾ�
CREATE TABLE PUR_MONTH AS SELECT MONTH,
COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD GROUP BY MONTH ORDER BY MONTH;

SELECT * FROM PUR_MONTH;
DROP TABLE PUR_MONTH;

CREATE TABLE PUR_PERIOD AS SELECT channel.���޻�,
COUNT(CASE WHEN YEAR=2014 THEN channel.����ȣ END) "14�ⱸ�ŰǼ�", 
COUNT(CASE WHEN YEAR=2015 THEN channel.����ȣ END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�" FROM purprod
LEFT OUTER JOIN channel ON PURPROD.����ȣ = channel.����ȣ
GROUP BY channel.���޻�;

select*

select * from pur_area2
order by ���޻�;

drop table c3;
select * from prodcl2;
select count(*) from prodcl2;

--���� ���ŰǼ�, ���űݾ�
CREATE TABLE PUR_MONTH1 AS SELECT MONTH,
COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD WHERE ���޻�='A', GROUP BY MONTH ORDER BY MONTH;


SELECT*FROM PUR_MONTH1;
SELECT*FROM PUR_MONTH2;
SELECT* FROM PUR_MONTH3;
select* from PUR_MONTH4;
DROP TABLE PUR_MONTH;

SELECT*FROM PRODCL2;
SELECT COUNT(*) FROM PURPROD WHERE �����ڵ�='042';



----A���޻�
SELECT ����ȣ, count(CASE WHEN ���޻�='A' THEN ����ȣ END) A������̿�Ǽ� FROM COMPET group by ����ȣ
order by ����ȣ;
----A���޻�, 10���̻�
SELECT ����ȣ, count(CASE WHEN ���޻�='A' THEN ����ȣ END) A������̿�Ǽ� FROM COMPET group by ����ȣ
HAVING count(CASE WHEN ���޻�='A' THEN ����ȣ END) > 10
order by ����ȣ;
--B ����� 
SELECT ����ȣ, count(CASE WHEN ���޻�='B' THEN ����ȣ END) B������̿�Ǽ� FROM COMPET group by ����ȣ
order by ����ȣ;
--B ����� 10�� (224��)  (15 = 23)
SELECT ����ȣ, count(CASE WHEN ���޻�='B' THEN ����ȣ END) B������̿�Ǽ� FROM COMPET group by ����ȣ
HAVING count(CASE WHEN ���޻�='B' THEN ����ȣ END) > 15
order by ����ȣ;
--C����� 
SELECT ����ȣ, count(CASE WHEN ���޻�='C' THEN ����ȣ END) C������̿�Ǽ� FROM COMPET group by ����ȣ
order by ����ȣ;
--c������ 10 �ʰ� =78��  (5 = 266��)  
SELECT ����ȣ, count(CASE WHEN ���޻�='C' THEN ����ȣ END) C������̿�Ǽ� FROM COMPET group by ����ȣ
HAVING count(CASE WHEN ���޻�='C' THEN ����ȣ END) > 10
order by ����ȣ;
-- D ����� 
SELECT ����ȣ, count(CASE WHEN ���޻�='D' THEN ����ȣ END) D������̿�Ǽ� FROM COMPET group by ����ȣ
order by ����ȣ;
--D ����� 10 = 12  (5 = 102��)
SELECT ����ȣ, count(CASE WHEN ���޻�='D' THEN ����ȣ END) D������̿�Ǽ� FROM COMPET group by ����ȣ
HAVING count(CASE WHEN ���޻�='D' THEN ����ȣ END) > 5
order by ����ȣ;
