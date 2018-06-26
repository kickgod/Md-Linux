-- 函数

-- 语法
create or replace function(参数)
return 返回值类型
[authid |definer|current_user]
as|is
begin
 
 exception
 
end;
-- 无参数函数
---------------------------------
create or replace function stu_avg_grade
 return NUMBER --这里没有逗号
 as 
  --这里没有declare
   sum_avg_avg number;
 begin
    --select avg(sum_avg) into sum_avg_avg from STUDENT;
    return 30;
 end;


-- 带参数函数
-----------------------------------
create or replace function fc_get_avgcount(stuID varchar)
return number  
as
   isHave int;
   avgGrade number;
begin
   select count(*) into isHave from SC where trim(SNO) =stuID;
   if isHave <= 0 then
      return 8;
   else
     select avg(GRADE) into avgGrade from sc where SNO ='008';
     
     return avgGrade;
   end if;
end;
----------
set serveroutput on;


-- 调用函数
select stu_avg_grade() from dual;

-- PLSQL块 调用
declare
   interesting int;
begin
   interesting :=stu_avg_grade();
   DBMS_OUTPUT.put_line('平均分:'||interesting);
   Exception when others then
    DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;




