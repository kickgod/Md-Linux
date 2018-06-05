select User_Grade,Count(*)  OVER (partition by User_Grade)sum  from C##Kicker.users;


desc users;
/*
USER_ID       NOT NULL VARCHAR2(20) 
USER_NAME     NOT NULL VARCHAR2(40) 
USER_BIRTHDAY          DATE         
USER_GRADE             NUMBER(38)   
USER_STATUS            NUMBER(38)   
*/

-- 默认为 一整个分区
select User_Grade,Count(*)  OVER ()sum  from C##Kicker.users;

-- Order by  分区内部排序 
/* 子选项*/
-- NULLS FIRST 出现空值 排在前面
-- NULLS LAST  出现空值 排在后面

select User_ID,USER_GRADE,Rank() OVER(PARTITION BY USER_GRADE Order by USER_ID desc) from users;

select User_ID,USER_GRADE,Rank() OVER(PARTITION BY USER_GRADE Order by USER_ID desc ) from users;










