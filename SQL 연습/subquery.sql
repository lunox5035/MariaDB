-- 서브쿼리 : 쿼리 하나더 있음
-- subquery
-- 1) select 절
-- 2) from 절의 서브쿼리: 테이블로 인식
select s.a, s.b, s.c
from (select now() as a, sysdate() as b, 3+1 as C) s;

-- 3) where 절의 서브쿼리 
-- 예제) 현재, Fai Bale이 근무하는 부서의 직원들의 사번, 이름을 출력하세요.
select dept_no
from dept_emp a, employees b
where a.emp_no=b.emp_no
and a.to_date= '9999-01-01'
and concat(first_name,' ',last_name)='fai Bale';

select a.emp_no,b.first_name
from dept_emp a, employees b
where a.emp_no = b.emp_no
and a.to_date='9999-01-01'
and a.dept_no= 'd004';


-- so1)
select a.emp_no,b.first_name
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date='9999-01-01'
   and a.dept_no= (select dept_no
					 from dept_emp a, employees b
					where a.emp_no=b.emp_no
					  and a.to_date= '9999-01-01'
					  and concat(first_name,' ',last_name)='fai Bale');
                      
-- where절 연산
-- 3-1) 단일행 연산자: =, !=, >, <, >=, <=
-- 실습문제 1:   현재, {전체사원의 평균 연봉}보다 적은 급여를 받는 사원의  이름, 급여를 나타내세요.
select avg(salary)
from salaries
where to_date = '9999-01-01';

select a.first_name, b. salary
from employees a, salaries b
where a.emp_no=b.emp_no
and b.to_date = '9999-01-01'
and b.salary < (select avg(salary)
				from salaries
				where to_date = '9999-01-01')
order by b.salary desc;
-- 실습문제 2:   현재, {가장 적은 평균 급여}를 받고 있는 직책과 그 급여를 구하세요   
-- 직책별 평균급여
select b.title,(a.salary)
from salaries a, titles b
where a.emp_no=b.emp_no
and a.to_date= '9999-01-01'
and b.to_date= '9999-01-01'
group by b.title
order by a.salary;

-- 직책별 가장 적은 평균급여 
select min(a.avg(salaries))
from (select b.title,(a.salary)
from salaries a, titles b
where a.emp_no=b.emp_no
and a.to_date= '9999-01-01'
and b.to_date= '9999-01-01'
group by b.title) a;

select a.title, avg(b.salary) as avg_salary
from titles a, salaries b
where min(avg(salary))=
and b.to_date = '9999-01-01'
and a.to_date = '9999-01-01'
group by a.title
having ;

-- tpo-k
select a.title, avg(b.salary) as avg_salary
from titles a, salaries b
where a.emp_no=b.emp_no
and a.to_date='9999-01-01'
and b.to_date='9999-01-01'
group by a.title
order by avg_salary asc
limit 0,1;


-- 3-2) 단일행 연산자: in, not in, any, all
-- 실습문제 3) 현재급여가 50000인 직원의 이름과 급여를 출력하세요
-- any 사용법: 연산자 필요 	1. =any == in
-- 						2. >any, >=any: 최솟값
-- 						3. <any, <=any: 최댓값
-- 						4. <>any: not in과 동일

-- all 사용법	1:=all: x
-- 			2.>all, >=all: 최솟값
-- 			2.<all, <=all: 최댓값
-- 			3.<>all

select a.first_name, b.salary
from salaries b, employees a
where a.emp_no=b.emp_no
and b.to_date='9999-01-01'
and b.salary>50000
order by b.salary;

-- 현재급여가 50000인 직원의 이름과 급여를 출력하세요
select a.first_name, b.salary
  from salaries b, employees a
 where a.emp_no=b.emp_no
   and b.to_date='9999-01-01'
   and (a.emp_no,b.salary) 
	in (select emp_no,salary
		  from salaries
		 where to_date='9999-01-01'
		   and salary>50000);

-- 실습문제4: 현제, 각 부서별로 최고월급을 받고 있는 직원의 이름, 부서명, 월급을 출력하세요
select c.dept_name, a.first_name, b.salary
from employees a, salaries b, departments c, dept_emp d
where a.emp_no=b.emp_no
and a.emp_no=d.emp_no
and c.dept_no=d.dept_no
and b.to_date='9999-01-01'
and d.to_date='9999-01-01'
and b.salary = (select salary
				from salaries
				where max(salary))
group by c.dept_name;

select b.dept_no,max(a.salary) as 'max_salary'
from salaries a, dept_emp b
where a.emp_no = b.emp_no
and a.to_date='9999-01-01'
and d.to_date='9999-01-01'
group by b.dept_no;

select a.dept_name, c.first_name, d.salary
from departments a, 
	 dept_emp b, 
	 employees c, 
	 salaries d
where a.dept_no= b.dept_no
and b.emp_no=c.emp_no
and c.emp=d.emp_no
and b.to_date='9999-01-01'
and d.to_date='9999-01-01'
and (a.dept_no,b.dept_no) 
 in ( select b.dept_no, max(a.salary) as 'max_salary'
		from salaries a, dept_emp b
	   where a.emp_no = b.emp_no
		 and a.to_date='9999-01-01'
		 and b.to_date='9999-01-01'
	group by b.dept_no);


