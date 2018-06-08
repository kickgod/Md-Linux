-- A  字符串连接的错误
  remark_info_op:='用户:'||user_id+ '操作类型:delete';
  
  dbms_output.put_line('上面你看到没有 字符串连接要用||不要用+ 号!')
  
/*
 错误报告 -
SQL 错误: ORA-06502: PL/SQL: 数字或值错误 :  字符到数值的转换错误
ORA-06512: 在 "C##KICKER.CHANGE_TB_RECORD", line 33
ORA-04088: 触发器 'C##KICKER.CHANGE_TB_RECORD' 执行过程中出错
06502. 00000 -  "PL/SQL: numeric or value error%s"
*Cause:    An arithmetic, numeric, string, conversion, or constraint error
           occurred. For example, this error occurs if an attempt is made to
           assign the value NULL to a variable declared NOT NULL, or if an
           attempt is made to assign an integer larger than 99 to a variable
           declared NUMBER(2).
*Action:   Change the data, how it is manipulated, or how it is declared so
           that values do not violate constraints.
 */


-- B orale不支持 * 号前面增加一个字段 只能够  select '四川省' Province ,User_ID from USERS

   select '四川省' Province ,* from USERS;

-- C 动态SQL 必须结尾不能使用; 不然会报错!
  
  
-- D 空操作 如果语句块什么都不写  可以使用null;
  begin
    null;
  end;

-- E  此表达式的类型声明不完整或格式不正确 原因:名称写错了