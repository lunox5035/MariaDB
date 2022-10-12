show tables;

select count(*) from departments;

select * from departments;

select distinct(title) from titles;

select from_data from titles limit 0,10;

select	count(*) from employees; 

-- select 연습
select * from departments;

-- alias(as 생략가능)
-- 예제1: employees 테이블에서 직원의 이름, 성별, 입사일을 출력 
select first_name as '성',
	gender as '성별',
	hire_date as '입사일'
    from employees;

-- 예제2 eemployees 테이블에서 직원의 전체이름,  성별, 입사일을 출력(concat 함수 사용)
SELECT concat( first_name, ' ', last_name) AS '이름',
         gender AS '성별', 
         hire_date AS '입사일'
    FROM employees;


-- distinct
-- 예제 titles 테이블에서 모든 직급의 이름 출력
select distinct(title)
	from title;
    
-- where절   #1
-- 예제 : employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
select first_name, gender,hire_date
	from employees
    where hire_date<'1990-01-01';
   
-- where절   #2
-- 예제 : employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 성별, 입사일을 출력
select first_name, gender,hire_date
	from employees
    where hire_date < '1989-01-01'
    and gender = 'f';
    
-- where절 #3: in연산자
-- dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서번호 출력
select emp_no,dept_no
from dept_emp
where dept_no in('d005','d009');

-- where절 #4: like연산자
-- employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력
select first_name, hire_date
from employees
where hire_date like '1989%';

select first_name, hire_date
from employees
where hire_date between '1989-01-01'and'1989-12-31';

-- order by절
-- 예제1: salaries 테이블에서 2001년 월급이 가장 높은순로 사원의 사번, 월급을 출력
 select emp_no,salary,from_date,to_date
 from salaries
 where from_date like '2001%'
 and to_date like '2001%'
 order by salary desc;
 
 -- 예제2: 남자 직원의 이름, 성별, 입사일을 입사일 순(선임순)으로 출력
 select first_name as '이름',
		gender as '성별',
		hire_date as '입사 일'
 from employees
 where gender = 'm'
 order by hire_date desc;
 
 -- 예제3: 직원들의 사번, 월급을 사번, 월급 순으로 출력하세요.
select emp_no as '사번',
		salary as '월급'
	from salaries
    order by  emp_no asc, salary desc;
 

