SHOW DATABASES;

USE mybookstore;

SHOW TABLES;

SELECT *
FROM Customer;

SELECT *
FROM Orders;

SELECT *
FROM Book;

# 6) 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
--  Nature join
SELECT *
FROM Customer, Orders
WHERE Customer.custid = Orders.custid;

SELECT *
FROM Customer NATURAL JOIN Orders;

-- INNER JOIN
SELECT *
FROM Customer as a
	INNER JOIN Orders as b on a.custid = b.custid;

-- LEFT JOIN
SELECT *
FROM Customer as a
	LEFT JOIN Orders as b on a.custid = b.custid;

    
# 7) 고객의 이름과 고객이 주문한 도서의 가격을 검색하시오.
SELECT name, saleprice
FROM Customer, Orders
WHERE Customer.custid = Orders.custid;


SELECT a.name
	, b.saleprice
FROM Customer as a
	INNER JOIN Orders as b on a.custid = b.custid;
    
# 8) 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
SELECT name, bookname
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid
AND Orders.bookid = Book.bookid
;

SELECT a.name
	, c.bookname
FROM Customer as a
    INNER JOIN Orders as b on a.custid = b.custid
	INNER JOIN Book as c on b.bookid = c.bookid
;


# 9) 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
SELECT a.name
	, c.bookname
FROM Customer as a
	, Orders as b
    , Book as c
WHERE a.custid = b.custid
AND b.bookid = c.bookid
AND saleprice = 20000
;

SELECT a.name
	, c.bookname
FROM Customer as a
    INNER JOIN Orders as b on a.custid = b.custid
	INNER JOIN Book as c on b.bookid = c.bookid
WHERE saleprice = 20000
;

# 10) 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 보이시오.
SELECT *
FROM Customer, Orders
WHERE Customer.custid = Orders.custid
ORDER BY Customer.custid
;


SELECT *
FROM Customer as a
	INNER JOIN Orders as b on a.custid = b.custid
ORDER BY a.custid
;

# 11) 도서이름에 '축구'가 포함된 출판사를 검색하시오.
SELECT bookname
	, publisher
FROM Book
WHERE bookname LIKE '%축구%'
;

# 12) 도서이름 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 모두 검색하시오.
SELECT *
FROM Book
WHERE bookname LIKE '_구%'
;

# 13) 출판사가 '굿스포츠'혹은 '대한미디어'인 도서를 검색하시오.
SELECT *
FROM Book
WHERE 1=1
AND publisher = '굿스포츠' or publisher = '대한미디어'
-- AND publisher LIKE '굿스포츠' or publisher LIKE '대한미디어' 
;

# 14) 도서를 이름순으로 검색하시오.
SELECT *
FROM Book
ORDER BY bookname
;

# 15) 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 검색한다.
SELECT *
FROM Book
ORDER BY price DESC
	, publisher ASC
;



# 16) '이상미디어' 출판사 혹은 '대한미디어' 출판사에서 출판한 책의 제목과 가격을 검색하시오.
# (단, 반드시 set opertion을 사용하시오)

(SELECT bookname
	, price
    , publisher
FROM book
WHERE publisher LIKE '이상미디어')

UNION

(SELECT bookname
	, price
	, publisher
FROM book
WHERE publisher = '대한미디어')
;