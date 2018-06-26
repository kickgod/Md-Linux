-- 子程序参数模式
/*
 IN  默认数值传递 形式参数 default value也是 in模式
 OUT 空进带值传入
 IN OUT 地址传递  不解释了

*/
---------------------------------------------------------
-- IN 模式
---------------------------------------------------------


--查询一个学生 成绩在一定分数上的课程门数量.
create or replace function ccount(
  stuID IN CHAR,
  stu_Grade number default 60  --默认值
  )
return int
as
   counts number;
begin
   select count(*) into counts from SC where trim(SNO)=trim(stuID) and GRADE>=stu_Grade;
   return counts;
end;

-- 测试调用
select ccount('006') from dual;

-- 子程序调用
declare
   counts int;
begin
   -- 默认值调用
   DBMS_OUTPUT.PUT_LINE('学号为008的学生的成绩大约70分的课程数目为:'|| ccount('008',70));
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;


---------------------------------------------------
--- out 模式
---------------------------------------------------

create or replace function ccount(
  stuID IN CHAR,
  count_c out number,
  stu_Grade number default 60 --默认值
  )
return int
as
   counts number;
begin
   select count(*) into count_c from SC where trim(SNO)=trim(stuID) and GRADE>=stu_Grade;
   return -10;
end;




-- 调用测试
declare
   counts int;
   csd int;
begin   
   csd:=ccount('008',counts,70);
   DBMS_OUTPUT.PUT_LINE('学号为008的学生的成绩大约70分的课程数目为:'||counts);
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;












