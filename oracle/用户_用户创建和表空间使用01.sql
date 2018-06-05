  /*
   用户: 创建与管理 
  */
  /*
  create [Temporary] TABLESPACE 表空间名称
  [datafile | Tempfile 表空间路径] size 数字[K|M]
  autoextend on |off next 数字 [K | M] --是否是自动扩展文件
  Logging | NoLogging;
  
  错误: 如果无法创建文件 你需要先把目录文件创建出来  才可以 不可以直接把数据文件创建在盘符之下
  */
  dbms_output.put_line('表空间创建----------语法-----------:');
  CREATE tablespace  Mydb
  datafile 'E:\TableSpace\mydb_datafile.dbf' size 64M
  autoextend on next 5M
  Logging
  数据库操作_表定义_01.sql
  
  /*查看表空间*/
  select * from dba_tablespaces;
  DESC dba_tablespaces;
  /*
    USERS表空间  用以存储用户的数据
    Undo表空间 用于事务的回滚和撤销。
    Temp表空间 用以存放Oracle运行中需要临死存储的数据比如排序和中间结果
  */
  
  /*创建一个表 然后方法哦一个表空间下*/
    create table student(
    Sno varchar(10) primary key,
    Sname varchar(20) not NULL,
    Sage smallint,
    Ssex varchar(2),
    Sdept varchar(20)) tablespace mydb;
  
  --可以通过alter方法，将一个表移动到另外一个表空间中：
    alter table spaceOne.tablename  move tablespace spaceTwo;
  --解释：以上语句就是把tablename表从spaceOne移动到spaceTwo中。
  
  /*删除表空间*/
  DROP TABLESPACE Mydb INCLUDING CONTENTS AND DATAFILES;
  
  /*表空间扩容*/
  alter database datafile '/oracle/app/oradata/mytablespace/my_01.dbf' resize 256M;
  
  dbms_output.put_line('创建用户 -----------语法-------------:');
  /*
  create user 用户名 Identified By 密码
  default TableSpace 表空间名称
  QUOTA 数字[K|M|] | UNLIMITED ON 表空间名称
  QUOTA 数字[K|M|] | UNLIMITED ON 表空间名称
  PROFILE 概要文件名称|default --用户操作的资源文件 如果不指定则使用默认资源配置文件
  password Expire --用户密码失效需要在第一次使用的时候修改密码
  ACCOUNT LOCK|UNLOCK  --使用锁定用户 默认是UNLOCK
  */
  /* oracle 12c 之后创建一个用户后登陆需要加上 C##*/
  
  create user kicker identified By Oracles
  default tablespace mydb
  quota unlimited on mydb
  account unlock
  
  create user C##kicker identified By Oracles
  default tablespace mydb
  quota unlimited on mydb
  account unlock 
  /* oracle 12c 之后创建一个用户后登陆需要加上 C##*/
  /*修改用户*/
  alter user Kicker identified by jiangxing000;
  
  --alter user c##Kicker identified by jiangxing000;
  /*强制用户下次登录时 修改密码*/
  alter user kicker password expire;
  
  /*锁定/解锁 用户*/
   alter user kicker account lock;
   alter user kicker account unlock; 
  
  
    show user; -- 查看当前用户
  /* 用户概要文件  :
     概要文件是一组命名了的口令和资源文件，管理员利用它可以直接限制用户的资源访问量或者用户管理等操作
     分为两组 
      第一组：资源限制命令
          sessions_per_user 数字 |UNLIMITED |DEFAULT 
          允许一个用户同时创建SESSION的最大数量
          CPU_per_Session 数字 |UNLIMITED |DEFAULT
          一个session 允许使用CPU 的时间数  毫秒
          cpu_per_call 数字 |UNLIMITED |DEFAULT
          限制每次条用sql语句期间 CPU的时间总量 单位分
          Idle_Time 数字 |UNLIMITED |DEFAULT
          session 的超时时间  单位 分
          Connect_time 数字 |UNLIMITED |DEFAULT 
          session的连接时间数 单位为分
          logical_reads_per_session 数字 |UNLIMITED |DEFAULT
          为了防止笛卡尔积的产生,可以限定每一个用户最多允许读取的数据块数量
          logical_reads_per_call 数字 |UNLIMITED |DEFAULT
          每次调用SQL语句期间 最多允许用户读取的数据块数量
      第二组：口令限制命令
          failed_login_attempts 数字 |UNLIMITED |DEFAULT
          当连续登陆失败次数达到该参数指定时，用户被加锁
          password_life_time 数字 |UNLIMITED |DEFAULT
          口令有效期 (天) 默认 无限制
          password_reuse_time 数字 |UNLIMITED |DEFAULT
          口令被修改后原有口令隔多少天可以被重新使用，默认无限制
          password_verify_function 数字 |UNLIMITED |DEFAULT
          口令校验函数
          password_lock_time 数字 |UNLIMITED |DEFAULT
          账户因为 failed_login_attempts被加锁后加锁的天数
          password_grade_time 数字 |UNLIMITED |DEFAULT
          口令过期后，继续使用原口令的宽限期(天)
     */
     --在创建profile之前，需要修改一个参数，alter system set resource_limit=true;
     alter system set resource_limit=true;
     
     
     create profile C##kicker_profile limit
     FAILED_LOGIN_ATTEMPTS 5
     sessions_per_user 200
     CPU_per_Session 1000
     connect_time 60;
     
     CREATE PROFILE c##kicker_profile_list
     LIMIT PASSWORD_REUSE_MAX DEFAULT
           PASSWORD_REUSE_TIME UNLIMITED;
     
     CREATE PROFILE c##kicker_profile_list LIMIT
      FAILED_LOGIN_ATTEMPTS 5
      PASSWORD_LIFE_TIME 60
      PASSWORD_REUSE_TIME 60
      PASSWORD_REUSE_MAX UNLIMITED
      PASSWORD_VERIFY_FUNCTION verify_function
      PASSWORD_LOCK_TIME 1/24
      PASSWORD_GRACE_TIME 10;
      
     alter profile kicker_profile limit
     CPU_per_Session 1000
     sessions_per_user 200
     cpu_per_session 100000
     connect_time 60;
     
     /*利用概要文件管理用户 将一个概要文件赋给多个用户 
     当删除这个概要文件时使用cascade关键字 将会删除所有使用这个概要文件的用户*/
     -- 删除概要文件的 将会删除kicker用户
     drop profile C##kicker_profile_list cascade; 
     
     /*查看创建的概要文件*/
     select * from dba_profiles;
      

  