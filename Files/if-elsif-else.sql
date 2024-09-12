set serveroutput on;

DECLARE
    v_number number := 5;
    v_name varchar2(20) := 'Adam';
BEGIN
    if v_number < 10 and v_name = 'Jack' then
        dbms_output.put_line('My Name is Jack');
        dbms_output.put_line('I am Smaller then 10');
    elsif v_number < 20 and v_name = 'Adam' then
        dbms_output.put_line('My Name is Adam');
        dbms_output.put_line('I am Smaller then 20');
    elsif v_number < 30 then
        dbms_output.put_line('I am Smaller then 30');
    else
        if v_number is null then
            dbms_output.put_line('I am null...');
        else
            dbms_output.put_line('I am Equal or Greater then 30');
        end if;
    end if;
END;