 /************************* ------------ - PL/SQL 内部程序块 - ----------- *************************/


-- 例子
declare
   v_i int ;
   v_count int :=1;
   v_outer_name varchar2(20) :='JxKikcer';
begin
    v_i:=2;
    for v_i in 1..10 loop
      dbms_output.put_line('v_i ='||v_i); 
      if v_i mod(5) =0 then
        exit;
      end if;
    end loop;
    v_count:=v_count+1;
    
   declare
      v_inner_age int :=12;
    begin
        DBMS_OUTPUT.PUT_LINE('v_i :'||v_i||' age:'||v_inner_age||' v_count:'||v_count);
    end;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;