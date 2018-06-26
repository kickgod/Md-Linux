-----索引表   类似于程序语言之中的数组  可以保存多个数组
-- 并且可以通过下标访问每一个数据,但是Oracle可以定义索引表下标类型的数据类型是整数也可以是字符串

-- 索引表不需要进行初始化 可以为指定索引赋值 开辟的索引表的索引不一定需要连续
-- 索引表的小标可是是数组也可以是字符串 类似于map
-- 索引下标也可以是负数

type 类型名称 is table of 数据类型 [not null]
index by [pls_integer][binary_integer] [VARCHAR2(长度)]


-- value.EXISTS(key) 判断是否存在数据
set serveroutput on;

declare 
   type info_index is table of varchar(20) 
   index by pls_integer;
   v_info info_index;
   v_length int :=0;  --记录长度 便于遍历
begin
     v_info(1):='你好啊';
     v_length:=v_length+1;
     v_info(2):='他们好';
     v_length:=v_length+1;   
     
     for vars in 1..v_length loop
       if v_info.EXISTS(vars) then
          DBMS_OUTPUT.PUT_LINE(v_info(vars));
       else
          DBMS_OUTPUT.PUT_LINE('数据不存在');
       end if;
     end loop;
end;


-- 键值对
desc  C##KICKER.USERS;
declare 
   type info_index is table of C##KICKER.USERS%rowtype 
   index by pls_integer;
   v_info info_index;
   v_length int :=0;  --记录长度 便于遍历
begin
     v_info(1).User_iD :='你好啊';
     v_info(1).User_Name :='蒋星';
     v_info(1).USER_BIRTHDAY:= To_date('2018-05-06','yyyy-mm-dd');
     v_info(1).USER_GRAde:=10;
     v_info(1).USER_STATUS:=10;
     v_info(1).USER_CLASS:=10; 
     v_length:=v_length+1;
     
     for vars in  1..v_length  loop
       if v_info.EXISTS(vars) then
          DBMS_OUTPUT.PUT_LINE(v_info(vars).User_Name);
       else
          DBMS_OUTPUT.PUT_LINE('数据不存在');
       end if;
     end loop;
end;