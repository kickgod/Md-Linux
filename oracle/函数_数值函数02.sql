/*C:\Users\Kick\AppData\Roaming\SQL Developer*/
 -- sum 
 -- 求和 条件求和 高级用法
  select sum(case when Grade>=60 then 1 else 0 end) as 及格人数 from sc;
 
 -- round（float,savePoint）; 
 -- 保留几位小数 四舍五入
 select round(95.625,2) from dual;
 -- trunc 截取小数
 select TRUNC(15.79),TRUNC(15.71239,2) from dual;
 
 -- 取整函数
 -- floor / ceil
 select floor(98.56) as floor向下取整 ,CEIL(56.235) 向上取整  from dual;
 