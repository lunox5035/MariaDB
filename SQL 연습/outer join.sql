-- outer join
desc detp;

insert into detp values(null, '총무');
insert into detp values(null, '개발');
insert into detp values(null, '영업');
insert into detp values(null, '기획');
select * from detp;

desc emp;
insert into emp values(null, '둘리', 1);
insert into emp values(null, '마이콜', 2);
insert into emp values(null, '또치', 3);
insert into emp values(null, '길동', null);
select * from emp;

select a.name as '이름',b.name as '부서'
from emp a join detp b
on a.detp_no=b.no;


-- left join
select a.name as '이름',ifnull(b.name,'없음') as '부서'
from emp a left join detp b on a.detp_no=b.no;

-- right join
select a.name as '이름',b.name,'없음' as '부서'
from emp a right join detp b on a.detp_no=b.no;
