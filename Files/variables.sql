SET SERVEROUTPUT ON;

DECLARE
    V_VAR_ONE VARCHAR2(64) NOT NULL DEFAULT 'Hello!! There';
    V_VAR_TWO VARCHAR2(64) NOT NULL := 'Temporary Text';
    V_VAR_THREE VARCHAR2(64);
    
    V_NUM_ONE NUMBER NOT NULL := 25 + 2 * 10;
    V_NUM_TWO NUMBER := 23.65;
    V_NUM_THREE NUMBER(4,2) := 92.31;
    V_NUM_FOUR NUMBER(10,3) := 759.3921;
    
    V_INT_ONE PLS_INTEGER := 10;
    V_INT_TWO BINARY_INTEGER := 20;
    
    V_FLT_ONE BINARY_FLOAT := 583.4026f;
    V_DOUBLE_ONE BINARY_DOUBLE := 583.4026d;
    
    V_DATE_ONE DATE := SYSDATE;
    V_DATE_TWO DATE := '28-DEC-99';
    V_DATE_THREE DATE := '28-DEC-99 18:52:32';
    
    V_TIMESTAMP_ONE TIMESTAMP := SYSTIMESTAMP;
    V_TIMESTAMP_TWO TIMESTAMP(3) := SYSTIMESTAMP;
    V_TIMESTAMP_THREE TIMESTAMP WITH TIME ZONE := SYSTIMESTAMP;
    
    V_INTERVAL_ONE INTERVAL DAY(4) TO SECOND(2) := '24 02:45:51.032';
    V_INTERVAL_TWO INTERVAL YEAR(4) TO MONTH := '683-11';
    
    V_BOOL_ONE BOOLEAN := TRUE;
    V_BOOL_TWO BOOLEAN := FALSE;
BEGIN
    V_VAR_THREE := 'Welcome';
    dbms_output.put_line(V_VAR_ONE);
    dbms_output.put_line(V_VAR_TWO);
    dbms_output.put_line(V_VAR_THREE || ' to the ' || 'world');
    
    dbms_output.put_line(V_NUM_ONE || ' Thank You');
    dbms_output.put_line(V_NUM_TWO);
    dbms_output.put_line(V_NUM_THREE);
    dbms_output.put_line(V_NUM_FOUR);
    
    dbms_output.put_line(V_INT_ONE);
    dbms_output.put_line(V_INT_TWO);
    
    dbms_output.put_line(V_FLT_ONE);
    dbms_output.put_line(V_DOUBLE_ONE);
    
    dbms_output.put_line('SYSDATE --> ' || V_DATE_ONE);
    dbms_output.put_line('DATE --> ' || V_DATE_TWO);
    dbms_output.put_line('DATE --> ' || V_DATE_THREE);
    
    dbms_output.put_line('SYSTIMESTAMP --> ' || V_TIMESTAMP_ONE);
    dbms_output.put_line('SYSTIMESTAMP --> ' || V_TIMESTAMP_TWO);
    dbms_output.put_line('SYSTIMESTAMP WITH TIME ZONE --> ' || V_TIMESTAMP_THREE);
    
    dbms_output.put_line('INTERVAL DAY TO SECOND --> ' || V_INTERVAL_ONE);
    dbms_output.put_line('INTERVAL YEAR TO MONTH --> ' || V_INTERVAL_TWO);
    
    dbms_output.put_line(sys.diutil.bool_to_int(V_BOOL_ONE));
    dbms_output.put_line(sys.diutil.bool_to_int(V_BOOL_TWO));
END;