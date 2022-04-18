SHOW DATABASES;

USE mybookstore;

SELECT *
FROM orders
;

SELECT *
FROM customer;

SELECT *
FROM book;

/* 조건을 활용한 형식 */
SELECT publisher 
	,CASE WHEN publisher = '굿스포츠' THEN '1'
		 WHEN publisher = '나무수' THEN '2'
		 WHEN publisher = '대한미디어' THEN '3'
		 WHEN publisher = '이상미디어' THEN '4'
		 WHEN publisher = '삼성당' THEN '5' ELSE '6'
	 END as '출판사 번호'
FROM book;  



/* 예시 2번째 */
SELECT
	name
	, address
	,CASE WHEN address LIKE '%대한민국%' THEN '내국인' ELSE '외국인' 
	END AS '내/외국인' 
FROM Customer;



/* CASE 응용 */
SELECT resident
	, SUM(saleprice) as '총 판매액'
    , ROUND(AVG(saleprice)) as '평균 판매액'
FROM
(
SELECT a.*
	, b.name
    , b.address
    , b.phone
	,CASE WHEN b.address LIKE '%대한민국%' THEN '내국인' ELSE '외국인' 
	END AS 'resident' 
FROM orders as a
	LEFT JOIN Customer as b on a.custid = b.custid
) as c
GROUP BY resident
;

SELECT CASE WHEN b.address LIKE '%대한민국%' THEN '내국인' ELSE '외국인'
		END AS resident
	  , SUM(saleprice) AS '총 판매액'
      , ROUND(AVG(saleprice)) AS '평균 판매액'
FROM orders AS a
	LEFT JOIN customer AS b on a.custid = b.custid
GROUP BY resident;



