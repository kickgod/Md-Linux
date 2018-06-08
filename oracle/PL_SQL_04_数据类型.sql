/*********** --------------- PL/SQL 简介 -------------- *************/
-- 四种数据类型
/*
  1.标量类型 字符串 数字 日期 布尔
  2.复合类型 记录类型 嵌套类型 索引表 可变数组
  3.引用类型 用于只想另一不同的对象 例如:REF CURSOR ,REF
  4.LOB 大数据类型 最多存储4G的信息二进制数据
*/  
  --NUMBER(3) 最对三位整数
  --NUMBER(5,2) 三位整数  两位小数
  -- PLS_NUMBER()
  -- 一张图
declare
   
begin
   
   dbms_output_put_line(Binary_DOUBLE_max_normal);
   
   
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;