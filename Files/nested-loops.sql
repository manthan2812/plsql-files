set serveroutput on;

DECLARE
    v_inner NUMBER := 1;
BEGIN
    FOR v_outer IN 1..5 LOOP
        v_inner := 1;
        LOOP
            dbms_output.put(v_inner || ' ');
            v_inner := v_inner + 1;
            EXIT WHEN v_inner > v_outer;
        END LOOP;
        dbms_output.new_line;
    END LOOP; 
END;