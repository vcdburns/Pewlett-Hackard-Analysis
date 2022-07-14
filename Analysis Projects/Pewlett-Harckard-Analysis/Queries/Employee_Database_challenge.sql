-- Deliverable 1

-- Retirement Titles table

SELECT employees.emp_no, employees.first_name, employees.last_name,
	titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees
JOIN titles

ON employees.emp_no = titles.emp_no

WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

-- Unique titles table

SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no;

-- Retiring titles table

SELECT COUNT (unique_titles.title), unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY unique_titles.count DESC;