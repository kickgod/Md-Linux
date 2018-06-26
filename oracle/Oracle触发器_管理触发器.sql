-- 查询所有触发器

select * from user_triggers;

-- 启动或者 关闭触发器

alter trigger tri_name disable | enable;

-- 禁用一个表的所有触发器
alter table tab_name disable all triggers;

-- 删除

drop trigger tri_name;