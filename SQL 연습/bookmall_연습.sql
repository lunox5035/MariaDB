show databases;
show tables;

desc book;

-- 1 서적 테이블
select * from book;

insert into book value (1,'파칭코',14220,1);
insert into book value (2,'IT 5분 잡학사전',14850,3);
insert into book value (3,'최소한의 이웃',14220,2);

-- 2 카테고리 테이블
select * from category;

insert into category value(1, '소설');
insert into category value(2, '수필');
insert into category value(3, '컴퓨터/IT');

-- 3 고객 테이블
select * from member;

insert into member value (1,'여관규','010-9246-7795','bbc02131@naver.com','1qaz2wsx');
insert into member value (2,'홍길동','010-7777-8845','Gil-dong@gmail.com','a1s2d3f4');

-- 4 카트 테이블
select * from cart;

insert into cart value(1, '1',1);
insert into cart value(2, '50',3);

-- 5 주문서적 테이블
select * from order_book;

insert into order_book value(1,1,1);
insert into order_book value(2,3,2);

-- 6 주문 테이블
select * from orders;

insert into orders value(1,1,'세종시 도담동 보람로 96 2005-2202',2,1);
ALTER TABLE orders drop column pay;

