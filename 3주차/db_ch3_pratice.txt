SHOW DATABASES; -- 서버에 존재하는 데이터 베이스 확인
CREATE DATABASE mydb; -- 데이터 베이스 생성
-- DROP DATABASE mydb; -- 데이터 베이스 삭제

USE mydb; -- 사용할 데이터 베이스 선택

SHOW tables; -- 데이터 베이스내에 존재하는 테이블 확인
-- DROP TABLE 삭제할 테이블 이름; -- 테이블 삭제

/* department table 정의 및 생성 */
CREATE TABLE department (
    dept_name	VARCHAR(20),
    building	VARCHAR(15),
    budget		NUMERIC(12 , 2 ),
    PRIMARY KEY (dept_name)
);

/* instructor table 정의 및 생성 */
CREATE TABLE instructor (
    ID			CHAR(5),
    name		VARCHAR(20) NOT NULL,
    dept_name	VARCHAR(20),
    salary		NUMERIC(8 , 2 ),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES department (dept_name)
);

/* 테이블 확인 */
DESC department;
DESC instructor;

/* 생성된 테이블 출력 */
SELECT *
FROM department;

SELECT *
FROM instructor;

/* department table 데이터 삽입 */
INSERT INTO department VALUES('Comp. Sci.', 'Taylor', 100000);
INSERT INTO department VALUES('Physics', 'Watson', 70000);

/* department table 데이터 삽입 결과 확인 */
SELECT *
FROM department;

/* instructor table 데이터 삽입 */
INSERT INTO instructor VALUES ('10101', 'Srinivasan','Comp. Sci.', '65000');
INSERT INTO instructor VALUES ('22222', 'Einstein', 'Physics', '95000');

/* instructor 테이블 데이터 삽입 결과 확인 */
SELECT *
FROM instructor;

/* 예시 : 컬럼 출력*/
SELECT budget, dept_name
FROM department;

/* 예시 : 조건절 사용 */
SELECT *
FROM department
WHERE budget > 70000;
