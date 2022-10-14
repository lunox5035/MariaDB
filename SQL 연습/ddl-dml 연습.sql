drop table member;

create table member(
no int(11) not null auto_increment,
email varchar(100) not null,
password varchar(64) not null,
name varchar(100) not null,
department varchar(100),
primary key(no)
);

desc member;

alter table member add column juminbunho char(13) not null;

alter table member drop juminbunho;

alter table member add column juminbunho char(13) not null after email;

alter table member change department department varchar(200) not null;

alter table member drop juminbunho;


-- insert 
insert into member 
values values(null, 'kickscar@gmail.com','여관규2', password('1234'), '여관규','개발팀',null)
select* from member;

-- update
update member
set email= 'juminbunho@gmail.com', passwprd=passwprd('4321') where no=2;

-- delete
delete
from member
where no =2;
select*from member;


-- transacion
-- transacion

select @@autocommit;
set autocp




