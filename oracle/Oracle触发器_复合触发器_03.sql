/*
 复合触发器是在:Oracle 11g之后引入进来的一种新结构的触发器,复合触发器即是
 表级触发器又是行级触发器.目的是 减少编写当一个表需要before after 不同级别
 四个触发器时,能够集成一个触发器.
*/
---- 复合触发器可以捕获的4个操作事件
/*
  触发执行语句之前（BEFORE STATEMENT）；
  触发语句中的每一行发生变化之前（BEFORE EACH ROW）；
  触发语句中的每一行发生变化之后（AFTER EACH ROW）；
  触发执行语句之后（AFTER STARTEMENT）

*/ 

--- 复合触发器就像一个多线程的进程操作，可以同时处理多个不同的事件；
--- 在复合触发器中的最小实现要求定义至少一个事件处理块，并且只有DML能触发复合触发器工作；

 --语法: Compound ：复合
/*
CREATE [OR REPLACE] TRIGGER 触发器名称
FOR [INSERT | UPDATE | UPDATE OF 列名称 [,列名称,....] | DELETE] ON 表名称
COMPOUND TRIGGER
 变量 类型  ....
 变量 类型  ....
[BEFORE STATEMENT IS --语句执行前触发（表级）
[声明部分;]
BEGIN
程序主体部分;
END BEFORE STATEMENT;]
[BEFORE EACH ROW IS --语句执行前触发（行级）
[声明部分;]
BEGIN
程序主体部分;
END BEFORE EACH ROW;]
[AFTER STATEMENT IS --语句执行后触发（表级）
[声明部分;]
BEGIN
程序主体部分;
END AFTER STATEMENT;]
[AFTER EACH ROW IS --语句执行后触发（行级）
[声明部分;]
BEGIN
程序主体部分;
END AFTER EACH ROW;]
END;
/
*/















