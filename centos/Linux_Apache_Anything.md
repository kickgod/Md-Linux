Apache 配置
====
`Apache一个服务器有时候不一定是80端口工作 可以利用其它端口例如8080 8888端口部署网站 也不一定吧网站部署到/var/www/html目录下 有时候我们会单独新建一个用
户将一个网站放在该用户的目录 例如 /home/Apache/www/ 下面用该用户管理网站 而不必一个root用户管理所有事情,而且也不安全`

----
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
----
tt -tnl | grep :80 查看80端口运行状态
### 2.基本信息
* 一般在安装Apache后 会有一个新建一个Apache用户 
* /etc/passwd 下面会多一行 apache:\x:48:48:Apache:/usr/share/httpd:/sbin/nologin
* ps aux | grep httpd 查看运行进程
