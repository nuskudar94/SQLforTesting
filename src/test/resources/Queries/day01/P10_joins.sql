select * from employees;

/*

 INNER JOIN

 - it gives only matching portion of tables
 - the order tables does not matter

 */
select * from CUSTOMER;
select * from ADDRESS;


select FIRST_NAME,LAST_NAME,ADDRESS,PHONE
    from ADDRESS inner join CUSTOMER
        on ADDRESS.ADDRESS_ID = CUSTOMER.ADDRESS_ID;

-- Another Q --> What if I want to customer.address_id information too
select FIRST_NAME,LAST_NAME,CUSTOMER.ADDRESS_ID,ADDRESS.ADDRESS_ID,ADDRESS,PHONE
from ADDRESS inner join CUSTOMER
                        on ADDRESS.ADDRESS_ID = CUSTOMER.ADDRESS_ID;


-- Another Q --> Do I need to type table name always
-- ALIASES
    -- Table Aliases
        -- Customer  --> C
        -- Employees --> E
        -- Address   --> A

select FIRST_NAME,LAST_NAME,C.ADDRESS_ID,A.ADDRESS_ID,ADDRESS,PHONE
from ADDRESS A  inner join CUSTOMER C
                        on A.ADDRESS_ID = C.ADDRESS_ID;

/*
 LEFT OUTER JOIN / LEFT JOIN

 -- it will give  matching part + unique for LEFT table
 -- The order of the table is important

 */
select FIRST_NAME,LAST_NAME,ADDRESS,PHONE
    from CUSTOMER C left  join ADDRESS A
        on C.ADDRESS_ID = A.ADDRESS_ID;


select FIRST_NAME,LAST_NAME,ADDRESS,PHONE
from CUSTOMER C left outer join ADDRESS A
                           on C.ADDRESS_ID = A.ADDRESS_ID;


-- Change the order of tables
select FIRST_NAME,LAST_NAME,ADDRESS,PHONE
from ADDRESS A left  join CUSTOMER C
                           on C.ADDRESS_ID = A.ADDRESS_ID;

/*
 RIGHT OUTER JOIN / RIGHT JOIN

 -- it will give  matching part + unique for RIGHT table
 -- The order of is important

 */
select FIRST_NAME,LAST_NAME,ADDRESS,PHONE
    from customer c right outer join address a
    on c.ADDRESS_ID = a.ADDRESS_ID;


select FIRST_NAME,LAST_NAME,ADDRESS,PHONE
from customer c right  join address a
                                 on c.ADDRESS_ID = a.ADDRESS_ID;



/*
 FULL OUTER JOIN

 -- It will all matching + unique for LEFT + unique for  RIGHT
 -- The order of tables does not matter

 */
select FIRST_NAME,LAST_NAME,ADDRESS,PHONE
from address a full join CUSTOMER c
                          on a.ADDRESS_ID = c.ADDRESS_ID;

