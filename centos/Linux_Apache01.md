Linux Apache 安装 - 使用 全默认未配置
=====
`Apache是世界使用排名第一的Web服务器软件。它可以运行在几乎所有广泛使用的计算机平台上，由于其跨平台和安全性被广泛使用，是最流行的Web服务器端软件之一。它快速、可靠并且可通过简单的API扩充，将Perl/Python等解释器编译到服务器中。同时Apache音译为阿帕奇，是北美印第安人的一个部落，叫阿帕奇族，在美国的西南部。也是一个基金会的名称、一种武装直升机等等。`  

-------
###  1. Apache 
* 安装Apache 
```shell
# yum -y install httpd 
# systemctl start httpd 
# systemctl enable httpd 
```
> 默认情况下 网站主目录在/var/www/html/ 下面 所以讲静态网站放在这个目录下  再放一个index.html /index.php就可以当做一个静态网站服务器了
##### 这里我们在阿里云服务器上面放了一个静态的网站 / 也可以在局域网中做  使用dhcp组建一个虚拟局域网也可以
![静态网站页面列表](/Image/listhtml.png)

-----
打开访问设置 防火墙 和http服务
```shell
# sed -ri '/^SELINUX=/cSELINUX=disabled' /etc/selinux/config 
# setenforce 0 
# firewall-cmd --permanent --add-service=http 
# firewall-cmd --permanent --add-service=https 
# firewall-cmd --reload   重启
```
#### 访问测试
> * 在 /var/www/html 放一个index文件
``` html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
   <header>
       <h3>个人主页
           <small>JxKicker</small>
       </h3>
   </header> 
</body>
</html>
```
### 2.PHP
`首先查看 ls /etc/httpd/modules/ |egrep php 有没有一个 libphp5.so的文件  没有安装前是没有的`
* 安装PHP   yum -y install php
* 然后重启http服务 # systemctl restart httpd 
> 添加文件 2.php
```shell
# vim /var/www/html/2.php 
<?php 
phpinfo();
?> 
```
>  然后访问 ip/2.php  
**结果**  
![php版本信息](/Image/phpverison.png)

----
### 3.Mariadb 数据库安装
```shell
# yum -y install mariadb-server mariadb 
# systemctl start mariadb.service 
# systemctl enable mariadb.service  
最开始直接输入 回车
mysql

就可以进入mysql 
设置安全账户
# mysql_secure_installation //提升 mariadb 安全 [可选] 
Set root password? [Y/n]  
New password: 123 
Re-enter new password: 123 

接下来登录 就需要 mysql -uroot -pPassword 了
```
### 4.Php与数据库连接测试
``` php
连接测试代码
# rm -rf /var/www/html/* 
# vim /var/www/html/index.php 
<?php 
$link=mysql_connect('localhost','root','123'); 
if ($link) echo "Successfuly";
else echo "Faile"; 
mysql_close(); 
?>
```
1. 一般如果没有安装php-mysql 数据库连接扩展是无法登录的  
> 安装扩展 ：yum -y install php-mysql  
> 然后重启 ：systemctl restart httpd  
