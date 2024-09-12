------ USING WHEN CLAUSE ON TRIGGERS ------
alter table employees_copy disable all triggers;
/

create or replace trigger prevent_high_salary
before insert or update of salary on employees_copy 
for each row
when (new.salary > 50000)
begin
  raise_application_error(-20006,'A salary cannot be higher than 50000!.');
end;
/

select * from employees_copy;
update employees_copy set salary = 60000;
update employees_copy set salary = 40000;