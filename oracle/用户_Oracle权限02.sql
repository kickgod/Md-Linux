 /*
   Oralce 中有100多种系统权限，并且不同的数据库版本相应的权限数也会增加。
   表,用户,索引,序列,索引,序列,同义词,视图,子程序 几十条常用权限
   
   权限又分为: 系统权限 和 对象权限
   对象权限又八种  增删改查 sel,ins,upd,de 和执行execute 修改alter 索引index 关联references
 */
 
  grant 权限,... To [用户名. |角色名,...| public]
  [with admin option];--将用户授予的权限继续授予其他用户
  --public 将使用Public 将此权限设置为公共权限；
  
  /*授予用户创建session的权限*/
  grant create session to C##kicker;
  grant connect to C##kicker;
  --Oracle 12c之前的版本 授予权限后需要重启
  
  grant create table,create sequence ,create view to C##kicker with admin option;
  /*
  C D B：CDB全称为Container Database，中文翻译为容器数据库。
  P D B：PDB全称为Pluggable Database，中文翻译为可插拔数据库。
  
  CDB 里面放PDB   CDB 好像电脑  PDB如同U盘
  */
  commit;
  
  --查看用户权限 列出用户权限
  select * from dba_sys_privs where grantee in ('C##KICKER');
  
  select * from dba_sys_privs;
  
  /*撤销权限*/
  
  revoke create table,create view from C##Kicker;
  
  /-----------------------对象授权*********************/
  Grant 对象权限 |All... on 对象  --All表示所有的权限  se de up in index references execute alter
  To [ 用户名 | 角色名 | Public ]
  with grant option;
  
  --授予可以更改一个表的某一列
  grant update(class_id) on classTable To  C##kicker;  
  
  show user;
  
  Revoke 对象权限 |All... on 对象  --All表示所有的权限  se de up in index references execute alter
  From [ 用户名 | 角色名 | Public ]
  
  revoke update(class_id) on classTable from C##Kicker;
  
  
  /****/ --Oracle角色 /*****/
  --查看某一个角色拥有的权限
  select * from role_sys_privs WHERE ROLE= UPPER('DBA') ;
  
  -- 将角色赋予 用户
  grant DBA to C##kicker;
  
  -- 创建 角色
  create role C##kicker_role_Java; 
  -- 将权限赋予角色
  grant create table to C##kicker_role_Java;
  
  -- 从一个角色中收回权限
  revoke CREATE table from C##kicker_role_Java;
  
  --设置角色密码
  alter role C##kicker_role_Java
  identified by JDBC;  
  
  -- 回收密码
  alter role C##kicker_role_Java
  not identified; 