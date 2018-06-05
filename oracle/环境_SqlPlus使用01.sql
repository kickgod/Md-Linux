select * from sc;

set linesize 100; /*设置每一列的输出宽度 避免换行*/

/*查看当前用户*/
show user;
--查看当前容器名称
show con_name;
--修改容器
alter session set Container =pdbmldn;

--
select * from dba_users;