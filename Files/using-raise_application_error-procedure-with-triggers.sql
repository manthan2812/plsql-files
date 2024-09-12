---- USING RAISE_APPLICATION_ERROR PROCEDURE WITH TRIGGERS ----
alter table employees_copy disable all triggers;
/

create or replace trigger before_row_emp_cpy 
before insert or update or delete on employees_copy 
referencing old as O new as N
for each row
begin
  dbms_output.put_line('Before Row Trigger is Fired!.');
  dbms_output.put_line('The Salary of Employee '||:o.employee_id
    ||' -> Before:'|| :o.salary||' After:'||:n.salary);
  if inserting then
    if :n.hire_date > sysdate then
      raise_application_error(-20000,'You cannot enter a future hire..');
    end if;
  elsif deleting then
    raise_application_error(-20001,'You cannot delete from the employees_copy table..');
  elsif updating ('salary') then
    if :n.salary > 50000 then
      raise_application_error(-20002,'A salary cannot be higher than 50000..');
    end if;
  elsif updating then
    dbms_output.put_line('An UPDATE occurred on employees_copy table');
  end if;
end;
/

select * from employees_copy;
update employees_copy set salary = 60000;
update employees_copy set salary = 40000;
delete from employees_copy;
insert into employees_copy select * from employees;
select SYSDATE, SYSDATE + 2 from DUAL;
Insert into employees_copy (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,
COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (99,'Steven','King','SKING','515.123.4567', 
SYSDATE + 2,'AD_PRES',24000,null,null,90);