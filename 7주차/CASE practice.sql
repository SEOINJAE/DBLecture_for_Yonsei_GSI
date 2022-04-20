SHOW DATABASES;

USE mybookstore;

/* 테이블 확인 */
SELECT * FROM orders;
SELECT * FROM customer;
SELECT * FROM book;

/* 조건을 활용한 형식 */
SELECT publisher 
	,CASE WHEN publisher = '굿스포츠' THEN '1'
		 WHEN publisher = '나무수' THEN '2'
		 WHEN publisher = '대한미디어' THEN '3'
		 WHEN publisher = '이상미디어' THEN '4'
		 WHEN publisher = '삼성당' THEN '5' ELSE '6'
	 END as 'publisher_no'
FROM book
ORDER BY publisher_no ASC;  



/* 예시 2번째 */
SELECT
	name
	, address
	,CASE WHEN address LIKE '%대한민국%' THEN '내국인' ELSE '외국인' 
	END AS resident 
FROM Customer;



/* CASE문 응용 문제
주소가 대한민국이면 내국인으로, 아니면 외국인으로 분류한 후
내국인과 외국인 그룹 각각의 도서 총판매액과 평균 판매액을 구하시오.
 */
 
 # 1번 풀이
 SELECT CASE WHEN b.address LIKE '%대한민국%' THEN '내국인' ELSE '외국인'
		END AS resident
	  , SUM(saleprice) AS '총 판매액'
      , ROUND(AVG(saleprice)) AS '평균 판매액'
FROM orders AS a
	LEFT JOIN customer AS b on a.custid = b.custid
GROUP BY resident
ORDER BY resident; -- CASE문의 컬럼은 정렬하는 기준으로 사용가능하다.
 
# 2번 풀이 : 서브쿼리를 활용한 풀이
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
GROUP BY resident;






