 -- 创建一个表空间
 
   create tablespace mangodb
   datafile  'E:\TableSpace\mangodb_datafile.dbf' size 32M
   autoextend on next 5
   Logging;


 -- 创建一个用户
  create user C##oracle2016110418 identified by oracle 
  default tablespace mangodb
  quota unlimited on mangodb
  account unlock;

-- 分配权限
  grant create session to C##oracle2016110418;
  grant connect to C##oracle2016110418;
  grant resource to C##oracle2016110418;
  grant dba to C##oracle2016110418;
  grant create table,create view,create trigger,create procedure to C##oracle2016110418;

------------------------------------ 打开其他窗口 --------------------------------------

-- 创建一个序列
create sequence seq_DepartmentId
increment by 1
start with 1
maxvalue 999999999;

-- 创建一个部门表

create table Department (
  DId int,
  DName varchar(20),
  Dfunds number,
  Dprincipal varchar(20)
) tablespace mangodb;

 --添加约束 
alter table Department add constraint pk_Did primary key(DId);
alter table Department modify (DName varchar(20) not null); 
alter table Department modify (Dprincipal varchar(20) default '000001');

create table Employees(
   Eid varchar(20),
   EName varchar(20),
   Age int,
   DId int
) tablespace mangodb;

alter table Employees add constraint pk_Eid primary key(DId);
alter table Employees add constraint fk_Eid_DId foreign key(DId) references Department(DId);

--------------------------------------------







