SHOW DATABASES;

USE mybookstore;

/* 전체 랭크 */
SELECT saleprice
	, RANK() OVER (ORDER BY saleprice) AS ALL_RANK
	, DENSE_RANK() OVER (ORDER BY saleprice) AS DNS_RANK
    , ROW_NUMBER() OVER (ORDER BY saleprice) AS ROW_NUM
FROM orders;


/* 파티션 랭크 */
SELECT publisher 
	, saleprice
	, RANK() OVER (PARTITION BY publisher ORDER BY saleprice) AS ALL_RANK
	, DENSE_RANK() OVER (PARTITION BY publisher ORDER BY saleprice) AS DNS_RANK
    , ROW_NUMBER() OVER (PARTITION BY publisher ORDER BY saleprice) AS ROW_NUM
FROM orders AS a
	LEFT JOIN book AS B ON a.bookid = b.bookid
ORDER BY publisher;


/* Aggregation function */
SELECT orderid 
	, publisher
    , saleprice
 	, SUM(saleprice) OVER (ORDER BY orderid) AS cum_sum 
FROM orders AS a
	LEFT JOIN book AS B ON a.bookid = b.bookid;

/* Aggregation with partition */
SELECT orderid 
	, publisher
    , saleprice
    , SUM(saleprice) OVER (PARTITION BY publisher ORDER BY orderid) AS cum_sum 
FROM orders AS a
	LEFT JOIN book AS B ON a.bookid = b.bookid;


