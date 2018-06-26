/*
   子程序包含: 函数和 存储过程  它是对于代码块的封装的一种特定结构体 
 */
 
 -- 定义存储过程 生命 + PL/SQL
 create or replace procedure pro_Name_next([参数名称,参数模式[in / out /inout ],参数类型]....)
 [authid |definer|current_user]
 as|is   
    -- 没有declare 
    参数生命
 begin
    程序
 exception
   异常处理
 end;
 
 -- 定义超级简单的过程
 create or replace procedure pc_get_vag
 as
 begin
   dbms_output.put_line('平均成绩不知道');
 end;
 
 --执行此过程
 exec pc_get_vag;
 
-- 定义带参数的过程

create or replace procedure pc_get_name_by_id(stuID in varchar)
 as
   stuName STUDENT.SNAME%TYPE;
 begin
    select SName into stuName from STUDENT where trim(SNO)=stuID; 
    DBMS_OUTPUT.PUT_LINE('学号:'||stuName);
 end;

exec pc_get_name_by_id('002'); 
-- 
set serveroutput on

---------------------------
-- 查询子程序  
select * from user_procedures;

-- 查询所有用户对象 表序列 索引 子程序
select * from user_objects;

-- 查询所有对象的源码
select * from user_source;

-- 查询所有子程序的错误信息
select * from user_errors;

-- 删除子程序
drop procedure pc_get_vag;




























 