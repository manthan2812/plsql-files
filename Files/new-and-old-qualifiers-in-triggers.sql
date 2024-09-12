----- :NEW & :OLD QUALIFIERS IN TRIGGERS -----
alter table employees_copy disable all triggers;
/

create or replace trigger before_row_emp_cpy 
before insert or update or delete on employees_copy 
referencing old as O new as N
for each row
begin
  dbms_output.put_line('Before Row Trigger is Fired!.');
  dbms_output.put_line('The Salary of Employee ' || :o.employee_id
        || ' -> Before:' || :o.salary || ' After:' || :n.salary);
end;
/


select * from employees_copy;
update employees_copy set salary = salary + 1000 where department_id = 90;
delete from employees_copy;
insert into employees_copy select * from employees;