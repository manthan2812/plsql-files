set serveroutput on;

DECLARE
    v_inner NUMBER := 1;
BEGIN
    <<outer_loop>>
    FOR v_outer IN 1..5 LOOP
        dbms_output.put_line('Outer value is : ' || v_outer );
        v_inner := 1;
        <<inner_loop>>
        LOOP
            dbms_output.put_line('--> Inner value is : ' || v_inner );
            EXIT outer_loop WHEN v_inner * v_outer >= 10;
            EXIT WHEN v_inner * v_outer >= 9;
            v_inner := v_inner + 1;
        END LOOP inner_loop;
    END LOOP outer_loop;
END;