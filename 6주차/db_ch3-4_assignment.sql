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


