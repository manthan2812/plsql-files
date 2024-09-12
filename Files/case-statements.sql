set serveroutput on;
DECLARE
    v_designation varchar(10) := 'SE';
    v_salary number := 30000;
    v_role varchar(5) := 'IT';
    v_increment number;
BEGIN
    case
        when v_designation = 'ASE' or v_role = 'BPS' then
            v_increment := 0.2;    
            dbms_output.put_line('Increment for Assistant System Engineer is ' || v_increment);
            dbms_output.put_line('Assistant System Engineer Increased Salary is ' || v_salary * (1 + v_increment));
        when v_designation = 'SE' and v_role = 'IT' then
            v_increment := 0.5;    
            dbms_output.put_line('Increment for System Engineer is ' || v_increment);
            dbms_output.put_line('System Engineer Increased Salary is ' || v_salary * (1 + v_increment));
        when v_designation = 'ITA' then
            v_increment := 1.0;    
            dbms_output.put_line('Increment for IT Analyst is ' || v_increment);
            dbms_output.put_line('IT Analyst Increased Salary is ' || v_salary * (1 + v_increment));
        else
            v_increment := 0;    
            dbms_output.put_line('Increment for This Designation is -> ' || v_increment);
            dbms_output.put_line('This Designation Increased Salary is ' || v_salary * (1 + v_increment));
    end case;
END;