select * from employees;

create view EmployeesInfo as
select FIRST_NAME||' '||UPPER(LAST_NAME)||' makes '|| salary as employees_Salary,
       salary*12 as annual_salary from employees;
       -- Steven         KING      makes      24000
select * from EMPLOYEESINFO;

-- How many columns we have in view ?
    -- employees_Salary
    -- annual_salary

-- can we call specific column from view

select Employees_Salary from EMPLOYEESINFO;

drop view EMPLOYEESINFO;