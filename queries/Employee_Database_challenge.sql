-- Deliverable 1 -- stage 1
select em.emp_no, em.first_name, em.last_name, ti.title, ti.from_date, ti.to_date
into retirement_titles
from employees as em
left join titles as ti
on em.emp_no = ti.emp_no
WHERE 
(em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY
em.emp_no;

-- Deliverable 1 -- stage 2
select distinct on (emp_no) first_name, last_name, title
into unique_retirement_titles
from retirement_titles
where to_date = '9999-01-01'
ORDER BY
emp_no ASC, 
to_date DESC;

-- Deliverable 1 -- stage 3
select count(title) as counter, title 
into unique_retirement_titles_count
from unique_retirement_titles 
group by title 
order by counter DESC;

-- Deliverable 2 -- stage 1
select
distinct on (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date,
de.from_date, de.to_date, ti.title
into mentorship_eligibilty
from
employees as em 
left join dept_emp as de on em.emp_no = de.emp_no
left join titles as ti on em.emp_no = ti.emp_no
where
de.to_date = '9999-01-01'
and (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')

--------------
select * from retirement_titles;
select * from unique_retirement_titles;
select * from unique_retirement_titles_count;
select * from mentorship_eligibilty;
