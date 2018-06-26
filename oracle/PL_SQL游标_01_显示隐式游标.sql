/*********** --------------- PL/SQL 游标01 -------------- *************/

-- 游标对性能的要求较为高,当时候大量数据的时候请勿使用游标,会占用大量内存
-- 分类
    /*
      静态游标
          1.隐式游标:所有的DML语句为隐式游标,通过隐式游标属性可以获取SQL语句信息
             --在PL/SQL块中所编写的每条sql语句实际上都是隐式游标.通过DML操作之后使用
               "SQL%ROWCOUNT" 属性,可以知道语句锁改变的行数（INSERT,UPDATE，DELETE）
                SELECT返回查询改变的行数
          2.显示游标:用户显示声明的游标,即指定结果集合.当查询返回结果炒货一行时,就需要一个显示游标
      REF游标 
          动态关联结果集的临时对象
    */
/* 隐式游标属性 ： %FOUND 当用户使用DML操作数据时返回TRUE
                 %ISOPEN 判断游标是否打开 对于任何的隐式游标总是返回false 表示已经打开
                 %NOTFOUND 如果执行DML操作 没有返回数据行 返回true 否则false
                 %ROWCOUNT 返回处理行数
*/    
--"SQL%ROWCOUNT"
set serveroutput on;    
declare
   v_Count number;
begin
   select count(*) into v_Count from users;
   DBMS_OUTPUT.PUT_LINE('SQL%ROWCOUNT:'||SQL%ROWCOUNT);
   --刚好 1行
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;
   
   
declare
   
begin
   update users set USER_CLASS=15;
   DBMS_OUTPUT.PUT_LINE('反应更新了多少行:-- 属性 SQL%ROWCOUNT:'||SQL%ROWCOUNT);
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;   

ROLLBACK;   


---- 显示游标
 --创建一个显示游标
 /*
    cursor 游标名称[(参数列表)][return 返回类型]
      is 子查询
    [for update of 数据列][NOWAIT] 
    使用 Open打开游标 Close 关闭游标
    使用 Fetch  游标  into RowType变量 取得数据
    
    --默认情况下 游标在第一行之上
 */
 
 --声明游标 取得第一行数据
 declare
   cursor userinfo is select * from users;
   User_row Users%RowType;
begin
   if userinfo%isopen then
        null;
   else
        open userinfo;
   end if;  
   Fetch userinfo into User_row;  
   DBMS_OUTPUT.PUT_LINE('第一行数据：'||User_row.User_Name);   
   Close userinfo;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

--遍历游标 利用while
declare
   cursor userinfo is select * from users;
   User_row Users%RowType;
begin
   if userinfo%isopen then
        null;
   else
        open userinfo;
   end if;  
   fetch userinfo into User_row;
   while userinfo%Found loop
      DBMS_OUTPUT.PUT_LINE('第一行数据：'||User_row.User_Name||' '||User_row.User_id);
       fetch userinfo into User_row;
   end loop;  
   close userinfo;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

--遍历游标 利用LOOP
declare
   cursor userinfo is select * from users;
   User_row Users%RowType;
begin
   if userinfo%isopen then
        null;
   else
        open userinfo;
   end if;  
   fetch userinfo into User_row;
   loop
       fetch userinfo into User_row;
       EXIT WHEN userinfo%NOTFound;
       DBMS_OUTPUT.PUT_LINE('第一行数据：'||User_row.User_Name||' '||User_row.User_id);
   end loop;  
   close userinfo;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

--遍历游标 利用for
declare
   cursor userinfo is select * from users;
   User_row Users%RowType;
begin
       FOR User_row in userinfo loop
       DBMS_OUTPUT.PUT_LINE('第一行数据：'||User_row.User_Name||' '||User_row.User_id);
       end loop;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;
--遍历游标 利用for 不需要游标的遍历 直接把sql语句当做游标
declare
   User_row Users%RowType;
begin
       FOR User_row in (select * from users) loop
       DBMS_OUTPUT.PUT_LINE('第一行数据：'||User_row.User_Name||' '||User_row.User_id);
       end loop;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;







   