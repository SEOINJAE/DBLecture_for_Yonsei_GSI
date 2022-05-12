SHOW DATABASES;

DROP DATABASE finalTest;
CREATE DATABASE finalTest;

USE finalTest;


# (a)번
/* Studio 테이블 생성 */
create table Studio(
	Name varchar(20),
	Address varchar(10),
	Phone varchar(10),
primary key (Name));

/* Producer 테이블 생성 */
create table Producer(
	Num varchar(5),
	Name varchar(10),
	Gender varchar(5),
	Address varchar(5),
primary key(Num));

/* Star 테이블 생성 */
create table Star(
	Name varchar(20),
	Age int,
	Gender varchar(5),
primary key(Name));

/* Movie 테이블 생성 */
create table Movie(
	Title varchar(30),
	Year int,
	Length int,
	Studio_Name varchar(20),
	Producer_Num varchar(5),
primary key (Title,Year),
foreign key (Studio_Name) references Studio(Name),
foreign key (Producer_Num) references Producer(Num));


/* Starsin 테이블 생성 */
create table StarsIn(
	Movie_Title varchar(30),
	Movie_Year int,
	Star_Name varchar(20),
primary key(Movie_Title, Movie_Year, Star_Name),
foreign key (Movie_Title, Movie_Year) references Movie(Title,Year),
foreign key (Star_Name) references Star(Name));

SHOW TABLES;

/* Studio 테이블에 데이터 삽입 */
insert into Studio values ('SM Studio', 'Korea', '111-1234');
insert into Studio values ('Disney Studio','USA','222-1234');
insert into Studio values ('Fox Studio','USA','333-1234');


/* Producer 테이블에 데이터 삽입 */
insert into Producer values ('P1', 'Lucas', 'M', 'USA');
insert into Producer values ('P2', 'Spielberg', 'M', 'USA');
insert into Producer values ('P3', 'Patty', 'F', 'USA');
insert into Producer values ('P4', 'Jennifer', 'F', 'USA');

/* Star 테이블에 데이터 삽입 */
insert into Star values ('Robert Downey', 48, 'M');
insert into Star values ('Chris Evans', 60, 'M');
insert into Star values ('Brad pitt', 48, 'M');
insert into Star values ('Angelina Jolie', 48, 'F');
insert into Star values ('Elsa', null, 'F');
insert into Star values ('Anna', null, 'F');
insert into Star values ('Jennifer', 45, 'F');

/* Movie 테이블에 데이터 삽입*/
insert into Movie values ('Star Wars', 1977, 95, 'Fox Studio', 'P1');
insert into Movie values ('Star Wars', 2010, 130, 'Fox Studio', 'P1');
insert into Movie values ('Star Wars', 2017, 120, 'Fox Studio', 'P2');
insert into Movie values ('Moana', 1990, 110, 'Disney Studio', 'P2');
insert into Movie values ('Lion King', 1990, 120, 'Disney Studio', 'P3');
insert into Movie values ('Lion King', 1995, 120, 'Disney Studio', 'P4');
insert into Movie values ('Frozen', 2013, 109, 'SM Studio', 'P4');
insert into Movie values ('Frozen', 2015, 109, 'SM Studio', 'P1');

/*StarsIn 테이블에 데이터 삽입*/
insert into StarsIn values ('Star Wars',1977,'Robert Downey');
insert into StarsIn values ('Star Wars',1977,'Chris Evans');
insert into StarsIn values ('Star Wars',2010,'Robert Downey');
insert into StarsIn values ('Star Wars',2010,'Chris Evans');
insert into StarsIn values ('Star Wars',2010,'Angelina Jolie');
insert into StarsIn values ('Star Wars',2017,'Elsa');
insert into StarsIn values ('Frozen',2013,'Elsa');
insert into StarsIn values ('Frozen',2015,'Anna');


/* 데이터 삽입 확인*/
SELECT * FROM Studio;
SELECT * FROM Producer;
SELECT * FROM Star;
SELECT * FROM Movie;
SELECT * FROM StarsIn;

#(b)번
select Title
from movie
where Length >= 115;

#(c)번
select b.Name
	, b.Address
from Movie as a
	inner join Producer as b on a.producer_num = b.num
where a.Year = 1990
and a.Studio_name = 'Disney Studio';

# (d)번
select Name
from Star
where Age is null;


# (e)번
select distinct b.Name
	, b.age
from StarsIn as a
	inner join Star as b on a.Star_Name = b.Name
where a.Movie_Title = 'Star Wars'
order by b.Age desc
	   , b.Name;
       
# (f)번
select Studio_Name
    , count(producer_num) as producer_num
from Movie
group by Studio_Name;


# (g)번
select Name
	, Address
	, Phone
    , (select count(*) 
		from Movie 
        where Studio.Name=Movie.Studio_Name) as count_movie
from Studio;


# (h)번
select b.Name
    , sum(a.length) as total_length
from Movie as a
	inner join Producer as b on a.Producer_Num = b.Num
group by b.name
having count(a.title) >= 2;

# (i)번
select c.name
	, c.total_length
from
(
	select b.name
		, sum(a.length) as total_length
		, count(*) as movie_cnt
	from Movie as a
		inner join Producer as b on  a.Producer_Num = b.Num
	group by b.name
) as c
where movie_cnt >=2;


#(j) 번
select Name
	, Gender
	, case when gender = 'M' then '0' ELSE '1' END AS gender_no
from star;


#(k)
select title
	, year
	, DENSE_RANK() OVER (ORDER BY year) AS released_rank
from movie
;




