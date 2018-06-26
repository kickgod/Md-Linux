/*
使用Student, SC, Course三张表，作存储过程和函数，完成下面的功能：
   用户输入姓名，课程名，成绩，完成对SC表的插入操作，若插入成功，返回成功信息，若插入失败，返回错误信息。
   
   该题目要注意考虑表格之间的关系，由于姓名，课程名和成绩来自于三张不同的表格，而最终要求将数据插入到SC表中，
   因此要先判断姓名和课程名是否正确，然后再将其转换为学号和课程号，同成绩一起插入到SC表格中，若该生已经选择
   了该课程，应该改插入为修改，将该生的该课程成绩改为用户输入的成绩。  
*/

CREATE OR REPLACE Procedure InertIntoSC(s_name varchar2,c_name varchar2,mark number,return_number out number) 
is
    sc_count int :=0;
    s_count int :=0;
    c_count int:=0;
    s_id varchar(40);
    c_id varchar(40);
    shoose_count int:=0;
begin
     select count(*) into s_count from STUDENT where SNAME=s_name;
     select count(*) into c_count from  COURSE where CNAME=c_name;
     
     if s_count<= 0 then
       return_number :=0 ;  ---错误信息: 表示没有此学生
     elsif c_count <=0 then
      return_number :=-1 ;  ---错误信息: 表示没有课程 
     else
         select SNO into s_id  from STUDENT where SNAME=s_name;
         select CNO into c_id from  COURSE where CNAME=c_name;
         
         select count(*) into sc_count from  SC where TRIM(SNO) =TRIM(s_id) and TRIM(CNO)=trim(c_id); 
          
         if(sc_count >0 )then
            update SC set GRADE = mark where TRIM(SNO) =TRIM(s_id) and TRIM(CNO)=trim(c_id); 
         else
            select count(*) into shoose_count from SC where  TRIM(CNO)=trim(c_id); 
            if(shoose_count > 50) then
               return_number :=-10; --错误信息 表示选课已经满了
            else
               insert into SC(SNO,CNO,GRADE) VALUES(s_id,c_id,mark);
               return_number :=1; --信息 表示一切正常
            end if;
         end if;
     end if;       
end;





alter table STUDENT add constraint uq_sname unique(SNAME);
