show tables;

select *
from emaillist;	
insert into emaillist values(null, '안', '대혁', 'kickscar@gmail.com');
insert into emaillist values(null, '둘', '리', 'dooly@gmail.com');
insert into emaillist values(null, '일','하나','k123456@gmail.com');
desc emaillist;

desc gustbook;

insert into gustbook values(null, '둘리', '1234','호이~',now());

select no,name,contents,date_format(reg_date,'%Y/%m/%d %H:%i:%s') as "time"
from gustbook;

delete from gustbook
where password == '1234' and no == 1; 