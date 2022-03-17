SHOW DATABASES; -- 서버에 존재하는 데이터 베이스 확인

CREATE DATABASE mybookstore; -- 데이터 베이스 생성

USE mybookstore; -- 데이터 베이스 사용

SHOW TABLES; -- 데이터 베이스내에 존재하는 테이블 확인

# 테이블 삭제 명령어
-- DROP TABLE Orders;
-- DROP TABLE Book;
-- DROP TABLE Customer;

-----------------------------------------------------------------

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
	custid NUMERIC (10), # INT와의 차이점
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

-----------------------------------------------------------------

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


-----------------------------------------------------------------

SHOW TABLES;

# 실습 1) 모든 도서의 이름과 가격을 검색하시오.
SELECT bookname, price
FROM Book;

# 실습 2) 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
SELECT *
FROM Book;

# 실습 3) 도서 테이블에 있는 모든 출판사를 검색하시오
SELECT DISTINCT publisher
FROM Book;

# 실습 4) 가격이 20,000원 미만인 도서를 검색하시오
SELECT bookname
FROM Book
WHERE price <= 20000;

# 실습 5) 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오
SELECT bookname 
FROM Book
WHERE price >= 10000 and price <= 20000;