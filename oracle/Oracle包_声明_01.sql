/*
   包: 模块化程序设计的主要实现手段,可以将 过程,函数,游标,类型,变量 放在一起管理 时期可以方便的
   相互调用
   
   包的定义包含两个部分: 包规范 和 包体
 */
 
 -- 包规范 package 定义保重可以被外部访问的部分，在包规范中的生命的内容可以从应用程序和包的任何地方访问。
 -- 定义语法如下所示
 
create [replace] package pk_name
--[authid |definer|current_user] --可有可无的东西
IS--或者 AS 都可以
  -- 结构名称定义(类型,过程,函数,游标,异常等等)
end pk_name; 


 -- 包体 Package body :负责包规范中定义的函数或者过程的具体实现代码,如果在包体之中
 -- 定义了包规范中没有的内容,则此部分将会被设置为私有内容,包体的定义语法如下所示。
 
 create [replace] PACKEAGE BODY pk_name
 is --或者 as
    结构实现(类型,过程,函数,游标,异常等等)
begin
    包初始化程序代码
end;

---------------------------------------------------------------------

--包规范
create or replace package pk_student_manger
as
  Function get_student_count return number;
end;

--包体实现

create or replace package body pk_student_manger
as
   Function get_student_count
   return number
   as
     scount number;
   begin
     select count(*) into scount from Student;
     return scount;
   end;
end;

-- 查询用户定义的包 和 包体
select * from user_objects
where object_type in ('PACKAGE','PACKAGE BODY');

-- 执行包体

set serveroutput on;

declare
   cout int;
begin
   cout:=pk_student_manger.get_student_count();
   DBMS_OUTPUT.put_line('学生数量:'||cout);
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- 重新编译 包规范
alter package pk_student_manger compile specification;
-- 重新编译 包体
alter package pk_student_manger compile BODY;






























