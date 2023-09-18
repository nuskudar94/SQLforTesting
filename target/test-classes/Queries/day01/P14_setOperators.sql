create table Developers(
   Id_Number Integer primary key,
   Names varchar(30),
   Salary Integer
);



create table Testers(
   Id_Number Integer primary key,
   Names varchar(30),
   Salary Integer
);
select * from Testers;

insert into developers values (1, 'Mike', 155000);
insert into developers values (2, 'John', 142000);
insert into developers values (3, 'Steven', 850000);
insert into developers values (4, 'Maria', 120000);
insert into testers values (1, 'Steven', 110000);
insert into testers values(2, 'Adam', 105000);
insert into testers values (3, 'Lex', 100000);

commit work;

select * from testers;
select * from developers;

/*
 UNION

 - to merge more then one table vertically
 - Remove DUPs
 - Make an order as default asc based on ID


 */

select * from developers
union
select * from testers;


select names from developers
union
select names from testers;



/*

 UNION ALL

 - Dont Remove DUPS
 - Dont sort the results
 */

select * from developers
union all
select * from testers;


select names,salary from developers
union all
select names,salary from testers;


/*
MINUS
 It removes same data from first table and gives result from first table

 */


select * from developers
minus
select * from testers;


select names from developers
minus
select names from testers;

select * from employees;
/*
 INTERSECT

 */
select * from developers
intersect
select * from testers;


select names from developers
intersect
select names from testers;