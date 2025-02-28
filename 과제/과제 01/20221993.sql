create table userss (
    ids varchar2(10) not null,
    passwords integer not null,
    namess char(10) not null,
    gender char(1),
    favorite char(10),
    jobs char(10),
    email varchar2(30),
    
    primary key (ids, favorite),
    check (gender in ('M', 'F'))
);

create table goods (
    productName varchar2(20),
    pID varchar2(20),
    manufacture char(10),
    stock integer,
    categorys char(20),
    series char(5),
    price integer not null,
    favorite char(10),

    primary key (pID, favorite, manufacture),
    check (series in ('yes', 'no'))
);

create table company(
    enterprises char(10),
    locations char(10),
    cID varchar2(20),
    mains char(20),
    employee integer,
    manufacture char(10),
    
    primary key (manufacture)
);

insert into userss values('kk1237', 4321, 'jay', 'M', 'favorite', 'student', null);

insert into userss values('4597', 6697, 'jun', 'M', 'smartphone', 'student', null);

insert into userss values('blu332', 6679, 'lee', 'M', 'headphone', null, 'blu332@email.com');

insert into userss values('red78', 4521, 'jiwoo', 'F', 'computer', 'teacher', 'red78@email.com');

insert into userss values('case132', 6587, 'sin', 'F', 'smartphone', 'racer', 'case132@email.com');

insert into goods values('notenote23', 'rr35187', 'red', 37, 'computer', 'yes', 1200000, 'computer');

insert into goods values('pokepoke', 'rr58234', 'red', 26, 'smartphone', 'no', 700000, 'smartphone');

insert into goods values('rain', 'bb56613', 'blue', null, 'computer', 'no', 2400000, 'smartphone');

insert into goods values('grooow', 'gg35652', 'green', null, 'headphone', 'no', 350000, 'headphone');

insert into goods values('sea36', 'bb13546', 'blue', 36, 'headphone', 'yes', 230000, 'computer');

insert into goods values('nooow', 'gg52336', 'green', 23, 'smartphone', 'no', 1200000, 'smartphone');

insert into company values('red', 'seoul', 'ssrr351964', 'computer', 36, 'red');

insert into company values('blue', 'seoul', 'ssbb351522', 'smartphone', 12, 'green');

insert into company values('green', 'busan', 'bbgg336974', 'headphone', 23, 'blue');

insert into company values('black', 'busan', 'bbbb562396', 'chair', 46, 'red');

insert into company values('white', 'jeonju', 'jjww315697', 'bottle', 113, 'green');

alter table userss add constraint const01
    foreign key (favorite) references goods;

alter table goods add constraint const02
    foreign key (manufacture) references company;

create sequence sec06
    start with 0
    increment by 10
    maxvalue 100
    minvalue 0
    nocycle
    nocache;

select sec06.NEXTVAL from dual;

select *
from userss;

select *
from goods;

select *
from company;

select *
from all_constraints;

select *
from userss natural join goods;

select ids, passwords from userss
union
select pid, stock from goods;

select ids, passwords from userss
intersect
select pid, stock from goods;

select *
from userss
where email is null;

select *
from goods
where stock is null;

select *
from userss
order by ids desc;

select *
from userss
order by ids
;
