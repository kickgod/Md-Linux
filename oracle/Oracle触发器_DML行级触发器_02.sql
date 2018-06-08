/******************************************************************************/
/*
/*
/* 行级触发器 可以使用:OLD :NEW 两个字段
--  DML             OLD                        NEW
--  insert        未定义字段内容为null         为新增数据
--  update        更新数据前的数值             更新后的行
--  delete        删除的值                    没有定义 为null
/*
/******************************************************************************/
--                                                     不允许年龄大约20岁的 进入本组 

create or replace TRIGGER Check_stu_is_OK
before
insert or update OF user_birthday  on users
for each row
declare 

begin 
 if inserting then
    if trunc(months_between(sysdate,:new.user_birthday)/12) >20 then
      RAISE_APPLICATION_ERROR(-20000, '错误! 数据不合格! 年龄大于20岁~');
    end if;  
 end if;
 
 if updating then
   if trunc(months_between(sysdate,:new.user_birthday)/12) >20 then
    RAISE_APPLICATION_ERROR(-20000, '错误! 数据不合格! 年龄大于20岁~');
   end if;
 end if;
 
end;


select * from users;

update users set user_birthday=to_date('1991-05-6','yyyy-mm-dd') where USER_ID='2017110410';

select trunc(months_between(sysdate,to_date('2009-05-6 21:32:21','yyyy-mm-dd hh24:mi:ss'))/12) from dual;

