/************时间函数******************/

--查看 当前时间 默认显示年月日   如果需要显示更多信息需要改变语言环境
select sysdate from dual;

alter session set nls_date_format ='yyyy-mm-dd hh24:mi:ss';

--三天后的日期

select sysdate +3 from dual;

--add_months(date,numberofmonthCount);
-- 增加月 正数  减小月 负数
select  sysdate 现在,ADD_MONTHS(sysdate,3) as 三个月之后 from dual;

select ADD_MONTHS(sysdate,3)-sysdate 相差天数 from dual;

--下一个指定日期的求得 想到阿拉伯数据是全世界通用的，那应该可以用1--7代替星期几 。

select NEXT_DAY(SYSDATE,1) from dual;
--最好一天
select LAST_DAY(SYSDATE)from dual;

--查看相差月数
select months_between(ADD_MONTHS(sysdate,50),sysdate) from dual;

-- 两个时间相减 则为相差天数

--查看 相差年数
select trunc(months_between(sysdate,to_date('1995-8-5 21:32:21','yyyy-mm-dd hh24:mi:ss'))/12) from dual;

--extract
-- 时间截取
/*
EXTRACT (  
        { YEAR | MONTH | DAY | HOUR | MINUTE | SECOND }  
        | { TIMEZONE_HOUR | TIMEZONE_MINUTE }  
        | { TIMEZONE_REGION | TIMEZONE_ABBR }  
FROM { date_value | interval_value } )  
*/
select EXTRACT(YEAR from sysdate) year,EXTRACT(month FROM sysdate) aS MonTH ,EXTRACT(day FROM sysdate) AS DAY from dual;
--日期转换函数
select to_timestamp('2015/5/8 12:53:25','yyyy-mm-dd hh24-mi:ss') from dual;








