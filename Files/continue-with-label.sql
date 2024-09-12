set serveroutput on;

DECLARE
    v_inner NUMBER := 0;
BEGIN
    <<outer_loop>>
    FOR v_outer IN 1..5 LOOP
        dbms_output.put_line('Outer value is : ' || v_outer );
        v_inner := 0;
        <<inner_loop>>
        LOOP
            v_inner := v_inner + 1;
            CONTINUE outer_loop WHEN v_inner > v_outer;
            dbms_output.put_line('--> Inner value is : ' || v_inner );
        END LOOP inner_loop;
    END LOOP outer_loop;
END;