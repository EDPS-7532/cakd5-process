SELECT * FROM EMPLOYEES WHERE JOB_ID LIKE '%\_A%' ESCAPE '\';
SELECT * FROM EMPLOYEES WHERE JOB_ID LIKE '%\_A%' ESCAPE '\';
 
 SELECT * FROM EMPLOYEES WHERE MANAGER_ID = 101 OR MANAGER_ID 102 OR MANAGER_ID 103;
 
 SELECT EMPLOYEE_ID, LAST_NAME, TRUNC((SYSDATE-HIRE_DATE/365) 悦紗尻呪 ぉ鯵ぱ 球つびだにえい;
 
 SELECT TO DATE('20210101')
 TO_CHAR((TO_DATE('20210101'),'MONTHDD YYYY','NLS_DATE_LANGUAGE=ENGLISH') FORMAT1 FROM DUAL;
 
 SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') FROM DUAL;
 SELECT TO_CHAR(SYSDATE, 'YY/MM/DD') FROM DUAL;
 SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
 SELECT TO_CHAR(SYSDATE, 'DAY) FROM DUAL;
 SELECT SALARY, TO_CHAR(SALARY,'09999') FROM EMPLOYEES;
 
 
 SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_dATE, 
 TRUNC((TO_DATE('20201231') - HIRE_dATE)/365)) 悦紗尻呪,
 (WIDTH_BUCKET(TRUNC(((TO_DATE('20.12.31')-HIRE_DATE)/365)),0,20,30)左格什
 (WIDTH_BUCKET(TRUNC(((TO_DATE('20.12.31')-HIRE_DATE)/365)),0,20,30)*1000
 FROM EMPLOYEES
 ORDER BY 左格什 DESC;
 
 SELECT FIRST_NAME 戚硯, SALARY 尻裟,
 FIRST_VALUE(SALARY) OVER(ORDER BY SALARY DESC ROWS PRECEDING) 置壱尻裟
 FROM EMPLOYEES;
 
 SELECT FIRST_NAME 戚硯, SALARY 尻裟,
 LAST_VALUE(SALARY) OVER(ORDER BY SALARY DESC ROWS 3 PRECEDING) 
 FROM EMPLOYEES;
 
 SELECT FIRST_NAME 戚硯, SALARY 尻裟,
 LAST_VALUE(SALARY) OVER (ORDER BY SALARY DESC ROWS 3 PRECEDING)
 FROM EMPLOYEES;
 
 SELECT FIRST_NAME 戚硯 SALARY 尻裟,
 LAST_VALUE(SALARY) OVER (ORDER BY SALARY DESC ROWS BETWEEN 2 
 PRECEDING AND 2 FOLLOWING); 
 FROM EMPLOYEES;
 
 SELECT *
 FROM BOOK
 WHERE PRICE >= 10000 AND PRICE<=20000;
 
 SELECT SUM(SALEPRICE) AS "TOTAL PRICE"J FROM ORDERS WHERE CUSTID= 2;
 SELECT SUM(SALEPRICE) AS TOTAL
 AVE(SALEPRICE) AS AVERAGE
 MAX(SALEPRICE) AS MAXIMUM,
 MIN(SALEPRICE) AS MINUMUN,
 FROM ORDERS;
 
 SELECT COUNT(*) FROM ORDERS;
 
 SELECT CUSTID,COUNT(*) AS 亀辞呪勲
 FROM ORDERS
 WHERE SALEPRICE>= 8000
 GROUP BY CUSTID
 HAVING COUNT(*) >=2;
 
 SELECT*FROM CUSTOMER;
 
 SELECT NAME,SUM(SALEPRICE)
 FROM CUSTOMER,ORDERS
 WHERE CUSTOMER.CUSTID=ORDERS.CUSTID
 GROUP BY CUSTOMER.NAME
 ORDER BY CUSTOMER.NAME;
 
 SELECT CUSTOMER.NAME, BOOK.BOOKNAME
 FROM CUSTOMER, ORDERS, BOOK
 WHERE CUSTOME.CUSTID=ORDERS.CUSTID AND ORDERS.BOOKID=BOOK.BOOKID
 
 SELECT C.NAME, B.BOOKNAME
 FROM CUSTOMER C, ORDERS O , BOOK B
 WHERE C.CUSTID=O.CUSTID=ORDERS.CUSTID AND ORDERS.BOOKID=BOOK.BOOKID
 
 SELECT BOOKNAME
 FROM BOOK
 WHERE PROCE=(SELECT CUSTID FROM ORDERS);
 
 SELECT NAME FROM CUSTOMER WHERE CUSTID IN
 (SELECT CUSTID FROM ORDERS WHERE BOOKID IN
 (SELECT BOOKID FROM BOOK WHERE PUBLISHER='企廃耕巨嬢'));
 
 SELECT NAME
 FROM CUSTOMER
 WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
 
 SELECT B1.BOOKNAME
 FROM BOOK B1
 WHERE B1.PRICE > (SELECT AVG(B2.PRICE)
FROM BOOK B2 WHERE B2.PUBLISHER=B1.PUBLISHER)

SELECT NAME
FROM CUSTOMER
MINUS
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);

SELECT NAME,ADDRESS
FROM CUSTOMER CS
WHERE EXISTS( SELECT* FROM ORDERS OD WHERE CS.CUSTID=OD.CUSTID);

  SELECT SUM(SALEPRICE) AS "TOTAL PRICE FROM ORDERS WHERE CUSTID