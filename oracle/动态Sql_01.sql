/*
  在函数和子程序中使用 
   
    EXECUTE IMMEDIATE 'drop table temp_1';  
    EXECUTE IMMEDIATE 'create table temp_1(name varchar2(8))';  

 */
 
 
 create or replace procedure pk_create_info
 as
   tbl_count int;
 begin 
    /* 判断表是否存在 */
    select COUNT(*) INTO  tbl_count from all_tables where Table_Name ='USERSINFO' and  owner= 'C##MYDBADMIN';
    if tbl_count=1  then
       execute immediate 'drop table USERSINFO';
    else
       EXECUTE IMMEDIATE 'create table usersinfo (id varchar(20))'; 
    end if;
 end;
---    
-------------------------------------------------------
declare
   
begin
   pk_create_info;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;
-------------------------------------------------------