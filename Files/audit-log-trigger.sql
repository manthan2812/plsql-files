DESC departments_copy;

/******************** Creating The Audit Log Table *****************/
CREATE TABLE log_departments_copy 
        (
         log_user             VARCHAR2(30), 
         log_date             DATE, 
         dml_type             VARCHAR2(10),
         old_department_id    NUMBER(4), 
         new_department_id    NUMBER(4), 
         old_department_name  VARCHAR2(30), 
         new_department_name  VARCHAR2(30),
         old_manager_id       NUMBER(6), 
         new_manager_id       NUMBER(6), 
         old_location_id      NUMBER(4), 
         new_location_id      NUMBER(4)
         );
/

/********************** Audit Log Trigger ************************/
CREATE OR REPLACE TRIGGER trg_department_copy_log
AFTER INSERT OR UPDATE OR DELETE ON departments_copy 
FOR EACH ROW
DECLARE 
    v_dml_type varchar2(10);
BEGIN
  IF inserting THEN
    v_dml_type := 'INSERT';
  ELSIF updating THEN
    v_dml_type := 'UPDATE';
  ELSIF deleting THEN
    v_dml_type := 'DELETE';
  END IF;
  INSERT INTO log_departments_copy 
  VALUES ( user,
           sysdate, 
           v_dml_type, 
           :old.department_id, 
           :new.department_id,
           :old.department_name, 
           :new.department_name, 
           :old.manager_id, 
           :new.manager_id,
           :old.location_id, 
           :new.location_id
          );
    
end;
/


/***** Other SQL Statements Used in This Lecture *****/
INSERT INTO departments_copy (department_name, manager_id,location_id)
     VALUES ('Cyber Security', 100, 1700);
 
SELECT * FROM log_departments_copy;
 
UPDATE departments_copy
SET manager_id = 200
WHERE department_name = 'Cyber Security';
 
DELETE FROM departments_copy
WHERE department_name = 'Cyber Security';

SELECT * FROM departments_copy;
rollback;
commit;
/