set serveroutput on;

BEGIN
    FOR i IN 1..5 LOOP
        dbms_output.put_line('Counter is : ' || i);
    END LOOP;
    dbms_output.put_line('---------------------');
    FOR i IN REVERSE 1..5 LOOP
        dbms_output.put_line('Counter is : ' || i);
    END LOOP;
END;