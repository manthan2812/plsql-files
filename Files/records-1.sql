set serveroutput on;
DECLARE
  r_emp employees%rowtype;
BEGIN
  SELECT * INTO r_emp FROM employees WHERE employee_id = '101';
  --r_emp.salary := 2000;
  
  dbms_output.put_line(r_emp.first_name || ' '                ||
                       r_emp.last_name  || ' earns '          ||
                       r_emp.salary     || ' and hired at : ' || 
                       r_emp.hire_date);
END;