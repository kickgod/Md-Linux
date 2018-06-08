--trigger 语法
/*
create or replace trigger trigger_name
[before | after |instead of]
[insert | delete |  update of 列名称]
on 表名称|视图|database |schema
referencing [old as 标记] [new as 标号] [parent as 标志]
for each row
[Follows 触发器名称]
disable  --触发器默认的状态
[when 触发条件]
declare
    [程序声明部分]
begin
    [触发器名称]
end 触发器名称;
*/
--视图只能应用:instead of 用于处理复杂视图

--触发器不接受任何参数 一张数据表只能有最12个触发器 每个触发器 大小最多32K

-- 默认情况下 触发器之中是不能使用事务处理

-- 张表如果定义过多的触发器则会导致DML性能下降 数据库中不要使用触发器 因为性能太慢了  特别是对于大型项目 数据交换频繁

/*--****************************************************************--*/

-- 1.DML触发器 当用户执行了insert update delete  
-- 2.分为 表级别触发器 | 行级触发器

/*--****************************************************************--*/

--  表级别触发器 不加上 for each row
/*
create or replace trigger tri_tb_age_add 
before update on USERS
for each row
declare
  [声明]
begin
  [程序代码]
end tri_tb_age_add;
*/


----DML 表级触发器
set serveroutput on;



--每次插入就把年级减少一个
create or REPLACE trigger tri_tb_age_add
BEFORE insert on USERS
declare
  cursor users_cu is select * from Users;
  user_gradenew USERS.User_Grade%Type;
begin
   for val in users_cu loop
     DBMS_OUTPUT.PUT_LINE(val.User_Grade);
     user_gradenew:= val.User_Grade-1;
     update users set User_Grade=user_gradenew where USER_ID =val.User_ID;
     
   end loop;
end;



--******每次发生表的变得那么记录在record表中****----

create table SysRecord(
  op_id int,
  op_name varchar2(100) not null,
  op_remark varchar(200) check(trim(op_remark)!=''),
  op_IsFinish char(1),
  constraint pk_op_id primary key(op_id)
)


/****************************************************/

  --谨记! :new和:old只能用于行级触发器，不能用于语句级触发器
  -- 下面的触发器就是错误的
  
/******************************************************/
create or replace trigger change_tb_record
before 
insert or update or delete on USERS
declare 
   record_max_id SysRecord.op_id%type;
   user_id varchar(20);
   remark_info_op varchar(200);
BEGIN
   select user into user_id from dual;
   select max(op_id)+1 into record_max_id from SysRecord;

   if inserting then
      remark_info_op:='用户:'||user_id+ '操作类型:insert 操作单位ID: User_ID'||new.USER_ID;
      insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'Insert',remark_info_op,30);
   end if;
   
   if updateing then
      remark_info_op:='用户:'||user_id+ '操作类型:update 操作单位ID: User_ID'||new.USER_ID;
      insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'Insert',remark_info_op,30);
   end if; 
   
   if deleting then 
       remark_info_op:='用户:'||user_id+ '操作类型:delete 操作单位ID: User_ID'||new.USER_ID||new.User_Name||To_char(new.User_Birthday,'yyyy-mm-dd hh24:mi:ss')||To_char(new.User_Grade)||To_char(new.User_Class);
       insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'Insert',remark_info_op,30);
   end if;
   
end;
/********************************************************************************************/
  DBMS_OUTPUT.PUT_line('下面的触发器 实现当对表实现DML操作时！记录在表中!');
/********************************************************************************************/
set serveroutput on;

create or replace trigger change_tb_record
before 
insert or update or delete on USERS
declare 
   record_max_id int;
   remark_info_op varchar(200);
   op_row_count int:=0;
   user_id varchar(20);
BEGIN
   select nvl(user,'无用户') into user_id from dual;
   select count(*) into op_row_count from  Sysrecord;
   if op_row_count=0 then
      record_max_id:=1;
   else
      select max(op_id) into record_max_id from SysRecord;
      record_max_id:=record_max_id+1;   
   end if;
   
   if inserting then
   
      remark_info_op:='用户:'||user_id|| ' 操作类型:insert';
      insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'Insert',remark_info_op,'1');
       DBMS_OUTPUT.put_line('inserting');
   end if;
   
   if updating then

      remark_info_op:='用户:'||user_id|| ' 操作类型:update';
      insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'update',remark_info_op,'1');

  DBMS_OUTPUT.put_line('updating');
   end if; 
   
   if deleting then  
       remark_info_op:='用户:'||user_id|| ' 操作类型:delete';
       insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'delete',remark_info_op,'1');
       DBMS_OUTPUT.put_line('deleting');
   end if; 
end;

/******************************************************************************************/

/*
insert into USERS values('201233211023412','Jkxxxsd',to_date('1998/07/09','yyyy-mm-dd hh24:mi:ss'),2015,30,2); 

select * from USERS;

rollback;
*/


 -- 删除触发器
drop trigger tri_tb_age_add;






























