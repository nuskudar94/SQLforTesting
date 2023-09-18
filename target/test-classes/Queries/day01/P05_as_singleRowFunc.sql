--- AS ---
/*

 1.Column aliases --> it is temporary name to show in display


 2.Table aliases ---> before JOINS


 NOTE --> We are just displaying and nothing will change in DB

 */

select FIRST_NAME from EMPLOYEES;

-- It makes column name UPPERCASE to show in display.We CANT give any space too
select FIRST_NAME as given_name from EMPLOYEES;

-- it will show column as it is.Also we can give space too
select FIRST_NAME as "given name" from EMPLOYEES;

-- display annual salary for all employees as annual_salary
select FIRST_NAME, SALARY*12  from EMPLOYEES;

select FIRST_NAME, SALARY*12 as annual_salary from EMPLOYEES;

/*

 STRING FUNCTIONS

    -- CONCAT

    -- Java--> + --->     firstname+" "+lastname  --> Steven King
    -- SQL --> || -->     firstname||' '||lastname --> Steven King


 */

-- Display all employees firstname and lastnames as full name
-- first_name -->  Steven
-- last_name  -->  King
-- full_name  -->  Steven King

select FIRST_NAME||' '||LAST_NAME as full_name from EMPLOYEES;

-- Display email information as full_email with using @gmail.com domain
-- CONCAT (value1 ,value2)
select concat(EMAIL,'@gmail.com') as full_email from EMPLOYEES;

select concat('Cydeo ',concat(EMAIL,'@gmail.com')) as full_email from EMPLOYEES;

--UPPER (varchar)
select UPPER(EMAIL||'@gmail.com') as full_email from EMPLOYEES;
-- Steven KING
select FIRST_NAME||' '|| UPPER(LAST_NAME) as full_name from EMPLOYEES;

--LOWER (varchar)
select LOWER(EMAIL||'@gmail.com') as full_email from EMPLOYEES;

--INITCAP(varchar)
-- It makes first letter uppercase
select email from EMPLOYEES;
select initcap(email) from EMPLOYEES;


-- LENGTH(varchar)
select email,length(email||'@gmail.com') as email_length   from EMPLOYEES
order by email_length desc;


-- SUBSTR(columnName,beginningIndex,numberOfChar)
/*

    - if beginning index 0 , it is treated as 1
    - if the beginning index negative , it will start from backward
    - if we dont specify number of char it will work till the end


 */
    --display initial from firstname and lastname -->      S.K. ---  N.K.
        select * from EMPLOYEES;

        select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1)||'.' as initials from employees;
        --                    S         .              K            .
        select substr(FIRST_NAME,1,1)||'.'||substr(LAST_NAME,1,1)||'.' as initials from employees;
        --                    S         .              K            .
				-- STEVEN --> VE
				-- NEENA  --> EN
        select FIRST_NAME,substr(FIRST_NAME,-3,2) from EMPLOYEES;

				-- STEVEN --> VEN
				-- NEENA  --> ENA
        select FIRST_NAME,substr(FIRST_NAME,-3) from EMPLOYEES;

-- IQ -->
/*
    Write a query to print first_name and salary for all employees in the Employee table who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/