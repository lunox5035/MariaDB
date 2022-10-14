-- 함수: 날짜 함수

-- curdate(), current_data
select curdate(),current_date;

-- curtime(), current_time
select curtime(),current_time;


-- now() 쿼리실행 시 vs sysdate() 함수 실행 시간
select now(), sysdate();
select now(),sleep(2),now(),sysdate();

-- date_format()
-- 2022-10-13 10:12:55
select date_format(now(),'%Y년 %m월 %d일 %h:%i:%s');
select date_format(now(),'%d %b \'%y');

-- period_diff(a,b)
-- 포맷팅: YYMM YYYYMM
-- 예) 근무 개월 수
  select first_name,
         period_diff(date_format(curdate(), '%y%m'), date_format(hire_date, '%y%m')) as month
    from employees
order by month desc;


select emp_no,curdate(), hire_date from employees;
select emp_no,
period_diff(date_format(curdate(),'%y%m'),date_format(hire_date,'%y%m')) as "날짜" 
from employees 
order by 날짜 desc;

-- date_add(=adddate),date_Sub(=subdate)

-- 예제) 각사원들의 근속년 수가 5년이 된는 날은 언제인가요?
select first_name,
		hire_date,
		date_add(hire_date, interval 5 year)
        from employees;
        
-- cast
select '12345'+10, cast('12345'as int)+ 10;
select date_format(cast('2022-10-10'as date),'%Y년 %m월 %d일');
select cast(cast(1-2 as unsigned)as int);
select cast(cast(1-2 as unsigned)as integer);
select cast(cast(1-2 as unsigned)as signed);

-- type
-- 문자: varchar(2000), char, text, CLOB(character large object)
-- 정수: signed(unsigned), int(integer), medium int, big int
-- 실수: float, double
-- 시간: date,datetime
-- LOBL: CLOB, BLOB(Binary large object)

