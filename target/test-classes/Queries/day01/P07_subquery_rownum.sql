--- SUBQUERY ---

-- give me all information  who is getting max  salary

        -- max salary
        select max(salary) from EMPLOYEES;  --24 K

        -- if we know max salary can we find who is getting
        select *  from EMPLOYEES
        where  salary =24000;   --> it is HARDCODED.

        -- if the Steven King salary changes we cant find person who is getting max salary

        -- SOLUTION --> make it dynamic
        select *  from EMPLOYEES
        where  salary=(select max(salary) from EMPLOYEES);



   -- give me all information  who is getting min salary

        -- min salary
        select min(salary) from EMPLOYEES;  --2100

        -- if we know min  salary can we find who is getting
        select *  from EMPLOYEES
        where  salary =2100; -- it is HARCODED


        -- SOLUTION --> make it dynamic
        select *  from EMPLOYEES
        where  salary=(select min(salary) from EMPLOYEES);

   -- display all information who is getting second highest salary ?

        -- find max salary
        select max(salary) from EMPLOYEES;  --24 K

        -- second highest
        select max(salary) from EMPLOYEES
        where salary < 24000;  ---> 17 K

        -- find second highest dynamicly
        select max(salary) from EMPLOYEES
        where salary < (select max(salary) from EMPLOYEES); --17 K

        -- find me who is getting 2nd highest salary
        select * from EMPLOYEES
        where salary=17000;   --> still hardcoded

        -- make it dynamic
        select * from EMPLOYEES
        where salary=(select max(salary) from EMPLOYEES
                      where salary < (select max(salary) from EMPLOYEES));



-- display all information who is getting more than average ?
     -- find avg salary
        select avg(salary) from employees;

     -- display who is getting over avg
        select  * from EMPLOYEES
        where salary > 6462;

     -- SOLUTION --> make it dynamic
        select  * from EMPLOYEES
        where salary > (select avg(salary) from employees);

-- TASK  --> display all information who is getting second minimum salary ?



--- ROWNUM ---
/*
 it limits rows based on provided number
 */

select * from EMPLOYEES
where rownum<11;


--display all information from employees who is getting first 5 highest salary

-- BAD PRACTICE
-- It is getting data before order them based salary and
-- cut the list from line 6 then it tries to order them between first 5 rows
-- That is why we are getting WRONG LIST
select * from EMPLOYEES
where rownum<6
order by salary desc ;

-- CORRECT ANSWER
select * from (select * from EMPLOYEES order by salary desc )
where rownum<6;


-- display all information who is getting 5th highest salary
    --display all different salaries in desc order
    select  distinct salary  from EMPLOYEES order by salary desc;

    -- display 5th highest salary
        select min(salary) from (select distinct salary  from EMPLOYEES order by salary desc)
        where rownum<6;

    -- who is getting 5th highest salary

        select * from EMPLOYEES
        where salary=13000;      --it is hardcoded

        select * from EMPLOYEES
        where salary = (select min(salary) from (select  distinct salary  from EMPLOYEES order by salary desc)
                        where rownum<6);


-- IQ -->  display all information who is getting 213th highest salary
       --  display all information who is getting 4th highest salary

        select * from EMPLOYEES
        where salary = (select min(salary) from (select  distinct salary  from EMPLOYEES order by salary desc)
                        where rownum<5);

-- HOMEWORK -->  display all information who is getting 3th lowest salary