/********************** Creating a Sequence ************************/
CREATE SEQUENCE seq_dep_cpy
START WITH 280
INCREMENT BY 10;
/

/********************** PRIMARY KEY Example ************************/
CREATE OR REPLACE TRIGGER trg_before_insert_dept_cpy
BEFORE INSERT ON departments_copy 
FOR EACH ROW
BEGIN
  --SELECT seq_dep_cpy.nextval INTO :new.department_id FROM dual;
  :new.department_id := seq_dep_cpy.nextval;
END;
/


INSERT INTO departments_copy (department_name,manager_id,location_id)
    VALUES('Security',200,1700);
INSERT INTO departments_copy (department_name,manager_id,location_id)
    VALUES('HR Test',99,5000);
/
select * from departments_copy;
/