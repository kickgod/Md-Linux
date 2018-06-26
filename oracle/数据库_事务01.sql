-- 事务 Oracle
-- 默认情况下 Oracle 都是不自动提交自动提交事务 
/*
  1. SET AUTOCOMMIT =OFF 取消自动提交事务,开启事务处理
  2. SET AUTOCOMMIT =ON 打开自动提交处理,关闭事务处理
  3. COMMIT 提交事务
  4. ROLLBACK TO 回滚操作
  5. SAVEPOINT事务保存点名称 设置事务保存点
*/
 savepoint starts;

 insert into users(USER_ID,User_Name,USER_BIRTHDAY,USER_GRADE,User_STATUS) 
        values('2015110418','蒋星',TO_DATE('1997/5/6','yyyy-mm-dd'),2015,30);
    select  * from users where User_Grade =2015;   

-- 回滚事务
  
  rollback TO starts;
   
   

-- 提交事务
   commit;
   