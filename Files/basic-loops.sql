set serveroutput on;

DECLARE
    v_counter number := 1;
BEGIN
    LOOP
        dbms_output.put_line('Counter is : ' || v_counter);
        v_counter := v_counter + 1;
        IF v_counter = 10 THEN
            dbms_output.put_line('Maximum Counter is : ' || v_counter);
            EXIT;
        END IF;
        
        -- EXIT WHEN v_counter = 10;
    END LOOP;
END;