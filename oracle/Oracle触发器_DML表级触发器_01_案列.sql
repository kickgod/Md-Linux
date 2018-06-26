
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


select * from users;

select * from SYSRECORD;

delete  from  users where USER_ID ='2016110414';

commit;

