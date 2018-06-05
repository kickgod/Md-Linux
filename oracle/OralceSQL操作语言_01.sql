/*利用查询 创建表*/

create table users_bak
as
select * from C##kicker.users;


select * from users_bak;

--增加子查询的数据
/*
insert into tableName(col_name1,col_name2,col_name2....)
  select * from tablName where...
*/

-- 根据子查询跟新数据







