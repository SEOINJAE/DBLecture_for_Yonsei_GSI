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

SELECT * 
FROM vw_info_customer
;

