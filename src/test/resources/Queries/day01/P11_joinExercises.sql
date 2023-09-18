--1.Display all first_name and  related department_name

    --- Steven    Executive
    --- David        IT
    select * from employees;
    select * from departments;

    select FIRST_NAME, DEPARTMENT_NAME
        from EMPLOYEES E inner join DEPARTMENTS D
            on E.DEPARTMENT_ID = D.DEPARTMENT_ID;


    -- order list based firstname
        select FIRST_NAME, DEPARTMENT_NAME
        from EMPLOYEES E inner join DEPARTMENTS D
                                    on E.DEPARTMENT_ID = D.DEPARTMENT_ID
        order by FIRST_NAME ;

--2.Display all first_name and department_name including the  department without employee
    select * from employees;
    select * from departments;
    -- RIGHT JOIN
    select FIRST_NAME,DEPARTMENT_NAME from employees e right join departments d
        on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

    -- LEFT  JOIN
    select FIRST_NAME,DEPARTMENT_NAME from departments d left join employees e
        on d.DEPARTMENT_ID = e.DEPARTMENT_ID;

    -- how many employee we have for each department name
    select DEPARTMENT_NAME,count(*) from departments d left join employees e
           on d.DEPARTMENT_ID = e.DEPARTMENT_ID
    group by DEPARTMENT_NAME;


--3.Display all first_name and department_name including the  employee without department
select * from employees;
select * from departments;

    -- Matching portion+unique Employee  --> LEFT JOIN
        select FIRST_NAME,DEPARTMENT_NAME from employees e left outer join departments d
            on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

    -- RIGHT JOIN
        select FIRST_NAME,DEPARTMENT_NAME from departments d right join employees e
            on d.DEPARTMENT_ID = e.DEPARTMENT_ID;


--4.Display all first_name and department_name
--including the  department without employee  and  employees  without departments
    select FIRST_NAME,DEPARTMENT_NAME from departments d full join employees e
               on d.DEPARTMENT_ID = e.DEPARTMENT_ID;