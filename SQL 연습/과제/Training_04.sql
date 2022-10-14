-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?

-- 평균연봉
select avg(salary)
from salaries
where to_date='9999-01-01';

-- 정답 Done
select count(*)
  from employees a, salaries b
 where a.emp_no=b.emp_no
   and b.to_date='9999-01-01'
   and b.salary>(select avg(salary)
  from salaries
 where to_date='9999-01-01');
    
-- 문제2.
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 
-- 단, 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다.

-- 각 부서별 최고의 급여를 받는 사원
  select b.dept_no, max(a.salary) as 'max_salary'
	from salaries a, dept_emp b
   where a.emp_no=b.emp_no
	 and a.to_date='9999-01-01'
	 and b.to_date='9999-01-01'
group by b.dept_no;

-- 정답 Done
select a.emp_no, a.first_name ,b.salary
from employees a, salaries b, dept_emp c 
where a.emp_no = b.emp_no
and b.emp_no= c.emp_no
and b.to_date='9999-01-01'
and c.to_date='9999-01-01'
and (c.dept_no,b.salary)in(select b.dept_no, max(a.salary) as 'max_salary'
	   from salaries a, dept_emp b
	  where a.emp_no=b.emp_no
	    and a.to_date='9999-01-01'
	    and b.to_date='9999-01-01'
   group by b.dept_no)
order by b.salary desc;



-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요

-- 자신의 부서 평균 급여
select b.dept_no,avg(a.salary)
from salaries a, dept_emp b
where a.emp_no=b.emp_no
and a.to_date='9999-01-01'
and b.to_date='9999-01-01'
group by b.dept_no;

-- 정답
select a.first_name, b.salary
  from employees a, salaries b, dept_emp c
 where a.emp_no=b.emp_no
   and b.emp_no=c.emp_no
   and b.to_date='9999-01-01'
   and c.to_date='9999-01-01'
group by c.dept_no
  having  b.salary>(select avg(a.salary)
					  from salaries a, dept_emp b
					 where a.emp_no = b.emp_no
					   and a.to_date='9999-01-01'
					   and b.to_date='9999-01-01'
			      group by b.dept_no);

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

-- 메니저 테이블
select a.dept_no as Dept_Name, b.first_name as Manager_Name
from dept_manager a, employees b
where a.emp_no=b.emp_no
and a.to_date='9999-01-01';

-- 정답 Done
select  b.emp_no, b.first_name, m.Manager_Name,a.dept_name
from (select a.dept_no as Dept_Name,
			 b.first_name as Manager_Name
		from dept_manager a, employees b
	   where a.emp_no=b.emp_no
         and a.to_date='9999-01-01') m, 
						 departments a, 
						   employees b, 
							dept_emp c
where a.dept_no = c.dept_no
  and b.emp_no = c.emp_no
  and m.Dept_Name=a.dept_no
  and c.to_date='9999-01-01';

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.

-- 평균연봉
select b.dept_no as dept_name, avg(a.salary) as avg_salary
from salaries a, dept_emp b
where a.emp_no= b.emp_no
and a.to_date='9999-01-01'
and b.to_date='9999-01-01'
group by b.dept_no;

-- 정답 xx
select a.emp_no,a.first_name,d.title ,c.salary
from employees a, dept_emp b, salaries c,titles d,
	 (select b.dept_no as dept_name, avg(a.salary) as avg_salary
	  from salaries a, dept_emp b
	  where a.emp_no= b.emp_no
	  and a.to_date='9999-01-01'
	  and b.to_date='9999-01-01'
	  group by b.dept_no) av
where a.emp_no=b.emp_no
and a.emp_no=c.emp_no
and b.to_date='9999-01-01'
and c.to_date='9999-01-01'
and d.to_date='9999-01-01'
group by c.salary
having max(avg_salary);

-- 문제6.
-- 평균 연봉이 가장 높은 부서는?

select b.dept_no as d_no,avg(a.salary)as avg_salary
	  from salaries a, dept_emp b
	 where a.emp_no = b.emp_no
  group by dept_no;

-- 정답 Done
select b.dept_name, max(a.avg_salary)
from (select b.dept_no as d_no,avg(a.salary)as avg_salary
			from salaries a, dept_emp b
		   where a.emp_no = b.emp_no
		group by dept_no) a,
			  departments b
where a.d_no=b.dept_no;


-- 문제7.
-- 평균 연봉이 가장 높은 직책?
select b.title as t_name, avg(a.salary) as avg_salary
from salaries a, titles b
where a.emp_no=b.emp_no
group by b.title
order by avg_salary desc;

-- 정답 Done
select a.t_name,max(a.avg_salary)
from (select b.title as t_name, avg(a.salary) as avg_salary
		from salaries a, titles b
	   where a.emp_no=b.emp_no
	   group by b.title) a;

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

-- 부서별 메니저들의 연봉
select b.dept_no as d_no, a.first_name as manager_name, c.salary as manager_salary
from employees a, dept_manager b, salaries c
where a.emp_no=b.emp_no
and a.emp_no=c.emp_no
and b.to_date='9999-01-01'
and c.to_date='9999-01-01';

-- 사원 연봉
select b.dept_no as edo_no, a.first_name as emp_name, c.salary as emp_salary
from employees a, dept_emp b,  salaries c
where a.emp_no=b.emp_no
and a.emp_no=c.emp_no
and b.to_date='9999-01-01'
and c.to_date='9999-01-01'
order by edo_no;



-- 정답 Done
select c.dept_name,a.emp_name,a.emp_salary,b.manager_name,b.manager_salary
from 
(select b.dept_no as edo_no, a.first_name as emp_name, c.salary as emp_salary
from employees a, dept_emp b,  salaries c
where a.emp_no=b.emp_no
and a.emp_no=c.emp_no
and b.to_date='9999-01-01'
and c.to_date='9999-01-01'
order by edo_no) a,
(select b.dept_no as d_no, a.first_name as manager_name, c.salary as manager_salary
from employees a, dept_manager b, salaries c
where a.emp_no=b.emp_no
and a.emp_no=c.emp_no
and b.to_date='9999-01-01'
and c.to_date='9999-01-01') b,
	departments c
where a.edo_no=b.d_no
and b.d_no=c.dept_no	
and a.emp_salary>b.manager_salary;