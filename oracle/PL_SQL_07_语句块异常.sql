
---异常 系统预定义异常 捕获

declare
  v_sal int;
begin
  v_sal:=20;
  case 
      when v_sal>20 then
      dbms_output.put_line('我爱你');
      when v_sal=20 then
      dbms_output.put_line('我很爱你');
      when v_sal<20 then
      dbms_output.put_line('我超级爱你');
   end case;
exception
  when CASE_NOT_FOUND THEN
  dbms_output.put_line('在Case处缺少条件！');
end;

set serveroutput on;

/*
用户自定义异常
方式一 :在声明块中声明Exception对象,此方式有两种选择:
       选择一: 声明异常对象并且用名称来引用它,此方式使用普通的others异常捕获用户定义异常;
       选择二: 声明异常并将它与有效的Oracle错误代码映射,需要编写单独的When语句块捕获
方法二 ：在执行块中构建动态异常        
        通过RAISE_APPLICATION_ERROR 函数可以构建动态异常.在触发动态异常时,可以使用-20000
        ~-20999范围的数字。如果使用动态异常,可以在运行时指派错误信息.
*/


-- 第一种错误
declare
   val_count int:=20;
   va_myexception exception;
   pragma Exception_IniT(va_myexception,-20998); --设置错误编码  使用负数
begin
   if val_count >10 then
     raise va_myexception;
   end if;
   Exception 
     when va_myexception then
       DBMS_OUTPUT.PUT_LINE('请输入一个数: 它小于<10');
     when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

--第二种




declare
   val_count int:=20;
   /*这里也不需要定义一个变量*/
begin
   if val_count >10 then
      RAISE_APPLICATION_ERROR(-20789,'请输入与一个正确的数字'); --直接在这里抛出异常
   end if;
   Exception 
     when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;






-- 非系统预定义异常
declare 
  --系统非预定义异常的定义与关联
  ex_null exception;
  pragma Exception_IniT(ex_null,-01400);
  --用户自定义异常
  ex_insert exception;
  v_ese int:=50;
begin
    if v_ese>20
    then
        raise ex_insert;
    elsif v_ese=20
    then
       v_ese:=50;
    end if;
exception
     when ex_null then
     dbms_output.put_line('系统非预定义错误');
     when ex_insert then
     dbms_output.put_line('用户自定义错误');
end;