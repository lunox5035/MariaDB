-- 대소문자 구분 없음
select version(), VERSION(), CURRENT_DATE, Current_datE;
-- 함수 및 수식
select sin(pi()/4), 
(4+1)*5;

select version(); select now();

-- 커맨드라인 에러 캔슬 \c

-- 테이블 삭제
drop table pet;

-- 테이블 만들기

-- DDL
create table pet(
name varchar(20),
owner varchar(20),
specues varchar(20),
gender char(1),
birth date,
death date
);

-- 스키마 확인 
desc pet;

-- 조회
select name, owner, specues, gender, birth, death from pet; -- 오타수정방법 specues
-- 전체 조회 select * from pet; 

-- 데이터 넣기(생성, create)
insert
	into pet
    values (
		'소금이','여관규','cat','m','2015-04-25',null);

-- 데이터 삭제(삭제, Delete)
delete
	from pet
    where name = '소금이';

-- load data local file
load data local infile'c:\\pet.txt' into table pet;


-- update(수정, Update)
update pet 
	set death = null 
    where death='0000-00-00';

-- 조회1 : where

-- 199년 이후에 태여난 아이들은?(출력 : 이름, 종, 생일)

select name, specues, birth
	from pet
    where birth >'1990-12-31';
    
-- Gwen과 함꼐 사는 아이는?
select name,specues, owner
	from pet
    where owner = 'Gwen';

-- null 다루기 1 : 현재 살아있는 아이들은?(이름 생일, 사망일)
select name, birth, death
	from pet
    where death is null;
    
-- null 다루기 2 : 현재 사망한 아이들은?(이름 생일, 사망일)
select name, birth, death
	from pet
    where death is not null;

-- like 검색1(패턴매칭): 이름이 b로 시작하는 아이들은?
select name
	from pet
    where name like 'b%'; -- 뒷 글자 무한
    
-- like 검색2(패턴매칭): 이름이 b로 시작하는 아이들 중 이름이 6글자인 어이는?
select name
	from pet
    where name like 'b_____'; -- 뒷글자 갯수 지정 _ 갯수

-- 정렬(order by)

-- 아이들을 어린 순으로 정렬(이름, 생일)
select name, birth
	from pet
    order by birth desc;
    
-- 아이들을 많은 순으로 정렬(이름, 생일)
select name, birth
	from pet
    order by birth asc;


-- 집계(통계) 함수 count
select count(*) from pet;

-- select co1,co2,co3	from tbl [where()] 	[order by co1]



show tables;


