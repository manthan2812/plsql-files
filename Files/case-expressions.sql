set serveroutput on;

DECLARE
    v_designation varchar(10) := 'SE';
    v_salary number := 25000;
    v_increment number;
BEGIN
    v_increment := case v_designation
                        when 'ASET' then 0.2
                        when 'ASE' then 0.3
                        when 'SE' then 0.4
                        when 'ITA' then 0.5
                        else 0
                   end;
                   
    dbms_output.put_line('Increment -> ' || v_increment);
    dbms_output.put_line('Increased Salary -> ' || (v_salary + v_salary * v_increment));
END;