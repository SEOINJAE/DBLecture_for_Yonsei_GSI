create table instructor (
    ID               char(5),
    name          varchar(20) not null,
    dept_name  varchar(20),
    alary            numeric(8,2),
    primary key (ID),
    foreign key (dept_name) references 
                 department (dept_name)
                 on delete cascade
                 on update cascade
                );


create table department (
    dept_name   varchar (20), 
    building        varchar (15), 
    budget          numeric (12,2),
    primary key (dept_name));

drop table department;
drop table instructor;

insert into department values ('biology', 'watson', '90000');
insert into department values ('comp. sci.', 'taylor', '100000');

insert into instructor values ('10101', 'srini', 'comp. sci.', 65000);
insert into instructor values ('45565', 'katz', 'comp. sci.', 75000);

delete from department where dept_name='comp. sci.';

update department set dept_name='CS' where dept_name='Comp. Sci.';

SELECT *
FROM instructor
;

select *
from department
;

