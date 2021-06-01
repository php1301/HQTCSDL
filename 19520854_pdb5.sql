--1. Write a procedure to calculate factorial of a number
--and return the value to parameter of procedure:
--- Factorial (in val, out result)
--- Factorial (inout val)
set serveroutput on;
create or replace procedure factorial (val in INT, result OUT number)
as
kq number :=1 ;
begin
    for i in 1..val loop
        kq:=kq*i;
    end loop;
    result :=kq;
end;
declare 
ketqua number;
begin
    factorial(5, ketqua);
    dbms_output.put_line(ketqua);
end;
-- B
create or replace procedure bFactorial(val in out number)
as
kq number :=1;
begin
    for i in 1..val loop
        kq:=kq*i;
    end loop;
    val:=kq;
end;
declare 
vnum number := 7;
begin
    bFactorial(vnum);
    dbms_output.put_line(vnum);
end;
--2. Write a procedure to find name, address of a student
--and output these values to the parameters of the
--procedure. Write a pl/sql block to call this
--procedure with parameter is 114 and print out these
--values on the screen.
create or replace procedure find_student (stuid student.student_id%type, stuname out varchar2, stuAddress out student.street_address%type)
as
begin
    select first_name || last_name, street_address into stuname, stuAddress
    from student
    where student_id = stuid;
end;

declare 
  stuname varchar2(50);
    stuadd student.street_address%type;
begin
   find_student(114, stuname, stuadd);
    DBMS_OUTPUT.PUT_LINE('NAME: ' || stuname || ' ADDRESS' || stuadd);
end;
--3. Write a procedure to print out name, address of a
--student and how many courses this student is
--enrolled. Use procedure above (question 2) to get
--information about name and address of this student.
--Write a pl/sql block to call this procedure with
--parameter is 106.
create or replace procedure print_student_course(id student.student_id%type)
as
    stuname varchar2(50);
    stuadd student.street_address%type;
    stucourse int;
begin
    find_student(id, stuname, stuadd);
    DBMS_OUTPUT.PUT_LINE('NAME: ' || stuname || ' ADDRESS' || stuadd);
    select count(course_no) into stucourse
    from enrollment e join section s on e.section_id = s.section_id
    where student_id=id;
    dbms_output.put_line('SO course da dang ky: ' || stucourse);
end;

begin
print_student_course(106);
end;
--4. Write a procedure to update salary of an employee.
--The procedure have 3 parameter: emp_id, amount
--(default value is 100), extra (default value is 50).
--Write a PL/SQL block to call this procedure to
--increase salary of employee id =2.
--Write a PL/SQL block to call this procedure to
--increase salary of employee id =3, amount is 250.
create or replace procedure inc_salary(emp_id employee.employee_id%type, amount number default 100, extra number default 50)
as
begin
update employee
set salary=salary+amount+extra
where employee_id=emp_id;
end;
begin
    inc_salary(3, 250);
end;

--5. Write a pl/sql block to prints out instructor_id,
--salutation, first_name, last_name of all the
--instructors. (using cursor)
begin
FOR ins in (SELECT instructor_id, salutation, first_name, last_name from instructor)
loop
    dbms_output.put_line('ID: ' || ins.instructor_id || 'saluation: ' || ins.salutation || ' first name' || ins.first_name || ' last name' || ins.last_name);
end loop;
end;
-- explicit
declare 
cursor c_instructor IS SELECT instructor_id, salutation, first_name, last_name from instructor;
begin
    for ins in c_instructor
    loop
    dbms_output.put_line('ID: ' || ins.instructor_id || 'saluation: ' || ins.salutation || ' first name' || ins.first_name || ' last name' || ins.last_name);
    end loop;
end;
--6. Write a procedure to display all the information of
--the employees whose salary is greater than the value
--provided by the user.
--Write a pl/sql block to call this procedure with
--parameter is 900.
create or replace procedure display_emp(val number)
as
begin
    for emp in (select * from employee where salary > val)
    loop
        DBMS_OUTPUT.PUT_LINE('ID: ' ||  emp.employee_id || ' name: ' || emp.name ||  ' salary: '  || emp.salary || ' title ' || emp.title);
    end loop;
end;

