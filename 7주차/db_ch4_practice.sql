SHOW DATABASES;

USE mybookstore;

SHOW TABLES;

# CASCADE 옵션 실습
/* 테이블 삭제 */
DROP TABLE instructor;
DROP TABLE department;

/* Department 테이블 먼저 생성 (참조가 될 테이블) */
CREATE TABLE department (
    dept_name   	VARCHAR (20), 
    building        VARCHAR (15), 
    budget          NUMERIC (12,2),
    PRIMARY KEY (dept_name)
);

/* Department 테이블의 dept_name 컬럼을 참조하는 
instructor 테이블의 dept_name 컬럼 */
CREATE TABLE instructor (
    ID               CHAR(5),
    name          	 VARCHAR(20) NOT NULL,
    dept_name  		 VARCHAR(20),
    alary            NUMERIC(8,2),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES 
                 department (dept_name)
                -- ON DELETE CASCADE
                -- ON UPDATE CASCADE
);

/* 참조가될 department 테이블에 먼저 데이터 삽입 */
INSERT INTO department VALUES ('biology', 'watson', '90000');
INSERT INTO department VALUES ('comp. sci.', 'taylor', '100000');

/* instructor 테이블에 데이터 삽입 */
INSERT INTO instructor VALUES ('10101', 'srini', 'comp. sci.', 65000);
INSERT INTO instructor VALUES ('45565', 'katz', 'comp. sci.', 75000);

/* 데이터 확인 */
SELECT * FROM instructor;
SELECT * FROM department;

/* Finance라는 부서명을 가지고 있는 Wu를 instructor 테이블에 입력 */
INSERT INTO instructor VALUES ('12121', 'Wu', 'Finance', 90000);

-- --------------------------------------------------------------------------
# ON DELETE CASCADE 옵션 실습

DROP TABLE instructor;
DROP TABLE department;

/* Department 테이블 먼저 생성 (참조가 될 테이블) */
CREATE TABLE department (
    dept_name   	VARCHAR (20), 
    building        VARCHAR (15), 
    budget          NUMERIC (12,2),
    PRIMARY KEY (dept_name)
);

/* Department 테이블의 dept_name 컬럼을 참조하는 
instructor 테이블의 dept_name 컬럼 */
CREATE TABLE instructor (
    ID               CHAR(5),
    name          	 VARCHAR(20) NOT NULL,
    dept_name  		 VARCHAR(20),
    alary            NUMERIC(8,2),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES 
                 department (dept_name)
                 ON DELETE CASCADE
                 ON UPDATE CASCADE
);

/* 참조가될 department 테이블에 먼저 데이터 삽입 */
INSERT INTO department VALUES ('biology', 'watson', '90000');
INSERT INTO department VALUES ('comp. sci.', 'taylor', '100000');

/* instructor 테이블에 데이터 삽입 */
INSERT INTO instructor VALUES ('10101', 'srini', 'comp. sci.', 65000);
INSERT INTO instructor VALUES ('45565', 'katz', 'comp. sci.', 75000);

/* ON DELETE CASCADE 옵션 때문에 참조관계와 상관없이 데이터 삭제 가능 */
DELETE FROM department WHERE dept_name='comp. sci.';

/* 데이터 변경 확인 */
SELECT * FROM instructor;
SELECT * FROM department;

#----------------------------------------------------------------------------
# ON UPDATE CASCADE실습

/* 이전에 생성된 테이블 삭제 후 다시 생성 */
DROP TABLE instructor;
DROP TABLE department;

/* Department 테이블 먼저 생성 (참조가 될 테이블) */
CREATE TABLE department (
    dept_name   	VARCHAR (20), 
    building        VARCHAR (15), 
    budget          NUMERIC (12,2),
    PRIMARY KEY (dept_name)
);

/* Department 테이블의 dept_name 컬럼을 참조하는 
instructor 테이블의 dept_name 컬럼 */
CREATE TABLE instructor (
    ID               CHAR(5),
    name          	 VARCHAR(20) NOT NULL,
    dept_name  		 VARCHAR(20),
    alary            NUMERIC(8,2),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES 
                 department (dept_name)
                 ON DELETE CASCADE
                 ON UPDATE CASCADE
);

/* 참조가될 department 테이블에 먼저 데이터 삽입 */
INSERT INTO department VALUES ('biology', 'watson', '90000');
INSERT INTO department VALUES ('comp. sci.', 'taylor', '100000');

/* instructor 테이블에 데이터 삽입 */
INSERT INTO instructor VALUES ('10101', 'srini', 'comp. sci.', 65000);
INSERT INTO instructor VALUES ('45565', 'katz', 'comp. sci.', 75000);

/* 생성한 데이터 확인 */
SELECT * FROM department;
SELECT * FROM instructor;

/* ON DELETE UPDATE 옵션 때문에 참조관계와 상관없이 데이터 업데이트 가능
   또한, Department 테이블을 참고 하고 있는 Instructor 테이블의 데이터도 업데이트 된다.
 */
UPDATE department SET dept_name='CS' WHERE dept_name='Comp. Sci.';

UPDATE instructor SET dept_name='CS' WHERE dept_name='Comp. Sci.';

/* 데이터 변경 확인 */
SELECT * FROM department;
SELECT * FROM instructor;





