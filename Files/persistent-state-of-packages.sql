--------- PERSISTENT STATE OF PACKAGES ---------
set serveroutput on;
execute dbms_output.put_line(constants_pkg.v_salary_increase);
grant execute on constants_pkg to manthan;
revoke execute on constants_pkg from manthan;
grant execute on dbms_lock to hr;
----------------- 

create or replace package constants_pkg is
PRAGMA SERIALLY_REUSABLE;
  v_salary_increase constant number:= 0.04;
  cursor cur_emps is select * from employees;
  t_emps_type employees%rowtype;
  v_company_name varchar2(20) := 'ORACLE';
end;
----------------- 

begin
  constants_pkg.v_company_name := 'ACME';
  dbms_output.put_line(constants_pkg.v_company_name);
  dbms_lock.sleep(3); 
end;
/
exec dbms_output.put_line(constants_pkg.v_company_name);
-----------------  

declare
v_emp employees%rowtype;
begin
 open constants_pkg.cur_emps;
 fetch constants_pkg.cur_emps into v_emp;
 dbms_output.put_line(v_emp.first_name);
 close constants_pkg.cur_emps;
end;
/
----------------- 

declare
v_emp employees%rowtype;
begin
 fetch constants_pkg.cur_emps into v_emp;
 dbms_output.put_line(v_emp.first_name);
end;
/