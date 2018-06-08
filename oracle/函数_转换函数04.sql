/************************** 转换函数 *********************************/
-- TO_CHAR 日期格式化
/*
   YYYY 完整年
   Y,YYY 带逗号的年
   YYY 年的后三位
   YY 后两位
   Y  后一位
   YEAR 年份的 文字表示 直接表示四位的年
   MONTH 月份的文字表示 直接表示两位的月
   MM 用两位数字表示月份 月有两份所以有两个M
   DAY 天数的文字
   DDD 表示一年的天数
   DD 表示一个月里的天数 
   D 表示一周的天数
   DY 表示一周里的星期几 文字表示
   WW 表示一年里面的周数
   W 表示一个月里面的周数
   HH 表示12小时制，小时是两位数字
   HH24 24进制表示小时
   MI 表示分钟
   SS 表示秒 秒是两位数字
   SSSSS 午夜之后的秒数字表示
   AM | PM 表示上午或者下午
   FM 去除前导零
 */
 select to_date('2005-01-01 13:14:20','yyyy-mm-dd HH24:mi:ss') from dual;  
 
 
  --TO_CHAR(DATE,FORMAT)
  select  sysdate 当前系统时间,To_char(SYSDATE,'YYYY-MM-DD') FROM DUAL;
  -- TO_CHAR(DATE,FORMAT)  去除前导零
  select TO_CHAR(sysdate ,'FMYYYY-MM-DD') from dual;
 -- TO_CHAR 数字格式化
 /*
   9 表示一位数字
   0 显示前导0
   $ 将货币的符号显示为美国符号
   L 根据语言环境的异同自动选择货币s符号
   . 显示小数点
   , 显示千位符
   */
   -- 千位符号
   select TO_CHAR(2059156151651,'999,999,999,999,99999') from dual;
   select TO_CHAR(2059156151651,'000,000,000,000,00000') from dual;  
  -- 美元
    select TO_CHAR(2059156151651,'$999,999,999,999,99999') from dual;
    select TO_CHAR(2059156151651,'L000,000,000,000,00000') from dual;   
  
  --TO_DATE(STRING,DATE_FORMAT)
  SELECT TO_CHAR(TO_DATE('1998-8-5 21:21','YYYY-MM-DD HH24:MI'),'YYYY-MM-DD HH24:MI:SS') from dual;
 
 -- TO_Number() 字符串编程数字
 -- 没有用 Oracle支持自动转型
  select to_number('19') *to_number('56') from dual;
 
  select '19'*'56' from dual;
 
-- 数字转字符串 cast(value as newType) 
 select cast(95.6512 as varchar(20)) from dual;
-- 数字转字符串
 select to_char(95.6512) from dual;
 
 
 
 
 