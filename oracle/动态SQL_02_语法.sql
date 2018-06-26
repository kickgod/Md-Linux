/*
  
   execute immediate 
    into 
    using
    returning | return 
    转移使用 ''
 */
 
 execute immediate 动态SQL字符串[BULK COLLECT] INTO 自定义变量...
 using in|out|int out 绑定参数
 returning | return [bulk collect] into 绑定参数
 
 
 --- 使用 using 占位符
 
  declare
    l_depnam varchar2(20) := 'testing';
    l_loc    varchar2(10) := 'Dubai';
  begin
    execute immediate 'insert into dept values  (:1, :2, :3)'
    using 50, l_depnam, l_loc;
  commit;
 end;
 
 -- 使用into 从动态sql里面 检索值
 declare
  l_cnt    varchar2(20);
 begin
    execute immediate 'select count(1) from dual'
    into l_cnt;
    dbms_output.put_line(l_cnt);
 end;
 
 -- 混合使用
 declare
   l_dept    pls_integer := 20;
   l_nam     varchar2(20);
   l_loc     varchar2(20);
 begin
    execute immediate 'select dname, loc from dept where deptno = :1'
       into l_nam, l_loc
       using l_dept ;
 end;

-- 可以拼接字符串


---------------------------

打开游标变量的时候使用using 
open 游标名称 for 动态sql语句 [using 绑定变量...]


declare
  cur_stu SYS_REFCURSOR;
  row_stu Student%ROWTYPE;
begin
  open cur_stu for 'select * from STUDENT';
  loop
     fetch cur_stu into row_stu;
     EXIT WHEN cur_stu%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(row_stu.SNO);
  end loop;
end;























