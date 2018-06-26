/*
  在Oracle之中每一个session都拥有独立的食物,而在一个事务处理过程中都会执行一系列的SQL更新操作，
  这些都受到一个整体的事务控制,其他用户如果需要操作则必须在执行Commit或者rollback之后才可以
  但是如果现在在子程序之中则需要进行独立的子事务处理 并且可以在子事务中使用COMMit 和RollBack不影响整体主
  事务那么需要自治事务进行控制。
 */

declare
   -- 此时 主事务被挂机
   pragma autonomous_transaction; --开启自治事务
begin
   insert into SC VALUES('005','C09',98);
   commit; --提交自治事务 不属于主事务
   -- 或者 rollback 都不会影响主事务
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- 从system用户看已经看到数据