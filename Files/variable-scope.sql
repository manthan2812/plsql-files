BEGIN <<outer>> 
    DECLARE
        v_outer VARCHAR2(64) := 'Outer Text';
        v_text  VARCHAR2(50) := 'Good Morning';
    BEGIN
        DECLARE
            v_inner VARCHAR2(64) := 'Inner Text';
            v_text  VARCHAR2(30) := 'Good Evening';
        BEGIN
            dbms_output.put_line('Inner Scope: ' || v_outer);
            dbms_output.put_line('Inner Scope: ' || v_inner);
            dbms_output.put_line('Inner Scope: Inner Variable --> ' || v_text);
            dbms_output.put_line('Inner Scope: Outer Variable --> ' || outer.v_text);
        END;

        dbms_output.put_line('Outer Scope: ' || v_outer);
        dbms_output.put_line('Outer Scope: ' || v_text);
    /* NOT IN SCOPE 
        dbms_output.put_line('Outer Scope: ' || v_inner);
    */
    END;
END outer;