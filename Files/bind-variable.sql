SET SERVEROUTPUT ON;
-- SET AUTOPRINT ON;

variable var_text VARCHAR2(64);
variable var_num NUMBER;
/
DECLARE
    v_one VARCHAR2(64);
BEGIN
    :var_text := 'Hello World! How are you?';
    v_one := :var_text;
    :var_num := 101;
    
    dbms_output.put_line(:var_text);
    dbms_output.put_line(v_one);
    dbms_output.put_line(:var_num);
END;
/
print var_text;
print var_num;
/
variable v_sql NUMBER;
BEGIN
    :v_sql := 100;
END;
/
SELECT * FROM EMPLOYEES where EMPLOYEE_ID = :v_sql;