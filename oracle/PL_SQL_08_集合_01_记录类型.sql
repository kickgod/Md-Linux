/*********** --------------- PL/SQL 集合 记录类型 -------------- *************/

/*
   语法；
     type type_name is record (
          col_name 数据类型 [not null]:=默认值,
          col_name 数据类型 [not null]:=默认值,
          col_name 数据类型 [not null]:=默认值,
          col_name 数据类型 [not null]:=默认值,
          col_name 数据类型 [not null]:=默认值
     );
*/

 select * from users;
 
 declare 
     v_ID  USERS.USER_ID%Type;
     type User_type is record(
        ID  USERS.USER_ID%Type,
        Name  USERS.USER_NAME%tYPE,
        Birthday USERS.USER_BIRTHDAY%tYPE
     );
     USER_ USER_TYPE;
 begin
     v_ID:=&Input_ID;
     
     select USER_ID,USER_NAME,USER_BIRTHDAY INTO USER_ FROM USERS WHERE User_ID =v_ID;
     DBMS_OUTPUT.PUT_LINE('学号:'||USER_.ID||' 姓名:'||USER_.Name||' 生日:'||to_char(User_.Birthday,'yyyy-mm-dd hh24-mi-ss'));
     exception when others then
        dbms_output.put_line('错误编号:'||SQLCODE||'-'||SQLERRM);
 end;
    
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 