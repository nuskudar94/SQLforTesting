
select * from employees;

-- Display manager name of 'Neena'

-- manager_id for Neena
select MANAGER_ID from employees
where FIRST_NAME='Neena';

-- manager firstname and lastname for Neena
select FIRST_NAME,LAST_NAME from EMPLOYEES
where EMPLOYEE_ID=(select MANAGER_ID from employees
                   where FIRST_NAME='Neena');

-- all employees with firstname,lastname,manager_id
select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID from EMPLOYEES;

-- display all employees and their managers
select WORKERS.FIRST_NAME,WORKERS.LAST_NAME,MANAGERS.FIRST_NAME,MANAGERS.LAST_NAME
from EMPLOYEES WORKERS  inner join EMPLOYEES MANAGERS
    on WORKERS.MANAGER_ID=MANAGERS.EMPLOYEE_ID;

-- Where is STEVEN ?

-- to see Steven
select WORKERS.FIRST_NAME,WORKERS.LAST_NAME,MANAGERS.FIRST_NAME,MANAGERS.LAST_NAME
from EMPLOYEES WORKERS  left join EMPLOYEES MANAGERS
                                   on WORKERS.MANAGER_ID=MANAGERS.EMPLOYEE_ID
order by WORKERS.FIRST_NAME;


-- IQ --> Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
