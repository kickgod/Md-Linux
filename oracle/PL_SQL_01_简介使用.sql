/*********** --------------- PL/SQL 简介 -------------- *************/

-- 0 模板
declare
   
begin
   null;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;



set serveroutput on;

-- 1. 最简单的Pl/SQL
begin
  null;
end;

-- 2. 输入一个id 得到姓名
declare 
   v_Id varchar(20);
   v_user_name  varchar(20);
   v_count int:=0;
begin
    v_id:='&Input_User_ID';
    select count(*) INTO v_count from C##Kicker.users where USER_ID =v_Id; 
    if v_count=0 then
       v_user_name:='未发现用户';
    else 
       select USER_NAME INTO v_user_name from C##Kicker.users where USER_ID =v_Id; 
      
    end if;
     DBMS_OUTPUT.PUT_LINE(v_user_name);
EXCEPTION 
     WHEN no_data_found THEN DBMS_OUTPUT.PUT_LINE('未发现用户');
end;

