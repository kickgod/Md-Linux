/****************************  通用函数  ************************************/
/*
  NVL
  NVL2
  NULLIF
  DEOCODE
  COALESCE
*/
/**************************************************************************/
-- 验证 NVL 函数
-- 判断是否为空 NVL 函数 非空则为原值 否则为 给定值
   select NVL(NULL,0),NVL(3,0) FROM dual; 
   
-- NVL2(value,not_null_vakue,null_value) 如果 是空则取not_null_vakue  否则取null_value

  select NVL2(NULL,95+6,75) from dual; -- return  75
  
  -- NULLIF(表达式一,表达式二) 函数的主要功能是判断两个表达式结果是否相等 相等返回NULL 不相等返回表达式一
  
  select NULLIF(75,75) from dual; --相等  返回 NULL

  select NULLIF(85,75) from dual; --不相等 返回 85 
  
  -- DECODE() 函数 这个函数类似于程序中的 if..else..if  else但是判断的内容都是根据一个具体的值
  -- DECODE(value | 表达式 ,值,输出结果,值2,输出结果....,默认值)
  select DECODE(11,1,'内容是一',2,'内容为二','默认值') from dual;
  select DECODE(2-1,1,'内容是一',2,'内容为二') from dual;
  
  -- COALESCE(表达式一,表达式二,表达式三,表达式四....) 表示一为空 则为表达式二 如果表达式2为空则为表达式三....
  
  select Coalesce(null,5,56) from dual;
  
  
  /**************************************************************************/