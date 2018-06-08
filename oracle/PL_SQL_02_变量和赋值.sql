/************************* ------------ - PL/SQL 变量 - ----------- *************************/
 -- 1. 定义常量

declare 
   v_name varchar(20);
   v_id varchar(20);
begin
   --为变量赋值 :=
   v_id:='2017110418';
   select USER_NAME into v_name from users where user_id=v_id; 
   dbms_output.put_line(v_name);
end;

 -- 2. 定义非空变量
 --    定义了 就必须要赋值 
declare 
   v_name varchar(20) not null:='2015'; -- 
   v_id varchar(20);
begin
   v_id:='2017110418'; --无论能不能找到一个有效的用户  上面都必须要赋值
   select USER_NAME into v_name from users where user_id=v_id; 
   dbms_output.put_line(v_name);  
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- 4. constant 定义常量

declare 
   v_name constant varchar(20) not null:='2015'; -- 
   v_id varchar(20);
begin
   v_id:='2017110418'; --无论能不能找到一个有效的用户  上面都必须要赋值
   select USER_NAME into v_name from users where user_id=v_id; 
   dbms_output.put_line(v_name);  
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
      --表达式 'V_NAME' 不能作为 SELECT/FETCH 语句的 INTO 目标 报错 因为不能给常量into
end;

-- 3. %Type  %RowType
-- 使用 %ROWTYPE 属性时, 'USER' 必须命名表, 游标或游标变量
declare 
   v_grade users.USER_GRADE%type;
   v_userRow users%ROWType;
BEGIN
  select * into v_userRow from users where user_id='2017110418'; 
  v_grade:=v_userRow.USER_GRADE;
  DBMS_OUTPUT.PUT_LINE(v_grade);
END;
