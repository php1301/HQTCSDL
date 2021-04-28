-- HOMEWORK
set serveroutput on
-- Bai 1
create or replace procedure checkSectionCourse(secno section.section_no%type, courseno section.course_no%type)
as
    numberofstudent int;
begin
    select count(student_id) into numberofstudent
    from enrollment e join section s
    on e.section_id = s.section_id
    where section_no=secno and course_no=courseno;
    dbms_output.put_line('So sinh vien ' || numberofstudent);
    if(numberofstudent > 10) then
    dbms_output.put_line('over 10 students');
    end if;
end;

-- Bai 2
--a.course 25 and section 89.
--b.course 122 and section 155
begin
checkSectionCourse(89, 25);

end;
begin
checkSectionCourse(155, 122);
end;



-- Bai 3
# return student%rowtype
create or replace function fCheckSectionCourse(stuId student.student_id%type) return number
as 
    numberofcourse int;
begin
    select count(course_no) into numberofcourse
    from student s join enrollment e
    on s.student_id = e.student_id
    where s.student_id=stuId;
    dbms_output.put_line('Number of courses of given student: ' || numberofcousre);
    return numberofcourse;
end;


create or replace procedure findStudentName(stuId student.student_id%type)
as
    sname student.last_name%type;
begin
    select FIRST_NAME || ' ' LAST_NAME INTO sname
    from student
    where student_id = stuId;
    
    dbms_output.put_line(sname);
end;


begin
findStudentName(106);
end;

begin
findStudentName(25);
end;

-- Bai 4
create or replace function FreturnCourseInfo(courseId course.course_no%type) return course%rowtype
as
courseInfo course%rowtype;
begin
    select * into courseInfo
    from course
    where course_no = courseId;
    
    return courseInfo;
end;

declare 
courseInfo course%rowtype;
begin
    courseInfo := FreturnCourseInfo(10);
    select * from courseInfo;
end;