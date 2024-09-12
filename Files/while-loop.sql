set serveroutput on;

DECLARE
    v_counter number := 1;
BEGIN
    WHILE v_counter <= 10 LOOP
        dbms_output.put_line('Counter is : ' || v_counter);
        v_counter := v_counter + 1;
    END LOOP;
END;