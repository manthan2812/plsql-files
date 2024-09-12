set serveroutput on;

DECLARE
    v_inner NUMBER := 0;
BEGIN
    FOR v_outer IN 1..6 LOOP
        v_inner := 0;
        WHILE v_inner < v_outer LOOP
            v_inner := v_inner + 1;
            CONTINUE WHEN mod(v_inner, 2) = 0;
            dbms_output.put(v_inner || ' ');
        END LOOP;
        dbms_output.new_line;
    END LOOP; 
END;