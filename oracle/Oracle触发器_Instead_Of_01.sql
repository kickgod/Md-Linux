/*
 视图只能够使用instead of
 对复制多表触发器 对于一切操作 需要使用instead of 触发器

 */
 
 -- 创建一个视图
create or replace view stuinfo
as
select ROWNUM as ID,Student.SNAME,Student.SNO,Student.SUM_AVG,Student.SSEX,Student.SDEPT,SC.GRADE from  Student inner join SC on SC.SNO=STUDENT.SNO;
 
set SERVEROUTPUT ON; 
 
create or replace trigger view_trigger_insteadof
instead of delete on stuinfo
for each row
declare
    userrow stuinfo%ROWTYPE;
begin
   delete from SC where SNO=:OLD.SNO;
   delete from STUDENT where SNO=:OLD.SNO;
   DBMS_OUTPUT.PUT_LINE('删除学生:'||:old.SNAME);

end;

/*
 
  视图 里面可以使用:old 和:new
*/

desc stuinfo;
-- 错误
delete from stuinfo where SNO='001';

rollback;

select * from stuinfo;















