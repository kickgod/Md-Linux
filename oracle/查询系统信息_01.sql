/*********表 查询 当前用户所具有的表，当前执行这个语句的用户  user_tables *****/

-- 不同的用户得到数据不同
select * from user_tables;

/*********表 查询 所有的表 无论用户   all_tables *** */

-- 有时候不同的用户下有相同名字的表 所以在查询是否存在某个表的时候 需要查询all_tables where 条件后面加上 table_name 和Owner
select * from all_tables where Table_Name ='SC_NUMBER' and  owner= C##MYDBADMIN;

select * from sc;

set linesize 100; /*设置每一列的输出宽度 避免换行*/

/*查看当前用户*/
show user;
select user from dual;
--查看当前容器名称
show con_name;
--修改容器
alter session set Container =pdbmldn;

--
select * from dba_users;