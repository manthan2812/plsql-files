DECLARE
  type t_emp IS RECORD (first_name VARCHAR2(50),
                        last_name  employees.last_name%TYPE,
                        salary     employees.salary%TYPE,
                        hire_date  DATE);
  r_emp t_emp;
BEGIN
  SELECT first_name,last_name,salary,hire_date 
  INTO   r_emp 
  FROM   employees WHERE employee_id = '101';
 
--  r_emp.first_name := 'Alex';
--  r_emp.salary     := 2000;
--  r_emp.hire_date  := '01-JAN-20'; 
 
  dbms_output.put_line(r_emp.first_name || ' '                || 
                       r_emp.last_name  || ' earns '          || 
                       r_emp.salary     || ' and hired at : ' || 
                       r_emp.hire_date);
END;