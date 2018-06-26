-- 锁: 不同session 操作同一个锁的
   
   select * from users where user_grade=2016 for update;
   
-- 打开Oracle SQLPlus 用另一个回话执行这个语句,就会发现不会动了。
    
    commit; --提交/回滚后  SQLPLUS就可以施行了。
    
 /*
  行级锁定 用户执行增删改一级 select for update 以后 在当前事务没有提交之前 这些被执行的行就会被加上锁，资源会被独占，其他事务一直要到此事务释放锁后才会进行操作 
  */
  
  /*
   表级锁定 只要用户明确指定使用LOCK TABLE 表名称/视图名称 进行手工锁定。
   语法: LOCK TABLE TABL_NAME/VIEW_NAME IN 锁定模式 Mode [NoWait]
   NoWait：如果发现当前资源以及被其他资源锁定,则不会等待。
   模式： 
        row share 行共享锁 锁定期间 其他事务可以对表进行各种操作 但是不能其他任何事务对同一张表进行独占
        row Exclusive  行排他锁 
        SHare 其他事务可以查询不可以操作
        SHARE ROW EXCLUSIVE 可以查询 但是不可以 select for update 其他用户不可以使用共享锁
        EXCLUSIVE 排他锁,事务将以独占方式锁定表,其他用户允许查询,但是不能修改,也不能设置任何的锁
  */
  
  lock table users in share row exclusive mode nowait;
  
  --解除锁定 结束一个session就可以了
  
  --alter system kill session 'SID,SERIAL#';
    alter system kill session '375,40494';
  -- 查看锁
  select * from v$Locked_object;
  -- 查看session
  select SID,SERIAL# from v$Session where SID IN(374);
  
  
  