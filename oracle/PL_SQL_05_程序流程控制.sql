 /************************* ------------ - PL/SQL 流程控制 - ----------- *************************/
/* if流程控制
  if condition then
     null;
   end if;
   
   if condition then
    null;
   elsif  condition then
    null;
   else 
    null;
   end if;
   
  if condition then
     null;
   else
     null;
   end if;
*/
set serveroutput on;
declare
   v_age int:=&input_your_age;
begin
  
     if v_age >18 then
     dbms_output.put_line('你是一个成年人了！');
     else
     dbms_output.put_line('你还小!');
     end if;
  /*************************************************/   
     if (v_age!=18) then
        dbms_output.put_line('但是你不是十八岁');
     elsif v_age<0 then
        dbms_output.put_line('不还没有出生呢!');
      else 
        dbms_output.put_line('你的年龄是:'||v_age);
      end if;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

/*
  case [变量] 
     when 值|表达式 then
        执行语句块;
     when 值|表达式 then
        执行语句块;
     when 值|表达式 then
        执行语句块;
     else
        其他语句;
  end case;
*/

declare
   val_color int :=32;
begin
   -- 变量case
   case val_color 
      when 31 then
         DBMS_OUTPUT.PUT_LINE('你的颜色是:黑色');
      when 32 then
         DBMS_OUTPUT.PUT_LINE('你的颜色是:白色');
      when 33 then
         DBMS_OUTPUT.PUT_LINE('你的颜色是:蓝色');
      when 34 then
         DBMS_OUTPUT.PUT_LINE('你的颜色是:黄色');
      when 35 then
         DBMS_OUTPUT.PUT_LINE('你的颜色是:光色');
      when 36 then
         DBMS_OUTPUT.PUT_LINE('你的颜色是:暗色');
      else
         DBMS_OUTPUT.PUT_LINE('不知道你的属性值');
    end case;
    
   -- 表达式case
   case  
      when val_color > 30 and val_color < 40 then
         DBMS_OUTPUT.PUT_LINE('你的颜色值是合格的!');
      when val_color < 30 then
         DBMS_OUTPUT.PUT_LINE('你的颜色值太小了!无法显示');
      when val_color >=40 then
         DBMS_OUTPUT.PUT_LINE('你的颜色太过强烈!');
      when val_color =35 then
         DBMS_OUTPUT.PUT_LINE('你的颜色是最完美的!');
      else
         DBMS_OUTPUT.PUT_LINE('不知道你的属性值');
    end case; 
    
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- 循环结构  Loop For 循环

/*
  Loop 
    循环执行的语句块;
    EXIT WHEN 循环结束条件;
    循环结束条件修改;
  End Loop
  
  While(condition) Loop
    循环体执行的语句块;
    循环结束的条件修改
  END Loop  
  
*/
declare
   v_loop_count int :=1;
begin 
   ---Loop循环
   Loop 
      DBMS_OUTPUT.PUT_LINE('你好啊! 已结循环'||v_loop_count||'次了!');
      v_loop_count:=v_loop_count+1;
      exit when v_loop_count>10;
   end loop;   
     v_loop_count:=1;
  
   DBMS_OUTPUT.PUT_LINE('/*********循环重新开始使用 while***********/');
  
   while v_loop_count<=10 Loop
      DBMS_OUTPUT.PUT_LINE('你好啊! 已结循环'||v_loop_count||'次了!');
      v_loop_count:=v_loop_count+1;
   end loop;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;


/*
 
 for 循环索引in 循环区域下限 ..循环区域上限 loop
    循环执行的语句块;
 End Loop;
 

*/
  declare
     v_val int :=1;
  begin
     for v_val in  1..5 loop
        DBMS_OUTPUT.PUT_LINE('你好啊! 已结循环'||v_val||'次了!');
     end loop;
     
     DBMS_OUTPUT.PUT_LINE('/********************/');
     
     for v_val in reverse  1..5 loop
        DBMS_OUTPUT.PUT_LINE('你好啊! 已结循环'||v_val||'次了!');
     end loop;
         
     Exception when others then
        DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
  end;

/*
  exit;
  continue;
  Goto;  <<endpoint>>  goto endpoint;
*/