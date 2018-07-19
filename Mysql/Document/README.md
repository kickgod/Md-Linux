Mysql 数据库学习笔记
----
> 初次安装数据库 修改密码: `update user set password=PASSWORD('root') where user='root';`  
> 如果报错: `You must reset your password using ALTER USER statement before executing this statement.`  
> 那么执行: `ALTER USER 'root'@'localhost' IDENTIFIED BY 'new password'`;

