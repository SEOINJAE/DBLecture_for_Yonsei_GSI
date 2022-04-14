SHOW DATABASES;

USE mybookstore;

SHOW TABLES;

# ON DELETE CASCADE 옵션 실습

/* 테이블 삭제 */
-- DROP TABLE instructor;
-- DROP TABLE department;

/* Department 테이블 먼저 생성 (참조가 될 테이블) */
create table department (
    dept_name   	varchar (20), 
    building        varchar (15), 
    budget          numeric (12,2),
    primary key (dept_name)
);

/* Department 테이블의 dept_name 컬럼을 참조하는 
instructor 테이블의 dept_name 컬럼 */
create table instructor (
    ID               char(5),
    name          	 varchar(20) not null,
    dept_name  		 varchar(20),
    alary            numeric(8,2),
    primary key (ID),
    foreign key (dept_name) references 
                 department (dept_name)
                 on delete cascade
                 on update cascade
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
# ON DELETE UPDATE 실습

/* 이전에 생성된 테이블 삭제 후 다시 생성 */
DROP TABLE instructor;
DROP TABLE department;

/* Department 테이블 먼저 생성 (참조가 될 테이블) */
create table department (
    dept_name   	varchar (20), 
    building        varchar (15), 
    budget          numeric (12,2),
    primary key (dept_name)
);

/* Department 테이블의 dept_name 컬럼을 참조하는 
instructor 테이블의 dept_name 컬럼 */
create table instructor (
    ID               char(5),
    name          	 varchar(20) not null,
    dept_name  		 varchar(20),
    alary            numeric(8,2),
    primary key (ID),
    foreign key (dept_name) references 
                 department (dept_name)
                 on delete cascade
                 on update cascade
);

/* 참조가될 department 테이블에 먼저 데이터 삽입 */
INSERT INTO department VALUES ('biology', 'watson', '90000');
INSERT INTO department VALUES ('comp. sci.', 'taylor', '100000');

/* instructor 테이블에 데이터 삽입 */
INSERT INTO instructor VALUES ('10101', 'srini', 'comp. sci.', 65000);
INSERT INTO instructor VALUES ('45565', 'katz', 'comp. sci.', 75000);

/* ON DELETE UPDATE 옵션 때문에 참조관계와 상관없이 데이터 삭제 가능 */
UPDATE department SET dept_name='CS' WHERE dept_name='Comp. Sci.';

/* 데이터 변경 확인 */
SELECT * FROM instructor;

SELECT * FROM department;