begin
display_emp(900);
end;
--7. Write a PL/SQL block that will reduce the cost of
--all courses by 5% for courses having an enrollment
--of eight students or more. Use a cursor FOR loop
--that will update the course table.
declare
numofstudent int;
begin 
    for courseitem in (select * from course)
    loop
        select count(student_id) into numofstudent
        from enrollment e join section s on e.section_id = s.section_id
        where course_no = courseitem.course_no;
        if(numofstudent>=8) then
        update course set cost = cost*0.95 where course_no=courseitem.course_no;
        end if;
    end loop;
end;

--8. Write a PL/SQL block with two cursor for loops. The
--parent cursor will call the student_id, first_name,
--and last_name from the student table for students
--with a student_id less than 110 and output one line
--with this information. For each student, the child
--cursor will loop through all the courses that the
--student is enrolled in, outputting the course_no and
--the description.

begin
    for stu in (select * from student where student_id <110)
    loop
        dbms_output.put_line('id: ' || stu.student_id || ' name ' || stu.first_name || stu.last_name);
        for en in (select c.course_no, c.description
                    from enrollment e join section ct on e.section_id=ct.section_id
                    join course c on ct.course_no = c.course_no
                    where e.student_id=stu.student_id)
                    loop
                        dbms_output.put_line(chr(9) || 'cousre no: ' || en.course_no || ' description ' || en.description);
                    end loop;
    end loop;
end;
-- explicit
declare
cursor c_student IS select * from student where student_id <110;
cursor c_course_enroll (stuid student.student_id%type) is select c.course_no, c.description
                    from enrollment e join section ct on e.section_id=ct.section_id
                    join course c on ct.course_no = c.course_no
                    where e.student_id=stuid;
begin
    for stu in c_student loop
    dbms_output.put_line('id: ' || stu.student_id || ' name ' || stu.first_name || stu.last_name);
        for en in c_course_enroll(stu.student_id)
        loop
                                dbms_output.put_line(chr(9) || 'cousre no: ' || en.course_no || ' description ' || en.description);
        end loop;
    end loop;
end;
--9. Write a function to check a course, if the course
--exists then return 1 (yes) else return 0 (no).
--(compare the description of this course)
--Write a procedure to insert data into course table.
--Before inserting data, check this course whether
--exists or not.
create or replace function check_course (vdata course.description%type) return int
as 
begin
    for c in (select * from course where description = vdata)
    loop
        return 1;
    end loop;
    return 0;
end;

create or replace procedure insCourse(id course.course_no%type, des course.description%type, vcost course.cost%type)
as
begin
    if(check_course(des)=0) then
    insert into course values(id, des, vcost, null, 'DSCHERER', SYSDATE, 'DSCHERE', SYSDATE);
    dbms_output.put_line('insert thanh cong');
    else
        dbms_output.put_line('insert that bai');
    end if;

end;

begin
insCourse(451, 'DB Programming with Java', 300);
end;
--10. Write a function that returns all instructors
--(return a ref cursor)
--Write a PL/SQL block that prints out these
--instructors (instructor_id, first_name, last_name,
--street_address).

--11. Write a trigger:
--When inserting data into employee table,
--created_date is the sysdate.
--When updating data of employee table, modified_date
--is the sysdate.
create or replace trigger trg_employee_iu
before insert or update on employee
for each row
begin
    if(inserting) then
    :new.created_date:=sysdate;
    elsif(updating) then
    :new.modified_date:=sysdate;
    end if;
end;
--12. Write a trigger: when updating name, salary, title
--of an employee in employee table, old data of this
--employee will be inserted into employee_change
--table.
create or replace trigger trg_employee_u
after update on employee
for each row
begin
    insert into employee_change values(:old.employee_id, :old.name, :old.salary, :old.title);
end;
--13. Write a trigger to guarantee that: Salary of a new
--employee cannot below 100.
create or replace trigger trg_employee_i
before insert on employee
for each row
begin
    if(:new.salary < 100) then
    raise_application_error(-20000, 'Salary cannot below 100');
    end if;
end;

--14. Write a trigger: when inserting data into employee
--table, the first letter of name of employee will be
--capitalized (initcap)
create or replace trigger TRG_EMPLOYEE_INSERT
before insert on employee
for each row
begin
    :new.name := initcap(:new.name);
end;

