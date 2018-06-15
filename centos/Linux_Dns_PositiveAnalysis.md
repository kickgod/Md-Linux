DNS正向解析
====
* `正向区： 提供正向解析，即将域名解析为 IP`
* `反向区： 提供反向解析，即将 IP 解析为域名 [了解]`
#### 1.配置文件 加上zone 区域 

#####  named.conf 详解
```
=> 表示需要改成后面的

option区段：对named的基本设置，影响整个服务器的运作: 
 
//指定在地址127.0.0.1上面的53端口提供服务,默认为53.
 listen-on port 53 { 127.0.0.1; }; => { any; };
 directory  "/var/named"; //设定工作目录 //指定哪个服务器可以进行普通DNS查询  
 allow-query     { localhost; };  => { any; }; 
 recursion yes;  //控制是否开启服务器的递归查询功能 
 dnssec-enable yes; //安全设置，默认为yes。 => no  
 dnssec-validation yes; //安全设置，默认为yes。 => no
 
```
-----
> 例如 Wang.com这个域 就如同把树枝com下面的Wang分支给了这个DNS服务器管理 以此可以出现 Ftp.Wang.com www.Wang.com  mail.Wang.com
----
* 这里解析一个域 Wang.com
```vim
 vim /etc/named.conf  
 options {
  ...
  directory "/var/named"; //数据库文件存储位置 域文件应该放到这个文件夹里面 
  ....
 }; 
 #添加这个域
 zone "wang.com" {
    type master;   /*主分支*/ 
    file "wang.com.zone";
 }; 
 /* 注意分号 */
 /* 文件名称一般 域名称.zone 表示为一个域名数据库文件 也可以取其他名称 这个只是约定 不需要强制遵守 这样写显得易于区分*/
```
#### 2.添加域数据库文件
> 这个数据文件必须添加到var/named里面
```
 vim /etc/named/wang.com.zone
 第一行 @ 代表: wang.com. @  IN  SOA  dns root ( 20180615001H 15M 1W 1D )
 
 #注意空格隔开
 
 将wang.com.这个域 in(internal) 授权给DNS 有事情发邮件给root 后面是版本号 
 用于主从DNS之间的信息同步 2018061500 一时 15分钟 1周 1天
 
 2018061511 :十位以内  00表示可以改99次 每天 版本号 用于主从服务器同步 辅助服务器发现自己的版本号和主服务器的版本号 
 不一样就同步一次 发生改变就加1
 
 1H 主从每隔一小时后同步一次
 
 15M 如果同步不成功 那么15分钟后再来
 
 1W 如何重试都一周了 不成功 那就放弃了
 
 1D 缓存时间
 
 
 @ 表示当前域名 www.wang.com. = www  第一个字段继承  
 
 SOA: 起始授权记录 强制 
 NS: DNS 服务器记录 强制 
 A: 主机记录 
 CNAME: 别名记录
```
------
#### 4.添加内容 
``` text

@     IN    SOA   dns   root ( 2018061511 1H 15M 1W 1D )
@     IN    NS    dns  
dns   IN    A     192.168.56.101
www   IN    A     192.168.56.102
Lab   IN    A     192.168.56.103

A 表示Address Ip地址
WWW 代表 www.wang.com 可以简写

一行的解释:www.wang.com 在internal[网络中] 的Ip地址[Address]  为 192.168.56.101
```

