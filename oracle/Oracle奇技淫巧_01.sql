-- Rank() 函数 生成一个序号  配合 Order by  分区内部排序 

select User_Id,User_Grade,USER_NAME,Rank()  Over(Order by User_ID) rk from users;