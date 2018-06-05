-- 数据字典 Oracle用来记录数据库对象信息的数据对象
select * from all_users;

-- 修改表名称 就相当于 修改数据字典中的表信息
-- 将就名字 变成 新名字
rename users  to ItUsers; 

rename ITusers  to Users; 

--修改列名称 
alter table TABLE_NAME rename column FIELD_NAME to NEW_FIELD_NAME;


select *from ITUSERS;

-- 表清零 /表截断   truncate table tablname;

--删除表 drop table tableName
  
  select * from users;
  
  delete from users;
  
  rollback;
  
  
-- FlashBake 闪回    Oracle 10g 增加的防止数据库误操作
   /* Oracle为了防止 对于表的误删除 所以对于删除后的数据是存放在回收站的 如果需要可以使用闪回 找回删除的数据 */
   select * from users_bak;
   
   drop table users_bak;
   --可以查看删除的数据
   select * from recyclebin;
    --闪回删除的表
    Flashback table users_bak to before drop;
    -- 表回来了
    select * from users_bak;
    
    -- 彻底删除一张表 drop table table_name purge;
    
    --删除回收站中的表 Purge table tableName;
     
    -- 情空回收站 purge recyclebin
  /***************************************----------------*******************/
  /* Create /DROP /Alter
  /*                                                  */
  -- 增加列
  ALTER TABLE USERS ADD (User_Class int default 0);
   
  select * from users;
  -- 删除列
  alter table users DROP COLUMN User_Class;
  
  -- 无用字段设置 无用类 不需要掌握
  alter table users set unused column User_Class;
  alter table users set unused(User_Class);
  --midify
  alter table users modify (User_Class  varchar(20) not null);
  commit;
  desc table users;
  -- 删除无用列
  alter table users drop unused COLUMNS ;
  
  --增加表注释
   Comment on table users is '用户信息表';
   
   --增加列注释
   Comment on column users.User_ID is '使用用户学号';
   /* 查看注释信息 */
    select * from user_tab_comments;
    select * from user_tab_comments where table_name='USERS';
    
    --查看列注释
    select * from user_col_comments where table_name ='USERS'; 
   
  
  
  
  
  
  
  
  