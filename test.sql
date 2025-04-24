--select ENAME, round(sal/30) as dnowka from emp;
--select ename || ' zarabia ' || sal || ' dolarow tygodniowo.' from emp;
--select LENGTH(ENAME) as dlugosc, ENAME from emp;
--select unique to_char(sysdate, 'DDD') from emp;
--select unique to_char(sysdate, 'HH24:MI') from emp;
--select unique to_char(sysdate, 'DAY') from emp;
--select unique to_char(sysdate + 4, 'day') from emp;
--select ENAME Pracownik, to_char(HIREDATE, 'DD Month YYYY') Zatrudniony from emp;
--select unique to_char(to_date('25.12.2021', 'DD.MM.YYYY') + 100, 'day') from EMP;
--select ENAME, HIREDATE from EMP where to_char(HIREDATE, 'DD') = '01';
--select ENAME, HIREDATE from EMP where to_char(HIREDATE, 'YY') = to_char(sysdate,'YY') and to_char(HIREDATE, 'MM') > 6;
--select ename, decode(deptno, 10, 'Smerf', 20, 'Muminek'), deptno from emp;
--SELECT ename, DECODE(sal, 3000, 'Bogacz', 800, 'Biedak','Kaloryfer') FROM emp;
--select ename from emp order by ename;
--select ename,sal,deptno from emp order by deptno DESC, sal ASC;
--select ename from emp order by length(ename), ename desc;
--select job, COUNT(empno) from emp GROUP BY job;
--SELECT deptno, COUNT(ename) FROM emp GROUP BY deptno;
--SELECT COUNT(job) FROM emp;
--SELECT COUNT(unique job) FROM emp;
--select MIN(sal) from emp;
--
--update emp set comm=null where comm is null;
--select job, max(sal) from emp group by job;
--select ename, sal*12+coalesce(comm,0)*12 as "roczne zarobki+premia" from emp;
--select deptno,count(*) from emp where deptno>20 group by deptno having count(deptno)>4;
--select empno, count(*) from emp group by empno;
--select case when count(unique empno)=count(empno) then 'numery pracownikow sa unikalne' else 'numery pracownikow nie sa unikalne' end as sprawdzenie from emp;
--select * from emp;
--select job,max(sal) from emp where sal<=1300 group by job;
--select job, deptno,count(job) from emp group by deptno,job order by deptno;
--select job, round(avg(sal),2) from emp group by job having  round(avg(sal),2)>=3000;
--select  to_char(hiredate, 'YY') from emp;
--select count(*) "zatrudnieni" , to_char(hiredate,'YYYY') "rok" from emp group by to_char(hiredate,'YYYY') having count(*)>=10;
--select unique deptno from emp where coalesce(comm,0)!=0 group by deptno having count(deptno)>2;
--select deptno, to_char(hiredate,'YYYY') rok, count(*) zatrudnieni from emp group by deptno, to_char(hiredate,'YYYY') order by deptno;
--select empno from emp where job='MANAGER';
--select deptno, round(avg(sal),2) "SREDNIA PLACA" from emp group by deptno having avg(sal)>1000 order by deptno;
--select job, round(avg(sal),2) from emp group by job having sal>1000 order by sal;

select ename, loc from emp natural join dept;
select ename, sal, loc, deptno from emp natural join dept where sal<1500 order by deptno desc;
select max(sal) from emp inner join dept on emp.deptno=dept.deptno where initcap(loc)='Dallas' and initcap(job)='Salesman';

select e1.ename as pracownik, e2.ename as szef from emp e1 left join emp e2 on e1.mgr = e2.empno;
select e1.ename as pracownik, to_char(e1.hiredate, 'DD.MM.YYYY'), e2.ename as szef, to_char(e2.hiredate, 'DD.MM.YYYY') from emp e1 left join emp e2 on e1.mgr = e2.empno where e1.hiredate < e2.hiredate;

select dname, max(sal) from emp right join dept on emp.deptno=dept.deptno group by dname;

select dname, count(empno) from emp right join dept on emp.deptno=dept.deptno group by dname;

select ename, empno,sal from emp where sal=(select max(sal) from emp);

select max(sal), deptno from emp group by deptno having avg(sal)>(select min(sal) from emp where deptno=20);

select ename, sal from emp where sal in (select min(sal) from emp group by deptno);

select empno, ename, sal from emp e1 where sal<(select avg(sal) from emp e2 group by deptno having e1.deptno=e2.deptno);
--lub
select empno, ename, sal from emp e1 where sal < (select avg(sal) from emp e2 where e1.deptno = e2.deptno group by deptno);

select ename, sal from emp e1 where sal = (select min(sal) from emp e2 where e1.deptno = e2.deptno group by deptno);

select ename, sal from emp where (sal, deptno) in (select min(sal), deptno from emp group by deptno);

select ename, sal from emp where sal>(select min(sal) from emp where deptno=10);
 
select ename, sal from emp where sal > ANY(select distinct sal from emp where deptno = 10);

