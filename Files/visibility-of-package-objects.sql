------VISIBILITY OF VARIABLES IN PACKAGES-----
CREATE OR REPLACE PACKAGE EMP_PKG AS 
  v_salary_increase_rate number := 0.057; 
  cursor cur_emps is select * from employees; 
  procedure increase_salaries;
  function get_avg_sal(p_dept_id int) return number;
END EMP_PKG;
/

create or replace PACKAGE BODY EMP_PKG AS 
  v_sal_inc int := 500;
  v_sal_inc2 int := 500;
  
  procedure print_test is
  begin
    dbms_output.put_line('Test : '|| v_sal_inc);
  end;
  
  procedure increase_salaries AS
  BEGIN
    for r1 in cur_emps loop
      update employees_copy set salary = salary + salary * v_salary_increase_rate
      where employee_id = r1.employee_id;
    end loop;
  END increase_salaries;
  
  function get_avg_sal(p_dept_id int) return number AS
  v_avg_sal number := 0;
  BEGIN
    print_test;
    select avg(salary) into v_avg_sal from employees_copy where
          department_id = p_dept_id;
    RETURN v_avg_sal;
  END get_avg_sal;
  
END EMP_PKG;
/

----------------- 
create or replace PACKAGE BODY EMP_PKG AS  
  v_sal_inc int := 500;
  v_sal_inc2 int := 500;
  
  function get_sal(e_id employees.employee_id%type) return number;

  procedure print_test is
  begin
    dbms_output.put_line('Test : '|| v_sal_inc);
    dbms_output.put_line('Test salary : '|| get_sal(102));
  end;
  
  procedure increase_salaries AS
  BEGIN
    for r1 in cur_emps loop
      update employees_copy set salary = salary + salary * v_salary_increase_rate
      where employee_id = r1.employee_id;
    end loop;
  END increase_salaries;
  
  function get_avg_sal(p_dept_id int) return number AS
  v_avg_sal number := 0;
  BEGIN
    print_test;
    select avg(salary) into v_avg_sal from employees_copy where
          department_id = p_dept_id;
    RETURN v_avg_sal;
  END get_avg_sal;
  
  function get_sal(e_id employees.employee_id%type) return number is
  v_sal number := 0;
  begin
    select salary into v_sal from employees where employee_id = e_id;
    return v_sal;
  end;
  
end;
/

-----------------
begin
    dbms_output.put_line('Trying to access Objects--> ');
    --dbms_output.put_line(EMP_PKG.v_sal_inc);
    dbms_output.put_line(EMP_PKG.v_salary_increase_rate);
    EMP_PKG.increase_salaries;
    --EMP_PKG.print_test;
    dbms_output.put_line(EMP_PKG.get_avg_sal(50));
    --dbms_output.put_line(EMP_PKG.get_sal(102));
end;
/