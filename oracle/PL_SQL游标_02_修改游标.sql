/*
  游标的事务主要依靠"FOR UPDATE"子句与"WHERE CURRENT OF"子句；
  "WHERE CURRENT OF"子句的原理基于ROWID的概念，在更新或删除游标数据的时候，可以利用此
   子句定位数据行。而此子句的创建必须存在有FOR UPDATE子句，否则无法使用；
*/

/* FOR UPDATE [OF COLUMN...]*/

/*
  FOR UPDATE  of column... 和 FOR UPDATE 的区别
  
  FOR UPDATE  of column...: 用于多表查询

*/


-- CURSOR cur_name IS SELECT * FROM emp WHERE ... FOR UPDATE NOWAIT;
-- 创建的游标在执行更新或删除的操作时，必须带有FOR UPDATE子句；
   /*
      该子句会将游标提取出来的数据进行行级锁定，这样在本会话更新期间，其他用户的会话就不能对
      当前游标中的数据行进行更新操作；
   */
     
     set serveroutput on; 
    
    declare
       CURSOR USER_LIST IS SELECT * FROM USERS FOR UPDATE OF USER_GRADE;
       Grade_new USERS.USER_GRADE%TYPE;
    begin
       
       for usr in user_list loop
          Grade_new:=usr.USER_GRADE+1;
          update USERS SET USERS.USER_GRADE=Grade_new where user_id=usr.USER_ID;
          dbms_output.put_line(usr.User_Name);
       end loop;
       
       Exception when others then
          DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
    end;


    /*
      在Oracle中，所有的事务都具备隔离性，当一个用户会话更新数据且事务未提交时，其他用户会话是无法对数据进
      行更新的。如果此时执行游标数据的更新操作，就会进入死锁状态；
      FOR UPDATE NOWAIT子句可以避免游标死锁状态；
      示例1：创建不等待游标
    
    */
    DECLARE
        CURSOR cur_emp IS SELECT * FROM emp WHERE deptno=10 FOR UPDATE OF sal,comm ;    
    BEGIN    
        FOR emp_row IN cur_emp LOOP
        
         UPDATE emp SET sal=9999 WHERE CURRENT OF cur_emp ; --表示更新当前行
        
        END LOOP ;   
    END ;