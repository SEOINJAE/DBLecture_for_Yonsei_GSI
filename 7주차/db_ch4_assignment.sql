USE mybookstore;

/* 1) 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 가격을 구하시오. */
SELECT name
	, saleprice
FROM Customer as a
	LEFT JOIN Orders as b on a.custid = b.custid
;
/* 2) 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오.
	단, 뷰의 이름은 vw Customer로 한다. */

CREATE VIEW vw_Customer as
SELECT *
FROM customer
WHERE address LIKE '%대한민국%'
;

SELECT *
FROM vw_Customer
;


/* 3) Orders 테이블에 고객이름과 도서이름을 바로 확인할 수 있는 뷰를 생성한 후, 
 ‘김연아’ 고객이 구입한 도서의 주문번호, 도서이름, 주문액을 보이시오. */
CREATE VIEW vw_info_customer as
SELECT a.*
	, b.name, b.address, b.phone
    ,c.bookname, c.publisher, c.price
FROM orders as a
	INNER JOIN customer as b on a.custid = b.custid
	INNER JOIN book as c on a.bookid = c.bookid
;


SELECT bookid
	, bookname
    , saleprice
FROM vw_info_customer
WHERE name = '김연아'
;

/* 4) 앞서 생성한 뷰 vw_Customer를 삭제하여라. */
DROP VIEW vw_Customer;
DROP VIEW vw_info_customer;

# 삭제 확인
SELECT *
FROM vw_customer;

SELECT *
FROM vw_info_customer;


/* 실습: 서점 데이터(Cascading Actions) */
# Orders 테이블에 수정/삭제에 대한 cascade 옵션을 추가하시오.
alter table Orders 
add constraint orders_ibfk_customer
foreign key(custid) references Customer (custid)
on delete cascade
on update cascade;


alter table Orders 
add constraint orders_ibfk_book
foreign key(bookid) references Book (bookid) 
on delete cascade
on update cascade;

-- alter table Orders drop foreign key orders_ibfk_1;
-- alter table Orders drop foreign key orders_ibfk_2;

select * from information_schema.table_constraints;


DELETE
FROM Customer 
WHERE name = '박지성'
;

UPDATE Customer
SET custid = '12'
WHERE name = '김연아'
;

DELETE
FROM book
WHERE publisher = '굿스포츠'
;
