/*********** --------------- PL/SQL 运算符 -------------- *************/

-- 赋值云算法  into  :=


declare
   v_Id varchar(20);
   v_user_name  varchar(20);
   v_count int:=0;
begin
   v_id:='2017110418';
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- 连接运算符 || 字符串连接  不用+ 用户||


-- 关系云算法 > < <= >= = != <>
-- null is null  is not null
-- 逻辑 and or not
-- between and 
-- in 
-- like

declare
   val_ varchar(50):='vallist valkk val';
begin
   if INSTRB(val_,'val') >0 then
      DBMS_OUTPUT.PUT_LINE('包含');
  end if;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

