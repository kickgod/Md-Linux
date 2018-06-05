-- whit 临时表   通用表表达式 里面查询语句不以分号 ;结尾 
-- 和动态Sql一样 




with tempTable as
(
  select '四川省' Province ,USERS.USER_ID from USERS
)
select USER_ID from tempTable order by USER_ID desc;


