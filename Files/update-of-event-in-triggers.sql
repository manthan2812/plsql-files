------ USING UPDATE OF EVENT IN TRIGGERS ------
alter table employees_copy disable all triggers;
/

create or replace trigger prevent_updates_of_constant_columns
before update of hire_date,salary on employees_copy 
for each row
begin
  raise_application_error(-20005,'You cannot modify the hire_date and salary columns');
end;
/

select * from employees_copy;
update employees_copy set salary = 60000;
update employees_copy set hire_date = SYSDATE;