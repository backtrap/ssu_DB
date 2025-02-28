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

Create trigger tri01 after insert on userss
referencing new row as nrow
referencing old row as orow
for each row
when nrow.gender = 'm' and nrow.jobs = 'student'
begin
  delete from userss
  where ids = nrow.ids;
end;


Create trigger tri02 after insert on userss
referencing new row as nrow
referencing old row as orow
for each row
when nrow.gender = 'f'
begin
  delete from userss
  where ids = nrow.ids;
end;



Create view v04 as
select namess, gender, favorite, jobs
from userss;


Create view v05 as
select enterprises, locations, mains
from company;


// with check option
Create view v08 as
select productName, manufacture
from goods
with check option;


Select productName
from goods
where price = some (
  select price
  from goods
  where series = 'no');


Select productName
from goods
where price = some (
  select max(price)
  from goods
  where stock > 25);


Select ids
from userss
where gender != any (
  select gender
  from userss
  where jobs = 'student');


Select namess
from userss
where jobs = any (
  select jobs
  from userss
  where email is null);


Select cID
from company
where employee >= all (
  select employee
  from company
  where manufacture = 'red');


Select cID
from company
where employee != all (
  select employee
  from company
  where locations = 'seoul');


Select productName, stock
from goods
where manufacture = (
  select manufacture
  from company
  where stock > 10);


Select productName, pID, rank() over (order by price desc) as sRank01
from goods
order by sRank01;


Select cID, rank() over (order by employee) as sRank02
from company
order by sRank02;


Insert into userss values('poke341', 4456, 'keen', 'm', 'computer', 'student', null);


Insert into userss values('mon674', 6842, 'hou', 'f', 'headphone', 'teacher', 'popo12@email.com');



