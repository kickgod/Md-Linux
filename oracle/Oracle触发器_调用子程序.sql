/*
 1. 调用子程序 原因: 触发器最大代码量:32K

 */
 
 create or replace function stu_avg_grade
 return NUMBER
 as
   sum_avg_avg number;
 begin
    select avg(sum_avg) into sum_avg_avg from STUDENT;
    return 30;
 end;
 
 --------------------------------
 create or replace trigger insert_student
 before 
 update or insert on Student
 for each row
 begin
     if :new.Sum_Avg <stu_avg_grade() then
         raise_application_error(-20520,'不合格总成绩!');
     end if;
 end;
  
  
 -------------------------------- 
select avg(sum_avg)   from STUDENT;

select * from student;

update student SET SUM_AVG=300 WHERE sno='002';

/*
  回滚一下
 */
rollback;
















