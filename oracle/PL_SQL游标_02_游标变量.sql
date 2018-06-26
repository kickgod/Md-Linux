/*
  动态打开指定类型的查询,就是动态游标 
  定义游标变量类型
  
  CURSOR 数据变量类型名称 IS REF CURSOR [RETURN 数据类型]
  
  type tp_name ref cursor;
  lists tp_name;
  
  写上return 就是 强类型游标变量定义
  不写return 就是 弱类型游标变量定义
  
  游标变量 使用loop循环 不能使用for 
  
  使用方法
  
  open 数据变量类型名称 FOR select * from table_name.....;
  close 数据变量类型名称
*/
declare
  --定义一个弱游标
  type cur_ref_user IS REF CURSOR;
  cur_user cur_ref_user;
  usrrow users%rowtype;
begin
   open cur_user for select * from users;
   loop
     
       fetch cur_user into usrrow;
       exit when cur_user%notfound;
       dbms_output.put_line('Name:'||usrrow.User_Name||' ID:'||usrrow.USER_ID);
   end loop;

   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;   

--  系统定义弱类型游标 sys_refcursor
declare
  ref_usr sys_refcursor; 
  usrrow users%rowtype;
begin
   open ref_usr for select * from users;
   loop
     
       fetch ref_usr into usrrow;
       exit when ref_usr%notfound;
       dbms_output.put_line('Name:'||usrrow.User_Name||' ID:'||usrrow.USER_ID);
   end loop;

   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;   

ROLLBACK;  