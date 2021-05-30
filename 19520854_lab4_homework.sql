-- 1
create or replace procedure section_info (s_id%type, courseno out course.course_no%type, sDesc out  section.description%type, numofstudent)
begin
select count(student_id), s.course_no, s.description into numofstudent, courseno, sDesc
    from enrollment e join section s on e.section_id = s.section_id
    where s.section_id=s_id;
end;

declare 
  courseno course.course_no%type;
  sDesc out  section.description%type
  stuNum number
begin
   find_student(100, courseno, sDesc,stuNum);
end;



-- 2
declare
cursor c_emp IS select * from employee
create or replace procedure inc_all_salary()
as
begin
for c in c_emp 
loop
update employee e
IF(E.TITLE="ANALYST")
set salary=E.salary*10% E.Salary
where e.emp_id = c.emp_id;
ELSIF(E.title="JANITOR")
set salary=E.salary*5% E.Salary
where e.emp_id = c.emp_id;
ELSIF(E.title="MANAGER")
set salary=E.salary*2% E.Salary
where e.emp_id = c.emp_id;
END IF;
end loop;
end;
begin
    inc_salary();
end;

-- 3
declare
cursor c_emp IS select (employee_id, name, salary) from employee
cursor c_emp_change (empId employee.employee_id%type) is select title, salary
begin
    for e in c_emp loop
    dbms_output.put_line('id: ' || e.employee_id || ' name ' || e.name;
        for ec in c_emp_change(e.employee_id)
        loop
                 dbms_output.put_line(chr(9) || 'Salary: ' || ec.salary || ' Title: ' || ec.title);
        end loop;
    end loop;
end;

-- 4
create or replace trigger trg_employee_change
before insert or update on employee_change
for each row
begin
    if(inserting) then
    :new.title:=lower(:new.title);
    elsif(updating) then
    :new.title:=lower(:new.title);
    end if;
end;


insert into EMPLOYEE_CHANGE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (1,'Phuc',1500,'PROGRAMMER');
iInsert into EMPLOYEE_CHANGE (EMPLOYEE_ID,NAME,SALARY,TITLE) values (3,'Pham',6000,'CEO');