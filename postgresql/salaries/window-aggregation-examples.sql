-- avg salary by department
SELECT id, name, dept, salary,
avg(salary) OVER (PARTITION BY dept)
FROM salaries;


-- avg salary by city
SELECT id, name, dept, city, salary,
avg(salary) OVER (PARTITION BY city)
FROM salaries;


-- avg salary by department and city
SELECT id, name, dept, city, salary,
avg(salary) OVER (PARTITION BY dept, city)
FROM salaries;


-- get the id, name, department, salary along with the min and max salary of the corresponding department
SELECT id, name, dept, salary,
min(salary) OVER (PARTITION BY dept) AS min_salary_of_dept,
max(salary) OVER (PARTITION BY dept) AS max_salary_of_dept
FROM salaries s; 
