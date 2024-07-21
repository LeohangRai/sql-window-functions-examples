-- get the id, name, salary along with the salary of the preceding row ordered by id
SELECT id, name, salary,
lag(salary) OVER (ORDER BY id ASC) AS prev_salary
FROM salaries s ;


-- get the id, name, salary along with the salary of the next row ordered by id
SELECT id, name, salary,
lead(salary) OVER(ORDER BY id ASC) AS next_salary
FROM salaries s ;


-- the lag() and lead() functions take an optional parameter 'offset' which is '1' by default
SELECT id, name, salary,
lag(salary, 2) OVER(ORDER BY id ASC) AS prev_prev_salary
FROM salaries s;

SELECT id, name, salary,
lead(salary, 2) OVER(ORDER BY id ASC) AS next_next_salary
FROM salaries s;


-- the lag() and lead() functions take another optional parameter to specify the 'default value' (this is very useful for NULL coalescing)
SELECT id, name, salary,
lag(salary, 1, 0) OVER (ORDER BY id ASC) AS prev_salary
FROM salaries s ;


-- get the percentage difference between the salary of the preceding row and current row
WITH salaries_temp AS (
  SELECT id, name, salary,
  lag(salary) OVER (ORDER BY id ASC) prev_salary
  FROM salaries s 
)
SELECT *,
((st.prev_salary - st.salary)/st.prev_salary) * 100 AS change_percent
FROM 
salaries_temp st;