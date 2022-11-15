create table book (no int,title char(10),status bool,author_no int);
create table author(no int,name char(10));

select *from book;
select *from author;

show tables;
desc book;
desc authorl


-- author insert
insert into author values (null, '원수연;');


-- author select
select *from author;

-- author dlate all;
delete from author;

-- book insert
insert into book values(null,'test','재고있음',3);
-- bool select
select*from book;

-- delete 