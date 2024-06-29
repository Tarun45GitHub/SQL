-- q.1 write the sql query to fetch 'FIRST_NAME' from worker table using the alias name as <worker_name>.
select FIRST_NAME as worker_name from worker;
-- q.2 write the sql query to fetch 'FIRST_NAME' from worker table in upper case;
select UPPER(First_NAME) from worker ;
-- q.3 write the sql query to fetch uniuqe values of DEPERTMENT from worker table;
select distinct DEPERTMENT from worker;
select DEPERTMENT from worker GROUP BY DEPERTMENT;
-- q.4 write the sql query to print three first characters of FIRST_NAME from worker table;
select substring(FIRST_NAME,1,3) from worker;
-- q.5 write a sql query to find the position of the alphabet ('b') in the first name column 'Amitabh' 
-- from worker table.
select instr(FIRST_NAME,'b') from worker where FIRST_NAME='Amitabh';
-- q.6 write the sql query to frint FIRST_NAME from worker table after removing white space from right side
select rtrim(FIRST_NAME) from worker;
-- q.7 write the sql query to frint FIRST_NAME from worker table after removing white space from left side.
select ltrim(FIRST_NAME) from worker;
-- q.8 write a sql query to print unique DEPERTMENT from worker table print its length
select length(DEPERTMENT),DEPERTMENT from worker group by DEPERTMENT;
-- q.9 write a sql query to print the FIRST_NMAE from worker table after replacing 'a' with 'A'.alter
select replace(FIRST_NAME,'a','A'),FIRST_NAME from worker;
-- q.10 write a sql query to print FIRST_NAME and LAST_NAME from worker table
-- into a single column COMPLETE_NMAE ,a spsce char should be separate them.
select concat(FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME from worker;
-- q.11 write a sql query to print all worker details from the worker table ordered by first_name accending.
select * from worker ORDER BY FIRST_NAME;
-- q.12  write a sql query to print all worker details from the worker table 
-- ordered by first_name accending and DEPERTMENT descending.
select * from worker ORDER BY FIRST_NAME,DEPERTMENT desc;
-- q.13 write a sql query to print details of workers with the FIRST_NAME 
-- as'vipul' and 'satish' from worker table.
select * from worker where FIRST_NAME IN ('vipul','satish');
-- q.14 write a sql query to print details of workers excluding the FIRST_NAME 
-- as'vipul' and 'satish' from worker table.
select * from worker WHERE FIRST_NAME not in ('vipul','satish');
-- q.15 write a sql query to print details of worker with DEPERTMENT as "Admin*". 
select * from worker where DEPERTMENT LIKE 'Admin%';
-- q.16 write a sql query to print details of worker where FIRST_NMAE contains 'a'.
select * from worker where FIRST_NAME LIKE '%a%';
-- q.17 write a sql query to print details of worker where FIRST_NMAE ends with 'a'.
select * from worker where FIRST_NAME LIKE '%a';
-- q.18 write a sql query to print details of worker where FIRST_NMAE contains'h'and contains six alphabate.
select * from worker where FIRST_NAME LIKE '_____h';
-- q.19 write a sql query to print details of worker whose SALARY lies between 100000 and 500000.
select * from worker where SALARY BETWEEN 100000 AND 500000;
-- q.20 write a sql query to print details of worker who have joind in Feb'2014.
select * from worker where YEAR(JOINING_DATE)=2014 AND MONTH(JOINING_DATE)=02;
-- q.21 write a sql query to fetch count of workers who in the DEPERTMENT 'Admin';
select DEPERTMENT,count(*) from worker where DEPERTMENT ='Admin';
-- q.22 write a sql query to fetch workers full name with salaries>=50000 and <=100000;
select concat(FIRST_NAME,' ',LAST_NAME)as FULL_NAME,SALARY from worker where SALARY between 50000 and 100000;
-- q.23 write a sql query to fetch the no.of workers for each depertment in descending order.
select DEPERTMENT,count(WORKER_ID) from worker GROUP BY DEPERTMENT ORDER BY count(WORKER_ID) desc;
-- q.24 write a sql query to print details of the workers who are also manager.
select w.* from worker as w INNER JOIN title as t on w.WORKER_ID=t.WORKER_REF_ID 
where t.WORKER_TITLE='manager';
-- q.25 write a sql query to fetch number(more than 1) of same titles in the org of differents type.
select WORKER_TITLE,count(*) from title group by WORKER_TITLE having count(*)>1;
-- q.26 write a sql query to show only odd rows from a table;
select * from worker where mod(WORKER_ID,2)!=0;
select * from worker where mod(WORKER_ID,2)<>0;
-- q.27 write a sql query to show only even row from a table;
select * from worker where mod(WORKER_ID,2)=0;
-- q.28 write a sql query to clone a new table from another table;
create table Worker_clone LIKE WORKER;
select * from worker_clone;
insert into worker_clone select * from worker;
-- q.29 write a sql query to fetch interseting records of two table.
select w.* from worker as w INNER JOIN worker_clone as wc using (WORKER_ID);
-- q.30 write a sql query to show records from one table that another table does not have;
-- MINUS
select * from worker as w LEFT JOIN worker_clone using(worker_id) where worker_clone.WORKER_ID is NULL; 
-- q.31 write a sql query to show current date and time.
select now();
-- q.32 write a sql query to show top n(say 5) records of a table order by descending salary.
select * from worker order by SALARY desc limit 5;
-- q.33 write a sql query to determine nth(n=5) highest salary from a table.
select * from worker order by SALARY desc limit 4,1;
-- **q.34 write a sql query to determine nth(n=5) highest salary from a table without using LIMIT keyword.
select * from worker w1 where 4=(
     select count(distinct (w2.SALARY)) from worker w2 where w2.SALARY>=w1.SALARY);
-- **q.35 write a sql query to fetch the list of employees with the same salary. 
select * from worker w1 ,worker w2 where w1.SALARY=w2.SALARY and w1.WORKER_ID!=w2.WORKER_ID;
-- q.36 write a sql query to show the second highest salary from a table using sub-query.
select max(SALARY) from worker where SALARY not in (select max(SALARY) from worker);
-- q.37 write a sql query to show one row twice in result from a table;
select * from worker
union all 
select * from worker order by WORKER_ID;
-- q.38 write a sql query to list worker_id who does not get bonus.
select worker_id from worker where WORKER_ID not in (select worker_ref_id from bonus);
-- q.39 write a query to print first 50% records from a table.
select * from worker where WORKER_ID<=(select count(worker_id)/2 from worker);
-- q.40 write a sql query to fetch the DEPERTMENT that have less than 4 peole in it.
select DEPERTMENT,count(*) from worker group by DEPERTMENT having count(*)<4;
-- q.41 write a sql query to all depertment along with the number of people in there.
select DEPERTMENT,count(*) from worker group by DEPERTMENT;
-- q.42 write a sql query to show the last record from a table.
select * from worker where WORKER_ID=(select max(worker_id) from worker);
-- q.43 write a sql query to fetch first row of a table .
select * from worker where WORKER_ID=(select min(worker_id) from worker);
-- q.44 write a sql query to last five record of a table,
(select * from worker order by WORKER_ID desc limit 5)order by WORKER_ID;
-- q.45 write a sql query to print name of employees having heighest salary in each depertment;
select concat(FIRST_NAME,' ',LAST_NAME),DEPERTMENT,SALARY from worker where SALARY in(
select max(SALARY)from worker group by DEPERTMENT);
-- q.46 write a sql query to fetch 3 max salaries from a table using co-related subquery
select distinct(salary) from worker w1 where 3>=(
select count(distinct SALARY) from worker w2 where w1.SALARY<=w2.SALARY) order by SALARY desc;
-- q.47 write a sql query to fetch 3 min salaries from a table using co-relate sub-query
select distinct (salary) from worker w1 where 3>=(
select count(distinct(SALARY))from worker w2 where w1.SALARY>=w2.SALARY) order by SALARY;
-- q.48 write a sql query to fetch nth max salary in a table;
select distinct(salary) from worker w1 where n>=(
select count(distinct SALARY) from worker w2 where w1.SALARY<=w2.SALARY) order by SALARY desc;
-- q.49 write a sql query to fetch depertment along with there total salaries paid for each of them.
select depertment ,sum(salary)as maxsal from worker group by DEPERTMENT order by maxsal;
-- q.50 write a sql query to fetch the names of workers whoe earn the highest salary .
select concat(FIRST_NAME,' ',LAST_NAME),DEPERTMENT,SALARY from worker where SALARY =(
select max(SALARY)from worker);
