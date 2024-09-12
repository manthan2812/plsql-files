SET SERVEROUTPUT ON;

DECLARE
BEGIN
dbms_output.put_line('Hello World');
    BEGIN
    dbms_output.put_line('Inside Nested Block');    
    END;
END;