 /**************  统计函数  ******************/
 -- COUNT /SUM /AVG /MAX /MIN /median /Variance /Stddev

 -- median 返回中间值
 -- variance 英文  方差
 -- Standard deviation 标准差
  desc dba_tablespaces;
  desc DBA_USERS;
 -- 返回中间值
  select median(user_id) from DBA_USERS;
 -- 返回方差
  select Variance(user_id) 方差 from DBA_USERS;
  select STDDEV(user_id) 标准差 from DBA_USERS;