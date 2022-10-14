-- 집계쿼리: select 절의 그룹함수(avg, max, min, count, sum, ...)가 적용된 경우

select avg(salary),sum(salary)
	from salaries;

-- select 절에 그룹함수가 있는 경우, 어떤 컬럼도 올 수 없다.
-- 아무 의미 없다.= 오류이다
select avg(salary), emp_no
	from salaries;

-- query 순서
-- 1. 접근 테이블 확인
-- 2. 조건에 맞는 row를 선택
-- 3. 집계
-- 4.projection
select avg(salary)		
from salaries				
where emp_no='10060';  


-- group by에 참여하는 칼럼은 projection이 가능(=select절에 올 수 있다)
select avg(salary),emp_no		
from salaries
group by emp_no;

-- having
-- 집계결과(결과 임시테이블)에서 row를 선택하는 경우
-- 이미 where 절은 실행되었기 때문에 having 절에 이 조건을 주어야 한다.alter
select emp_no, avg(salary) as avg_salary
from salaries
group by emp_no
having avg_salary > 60000
order by avg_salary desc;  

-- 예제
-- select 태이블에서 사번이 10060인 직원의 직급과 금여 평균과 총합을 출력하세요.

-- 문법적 오류! 의미적 정답(where)
select emp_no, avg(salary),sum(salary)
from salaries
where emp_no='10060';

-- 문법적 올바른 답
select emp_no, avg(salary),sum(salary)
from salaries
group by emp_no
having emp_no='10060';