-- 替代变量类似于键盘输入数据的操作
-- 仅仅是为了方便用户查询 管理  


-- 使用 与号表示 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&     77 shift+7
  select * from C##KICKER.users WHERE USER_GRADE =&INPUTGrade;
--
  select * from C##KICKER.users WHERE USER_Status =&InputStatus;
  --单引号问题 字符串 必须在输入时加上引号 或者实现在 '''&input''' 也可以
  select * from C##KICKER.users WHERE USER_Name = &InputStatus;  
  
  
  -- 多个替代变量
    select * from C##KICKER.users WHERE USER_Grade = &InputGrade and USER_STATUS=&INPUTSTATUS ;  
    
 --详细说明: 
      --可以再 groupby orderby 后面使用替代变量
      -- &&长期使用 一次输入后面都使用这个变量
      -- 第一个输入后  第二个不要用输入 直接使用第一个的值
      select * from C##KICKER.users WHERE USER_Status =&&InputStatus;
  
      select * from C##KICKER.users WHERE USER_Name = &InputStatus;  
      -- 解决无法再次输入的问题  undefine  变量名  就可以了
      
      undefine InputStatus;
  
  -- 定义替代变量 define 替代变量名称 =值
   
   select * from users;
   
   define inputName ='''Jxier''';
   define inputGrade =2017;
   select user_grade from users where USER_NAME=&inputName;
   select user_grade from users where USER_GRADE=&inputGrade;
   
   undefine inputName;  --取消替代变量
   undefine inputGrade; --取消替代变量
   
   