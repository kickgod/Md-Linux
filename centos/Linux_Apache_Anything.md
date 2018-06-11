Apache 配置
====
`Apache一个服务器有时候不一定是80端口工作 可以利用其它端口例如8080 8888端口部署网站 也不一定吧网站部署到/var/www/html目录下 有时候我们会单独新建一个用
户将一个网站放在该用户的目录 例如 /home/Apache/www/ 下面用该用户管理网站 而不必一个root用户管理所有事情,而且也不安全`

----
### 1.# Apache基础信息
```shell
Apache: www.apache.org 
软件包： httpd 
服务端口: 80/tcp(http) 443/tcp(https,http+ssl) 
配置文件: /etc/httpd/conf/httpd.conf 
/etc/httpd/conf.d/*.conf 
/etc/httpd/conf.d/welcome.conf //默认测试页面
```
