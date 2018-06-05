
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