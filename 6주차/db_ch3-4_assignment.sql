SHOW DATABASES;

USE MYBOOKSTORE;


/* 24) 가장 비싼 도서의 이름은 무엇인가? */
SELECT bookname
FROM book
WHERE price IN (SELECT MAX(price)
				FROM book)
;

SELECT MAX(price) -- 도서 이름 출력이 불가능
FROM book
;

SELECT bookname
FROM book
ORDER BY price DESC
LIMIT 1
;

/* 25) 도서를 구매한 적이 있는 고객의 이름을 검색하시오. */
SELECT name
FROM Customer
WHERE custid IN (SELECT DISTINCT custid
				 FROM Orders)
;


/* 26) 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
(반드시, Derived Relation 사용) */

SELECT *
FROM(
	SELECT publisher
		, AVG(price) as avg_price
	FROM book
	GROUP BY publisher
) a
WHERE price > avg_price 
;


select publisher, price, avg(price)
from book
group by publisher, price
;

select *
from book
;


/* 27) 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
(반드시, Correlated Subquery 사용). */
SELECT *
FROM book as a
WHERE a.price > (SELECT AVG(price)
				 FROM book as b
				 WHERE a.publisher = b.publisher)
;


/* 28) 주문이 있는 고객의 이름과 주소를 보이시오. */
SELECT name
	, address
FROM customer
WHERE custid IN (SELECT custid
				 FROM orders)
;


SELECT name
	, address
FROM customer as a
WHERE 1=1
AND EXISTS (SELECT custid
			FROM orders as b
			WHERE a.custid = b.custid)
;

/* 29) Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오.
스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다. */
SELECT *
FROM book;

INSERT INTO book VALUES ('11', '스포츠 의학', '한솔의학서적', 90000);

/* 30) Customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오.*/
SELECT *
FROM customer
;

UPDATE customer
SET address = '대한민국 부산'
WHERE custid = 5
;


/* 31) Customer 테이블에서 박세리의 고객의 주소를 김연아 고객의 주소로 변경하시오. */
-- DELETE FROM customer
-- WHERE custid = 5
;

-- DELETE FROM customer;











