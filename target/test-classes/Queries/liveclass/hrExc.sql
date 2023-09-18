select * from EMPLOYEES;


--JOin exercise

select FIRST_NAME,LAST_NAME,Department_Name from EMPLOYEES e
inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
order by FIRST_NAME;


select FIRST_NAME||' '||LAST_NAME as FULL_NAME ,Department_Name from EMPLOYEES e
right join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;


--self join

select * from EMPLOYEES;

select Workers.First_Name,Workers.Last_Name,Managers.First_Name,Managers.Last_Name
from EMPLOYEES Workers inner join EMPLOYEES Managers
    on Workers.MANAGER_ID=Managers.EMPLOYEE_ID;

select Workers.First_Name,Workers.Last_Name,Workers.SALARY,Managers.First_Name,Managers.Last_Name,Managers.SALARY
from EMPLOYEES Workers inner join EMPLOYEES Managers
    on Workers.MANAGER_ID=Managers.EMPLOYEE_ID
    where Workers.SALARY > Managers.SALARY;

