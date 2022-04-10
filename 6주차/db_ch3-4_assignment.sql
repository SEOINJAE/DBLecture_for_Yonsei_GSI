SHOW DATABASES;

USE MYBOOKSTORE;


# ----------------------------------------------------------------------------------

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


/* 26) 평균 도서 가격이 10,000원 이상인 출판사를 보이시오.
(반드시, Derived Relation 사용) */
SELECT publisher
FROM(
	SELECT publisher
		, AVG(price) as avg_price
	FROM book
	Group by publisher
) a
WHERE avg_price >= 10000
;


SELECT publisher, AVG(price)
FROM book
GROUP BY publisher
;


/* 27) 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
(반드시, Correlated Subquery 사용). */
SELECT bookname
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
AND EXISTS (SELECT 1
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
set sql_safe_updates=0; # Error Code: 1175 일시적으로 세이프 모드 해제

UPDATE Customer as a
SET a.address = (SELECT b.address
				 FROM (SELECT address
					  FROM Customer
					  WHERE name = '김연아') as b)
WHERE name = '박세리'
;


/* 32) Customer 테이블에서 고객번호가 5인 고객을 삭제하시오. */
DELETE FROM customer
WHERE custid = 5
;

SELECT *
FROM customer
; 

/* 33) 모든 고객을 삭제하시오.*/
/*
아래 SQL 문은 실행되지 않는다.
그 이유는 Orders 테이블에서 Customer.custid 속성을 외래키로 참조하고 있기 때문이다.
제약이 해제되지 않으면 데이터 삭제가 중지된다.
*/
DELETE FROM customer;


#-----------------------------------------------------------------------------
/* 삭제한 테이블을 다시 생성해서 테스트할 경우 활용 */
# 테이블 삭제 명령어
DROP TABLE Orders;
DROP TABLE Book;
DROP TABLE Customer;

# 테이블 다시생성
/* Book table 생성 */
CREATE TABLE Book(
	bookid NUMERIC (10),
	bookname VARCHAR (30),
	publisher VARCHAR (20),
	price NUMERIC (10),
	PRIMARY KEY (bookid)
);

/* Customer 테이블 생성 */
CREATE TABLE Customer(
	custid NUMERIC (10),
	name VARCHAR (10),
	address VARCHAR (20),
	phone VARCHAR (20),
	PRIMARY KEY (custid)
);

/* foregin key를 만들 때 참조되는 table을 반드시 먼저 만들어야 한다. */
/* Orders 테이블 생성 */
CREATE TABLE Orders(
	orderid NUMERIC (10),
	custid NUMERIC (10),
	bookid NUMERIC (10),
	saleprice NUMERIC (10),
	orderdate VARCHAR (10),
	PRIMARY KEY (orderid),
	FOREIGN KEY (bookid) references Book(bookid),
	FOREIGN KEY (custid) references Customer(custid)
);


# 생성된 테이블 확인
SHOW TABLES;

# 테이블 출력
SELECT *
FROM Orders;

#-----------------------------------------------------------------

# Book 테이블 데이터 삽입
INSERT INTO book VALUES (1, '축구의  역사', '굿스포츠', 7000);
INSERT INTO book VALUES (2, '축구 아는 여자', '나무수', 13000);
INSERT INTO book VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO book VALUES (4, '골프 바이블', '대한미디어', 35000);
INSERT INTO book VALUES (5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO book VALUES (6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO book VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO book VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO book VALUES (10, 'Olympic Champions', 'Pearson', 13000);

# Book table 데이터 삽입 확인
SELECT *
FROM book;

# Customer 데이터 삽입
INSERT INTO customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO customer VALUES (5, '박세리', '대한민국 대전', NULL);

# Customer table 데이터 삽입 확인
SELECT *
FROM customer;

#  Orders 테이블 데이터 삽입
/*
 book, customer 테이블에 먼저 튜플을 입력해야 orders 의 튜플을 입력할 때 오류가 발생하지 않았습니다.
 즉, orders 의 foreign key 인 bookid, custid 의 값이 book, customer 테이블에 이미 존재해야 오류가 발생하지 않았습니다.
*/

INSERT INTO orders VALUES (1, 1, 1, 6000, '2013-07-01');
INSERT INTO orders VALUES (2, 1, 3, 21000, '2013-07-03');
INSERT INTO orders VALUES (3, 2, 5, 8000, '2013-07-03');
INSERT INTO orders VALUES (4, 3, 6, 6000, '2013-07-04');
INSERT INTO orders VALUES (5, 4, 7, 20000, '2013-07-05');
INSERT INTO orders VALUES (6, 1, 2, 12000, '2013-07-07');
INSERT INTO orders VALUES (7, 4, 8, 13000, '2013-07-07');
INSERT INTO orders VALUES (8, 3, 10, 12000, '2013-07-08');
INSERT INTO orders VALUES (9, 2, 10, 7000, '2013-07-09');
INSERT INTO orders VALUES (10, 3, 8, 13000, '2013-07-10');

# Orders 테이블 데이터 삽입 확인
SELECT *
FROM Orders;








