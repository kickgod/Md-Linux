/*
 
  不在包规范中定义，而只在包体定义的结构为私有
  所有的包是在第一次被调用时才会进行初始化操作，而后包的运行状态保存到用户全局区的会话
   中，在一个会话期间内，此包会一直被用户所占用，一直到会话结束后才会将包释放；
   
   包中的任何一个变量或游标都可以在一个会话期间一直存在，相当于全局变量，同时可以被所有的子程序所共享；
 
 */
 
 
 
CREATE OR REPLACE PACKAGE pk_sudent_info
AS
   stuID student.SNO%type:='008';
   FUNCTION getName RETURN varchar2 ;
END ;



CREATE OR REPLACE PACKAGE BODY pk_sudent_info
AS
    FUNCTION getName RETURN varchar2
    AS
      StuName varchar(20);
    BEGIN
       SELECT SNAME INTO StuName FROM STUDENT WHERE SNO=pk_sudent_info.stuID;
       RETURN StuName ;
    END ;
END ;


declare
   Sname varchar(20);
begin
   Sname:=pk_sudent_info.getName();
   DBMS_OUTPUT.put_line('学生名称:'||Sname);
   pk_sudent_info.stuID:='007';
   Sname:=pk_sudent_info.getName();
    DBMS_OUTPUT.put_line('学生名称:'||Sname);
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;