select ename, sal from emp where sal in (select avg(sal) from emp group by deptno);

select empno, sal, deptno, (select round(avg(sal), 2) from emp e2 where e1.deptno = e2.deptno group by deptno) as srednia from emp e1;

select ename, sal from emp where sal in (select min(sal) from emp group by deptno);

--L2
select ename from emp where deptno=10;
select ename,job from emp where sal>1000 and sal<3000;
select * from emp where job='MANAGER' order by sal desc;
select * from emp where ename like 'A%' or ename like 'B%' or ename like 'C%';
select unique mgr from emp where mgr is not null;
select mgr, sum(sal) from emp where mgr is not null group by mgr;
select sum(sal) "Szalone lata 80" from emp where to_char(hiredate, 'YY')=80;
select deptno, decode(deptno,10,'Bid Gosh',20,'Wodge',30,'Cat of Wits',40,'Pose Nun') lokalizacje from emp;
select job, round(avg(sal),2) from emp where sal>1000 group by job order by job;
select ename Nadaktywni, sal from emp where comm is not null order by sal;

select ename, loc from emp natural join dept;
select ename, sal, loc, deptno from emp natural join dept where sal<1500 order by deptno desc;
select dname, min(sal) from emp natural right join dept group by dname;
select dname, count(empno) from emp natural right join dept group by dname;
select ename, sal from emp where sal in (select min(sal) from emp group by deptno);


--L3
--wypisz wszystkie nazwy tabel
select table_name from user_tables;

select * from jobs where min_salary<10000;

select first_name, hire_date from employees where to_char(hire_date, 'YYYY') between 2000 and 2005;

select * from employees where hire_date>= to_date('02.02.2000','DD.MM.YYYY');

select last_name, round(salary,-3), salary from employees;

select * from employees where to_char(hire_date, 'MM')=05;

select nvl(substr(job_title, 0, instr(job_title,' ')), job_title) from jobs;

select last_name, coalesce(commission_pct,0) from employees;

select unique round(sysdate - to_date('01.01.2011','DD.MM.YY')) from employees;

select to_char(hire_date,'MM'), count(employee_id) from employees where to_char(hire_date,'YY')=97 group by to_char(hire_date,'MM') order by to_char(hire_date,'MM');

select department_id from employees having count(commission_pct)>=5 group by department_id;

select department_id from employees group by department_id having count(manager_id)>=5;

select  department_name, count(employee_id) from employees e left join departments d on e.department_id=d.department_id group by department_name;

select job_title, employee_id, end_date - start_date from jobs j left join job_history jh on j.job_id=jh.job_id where department_id=50;

select department_name, coalesce(first_name,'brak szefa') from employees e right join departments d on d.manager_id=e.employee_id;

--select country_name, city, department_name 

select country_name, city, department_name from departments d inner join locations l on d.location_id = l.location_id inner join countries c on l.country_id = c.country_id;

select department_name, first_name, city from departments d join employees e on e.employee_id=d.manager_id join locations l on l.location_id=d.location_id;

create table STUDENCI
(id_stud number(10) constraint pk_idstud primary key, 
imie varchar2(20),
nazwisko varchar2(20),
plec char(1) check(plec in ('K','M')), 
stypendium number(5));

drop table STUDENCI;

create table przedmioty (id_przed number (10) primary key not null, nazwa varchar(50), pkt number(1), semestr number(7));

create table n_przedmiotow 
(id_stud number(10),
id_przed number(10),
constraint fk_studenci foreign key(id_stud) references studenci(id_stud),
constraint fk_przedmioty foreign key(id_przed) references przedmioty(id_przed),
constraint pk_n_przedmiotów primary key(id_stud, id_przed));

create table pracownicy
(nr_prac number(10) constraint pk_nrprac primary key, 
imie varchar2(20),
nazwisko varchar2(20),
pensja number(6),
stanowisko varchar(20) check(stanowisko in ('dydaktyk','badacz-dydaktyk')));

create table zajecia_prac(
nr_prac number(10),
id_przed number(10), 
rok date,
constraint fk1_przedmioty foreign key(id_przed) references przedmioty(id_przed),
constraint fk_nrprac foreign key(nr_prac) references pracownicy(nr_prac),
constraint pk_zajeciaprac primary key (nr_prac,id_przed));

insert into pracownicy values(1000, 'Jan', 'Kowalski', 10000, 'dydaktyk');
insert into pracownicy values(888, 'Jan', 'Nowak', 4500, 'dydaktyk');
insert into pracownicy values(999, 'Adam', 'Kolarz', 5000, 'badacz-dydaktyk');
insert into studenci values(1234, 'Adam', 'Dab','M', 0);
insert into studenci values(1235, 'John', 'None','M', 0);
insert into studenci values(1236, 'Eva', 'Wall','K', 1000);
insert into studenci values(1237, 'Karen', 'Clone','K', 0);
insert into studenci values(1238, 'Mr', 'White','M', 20000);