Apache 配置
==== 
`Apache一个服务器有时候不一定是80端口工作 可以利用其它端口例如8080 8888端口部署网站 也不一定吧网站部署到/var/www/html目录下 有时候我们会单独新建一个用
户将一个网站放在该用户的目录 例如 /home/Apache/www/ 下面用该用户管理网站 而不必一个root用户管理所有事情,而且也不安全`

----
>尽量不要用大写命名 操作起来麻烦 
### 1.Apache基础信息
```shell
Apache: www.apache.org 
软件包： httpd 
服务端口: 80/tcp(http) 443/tcp(https,http+ssl) 
配置文件: /etc/httpd/conf/httpd.conf 
/etc/httpd/conf.d/*.conf 
/etc/httpd/conf.d/welcome.conf //默认测试页面
```
#### Apache文件目录
![Apache文件目录](/Image/ApacheDirectionary.png)
##### 日志文件
> 查看日志  :ls /etc/httpd/log  下面有两个日志文件 access_log error_log 访问日志和错误日志  
> 日志文件  :cd /var/log/httpd/ 下面 access_log error_log
##### 重要的配置文件 /etc/httpd/conf/http.conf
##### 一般都在这个文件夹里面配置 /etc/httpd/conf/http.conf 查看和编辑内容
#####  vim /etc/httpd/conf/httpd.conf
##### ServerRoot "/etc/httpd" //安装目录  不要去随便改变
##### Listen 80 //监听端口 
##### IncludeOptional conf.d/\*.conf //包含 conf.d 下的*.conf 文件 
##### User apache //运行 Apache 的用户 
##### Group apache //运行 Apache 的用户组 
##### DirectoryIndex index.html index.php //设置默认主页 
##### DocumentRoot //站点默认主目录
```conf
<Directory "/var/www"> Apache访问控制
   AllowOverride None
   # Allow open access;
   Require all granted
<Directory>
```   
----
tt -tnl | grep :80 查看80端口运行状态
### 2.基本信息
* 一般在安装Apache后 会有一个新建一个Apache用户 
* /etc/passwd 下面会多一行 apache:\x:48:48:Apache:/usr/share/httpd:/sbin/nologin
* ps aux | grep httpd 查看运行进程
### A. 配置一个主机多个网站 不同端口
`在一个主机上面通过不同端口 放置网站 这里我们使用`[虚拟主机技术](https://baike.baidu.com/item/%E8%99%9A%E6%8B%9F%E4%B8%BB%E6%9C%BA/208420)`配置文件信息 可以直接写在httpd.conf中 也可以不直接写在httpd.conf中 在/etc/httpd/conf/httpd.conf 中的最后一行 IncludeOptional conf.d/*.conf 是一句包含信息 可以把你的配置文件写在一个任意名字.conf的配置文件里面 apache会自动包含到httpd.conf里面 例如我们要部署一个小说网站，网站名称叫做奇闻中文网,那么我们在/etc/httpd/conf.d 西面新建一个 QiWen.conf的配置文件`
#### 1.准备网站-环境  
* 下载地址： [网站-静态网站](https://codeload.github.com/kickgod/Windows/zip/master)
* 配置环境： LAMP下载: yum -y install httpd mariadb-server mariadb php php-mysql gd php-gd 
#### 2.上传网站到服务器上面 
> * mkdir -p  /Web/QiWem/ 新建文件夹
> * yum -y install unzip 然后利用Xftp上传自己的网站  解压 unzip[没有的安装] 
> * unzip /root/Windows-master 先上传到 /root 目录下  然后解压 重命名  mv Windows-master www
> * cp -r /root/www  /Web/QiWem/www 复制 到目录下
> * chmod -R 777 /Web/QiWem/ 放开权限使得其他人可以访问   篮字绿底文件表示任何人都可以读写
#### 3.配置文件
* `vim /etc/httpd/conf.d/QiWen.conf` 新建配置文件
``` shell
<Directory "/Web/qiwen/www">
 Options Indexes FollowSymLinks
 AllowOverride all
 Require all granted
</Directory>
Listen 8080
<VirtualHost *:8080>
  DocumentRoot "/Web/qiwen/www"
</VirtualHost> 

```
* `httpd -t 检查是否错误  Syntax OK表示配置正确 测试后发现  <virtualHost> 下面的应该改成  </VirtualHost>`
* `systemctl restart httpd` 需要重启Apache
#### 4.关闭防火墙 允许外网访问
```shell
# sed -ri '/^SELINUX=/cSELINUX=disabled' /etc/selinux/config 
# setenforce 0 
# systemctl stop firewalld.service  
# systemctl disable firewalld.service 
```
#### 5.测试连接  [奇闻网](http://39.108.83.255:8080/) 在我的服务器上面运行正确
-----
### B. IP地址不相同,端口号相同(默认端口号)
```
#nmcli #命令 查看自己的网卡 名称 假如是 enp03

#nmcli con modify enp03s +ipv4.address 192.168.240.200/24  增加一个ip地址 

#ip addr 查看自己的网卡 是否新增加一个ip地址

#然后重启网卡生效 systemctl restart network 

#尝试在另一台主机ping通

在/etc/httpd/conf.d/ 下面新建一个conf文件 内容如下

 #目录随意 开放访问权限就行 
 <Directory "/home/crs/www">  
    Options Indexes FollowSymLinks
    AllowOverride all 
    Require all granted   
 </Directory> 
 
 #目录随意 开放访问权限就行
 
 <Directory "/home/crs/www_2">  
    Options Indexes FollowSymLinks 
    AllowOverride all 
    Require all granted   
 </Directory>
 
  #指定主机 不一定是80端口 也可以监听其他端口
 
  <VirtualHost 192.168.240.132:80> 
  DocumentRoot "/home/crs/www"  
  ServerName www.ibm.com   
  </VirtualHost>   
  
  <VirtualHost 192.168.240.200:80>  
  DocumentRoot "/home/crs/www_2" 
  ServerName www.ibm.com   
  </VirtualHost> 
 --------------------------------------
 然后重启A systemctl restart httpd
 其他和A 一样 第三部按照此进行就行  新建两个网站目录而已
```
-----
### C. 为服务器用户建立个人目录 
#### 1.用户设置 网站内置
*  `新建一个用户 #useradd student`
*  `cd /home/student`
* `#mkdir www  新建目录`
*  `vim www/index.html`   
```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8"/>
  </head>
  <body>
     <h2>
       This is Main Page of Student
     </h2>
  <body>
</html>
```
#### 修改权限
* chmod 755 /home/crs 
* chmod 755 /home/crs/www 
* chown crs:crs /home/crs/www
#### 配置文件
 `可以在conf.d目录下面新建一个 也可以在httpd.d里面直接添加 下面直接添加  添加前 先备份`
 ##### 备份
 #cd  /etc/httpd/conf  
 #cp httpd.conf  httpd.conf.bak  
 ``` text
Alias /crs "/home/crs/www"  
<Directory "/home/crs/www">  
 AllowOverride None 
 Options None 
 Require all granted 
</Directory>
 ```
 * systemctl restart httpd 重启
#### 防火墙设置
#systemctl stop firewalld  
#临时关闭,设置SELinux 为permissive模式  
#setenforce 0  
 
















