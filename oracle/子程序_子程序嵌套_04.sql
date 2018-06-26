create or replace procedure inser_stu(
  stuID in STUDENT.SNO%TYPE,
  stuName in STUDENT.SNAME%TYPE,
  stuAge in STUDENT.SAGE%TYPE
) 
as
  status int;
  -- 里面定义一个存储过程
  PROCEDURE ChechisHave (tuID in char)
  as
    ccount_stu int;
   begin 
     select count(*) into ccount_stu from STUDENT where SNO=stuID;
   end;
begin
   null;
end;


-- 这个没有什么用