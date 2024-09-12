set serveroutput on;

DECLARE
    v_searched_number NUMBER  := 31;
    v_is_prime        BOOLEAN := TRUE;
    x                 NUMBER  := 2;
BEGIN
    <<start_point>>
    IF v_searched_number MOD x = 0 THEN
        dbms_output.put_line(v_searched_number|| ' is not a prime number..');
        v_is_prime := FALSE;
        GOTO end_point;
    END IF;
    x := x+1;
  
    IF x = v_searched_number THEN
        GOTO prime_point;
    END IF;
  
    GOTO start_point;
  
    <<prime_point>>
    IF v_is_prime THEN
        dbms_output.put_line(v_searched_number || ' is a prime number..');
    END IF;

    <<end_point>>
    dbms_output.put_line('Check completed..');
END;