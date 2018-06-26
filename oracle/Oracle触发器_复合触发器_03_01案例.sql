ALTER table C##Mydbadmin.STUDENT ADD ( sum_avg NUMBER DEFAULT 0); 
set serveroutput on  ;
create or replace trigger MydbAdmin_updateSum
FOR insert or delete or update on C##Mydbadmin.sc
COMPOUND TRIGGER  
  type Student_Array is table of varchar(40) not null
  index by pls_integer;
  lists Student_Array;
  lists_length int;
  SumCount number :=0;
BEFORE STATEMENT IS
begin
   lists_length :=0;
END BEFORE STATEMENT;
AFTER EACH ROW IS
BEGIN
  if inserting then 
    lists(lists_length):= :new.SNO;
     lists_length :=lists_length+1;
  else 
    lists(lists_length):= :old.SNO;
    lists_length :=lists_length+1; 
  end if;
END AFTER EACH ROW;
after statement is
begin
   for vars in  0..lists_length-1  loop
       if lists.EXISTS(vars) then       
          select sum(GRADE) into SumCount from SC where SNO=lists(vars);         
          DBMS_OUTPUT.PUT_LINE(lists(vars)||SumCount);
          update Student set SUM_AVG = SumCount where   SNO=lists(vars);        
       else
          DBMS_OUTPUT.PUT_LINE('数据不存在');
       end if;
   end loop;   
end after statement;
end;


