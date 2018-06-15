DNS（Domain Name System，域名系统）
=====
> 在TCP/TP 网络中有非常重要的地位,能够提供域名和IP地址解析的解析服务  

---
`DNS 是一个分布式数据库,命名系统采用层次的逻辑结构,如同一颗倒置的树,这个逻辑的树形结构为域名空间由于DNS划分了域名空间,所有各个机构可以使用自己的域名空间创建
DNS信息`
<br/><br/>
`百度百科解释:，万维网上作为域名和IP地址相互映射的一个分布式数据库，能够使用户更方便的访问互联网，而不用去记住能够被机器直接读取的IP数串。
通过域名，最终得到该域名对应的IP地址的过程叫做域名解析（或主机名解析）。DNS协议运行在UDP协议之上，使用端口号53。在RFC文档中RFC 2181对DNS有规范说明，
RFC 2136对DNS的动态更新进行说明，RFC 2308对DNS查询的反向缓存进行说明。`  

----
**`注:域名空间中,数的最大深度不得超过127层,树的每一个节点最长可以存储63个字符`**
### 一.名字解析
[NetBios ](https://baike.baidu.com/item/NETBIOS/611263?fr=aladdin)名称:baidu localhost `NETBIOS协议是由IBM公司开发，主要用于数十台计算机的小型局域网 已淘汰`  
[FQDN ](https://baike.baidu.com/item/FQDN/5102541?fr=aladdin) 完全限定域名:www.baidu.com  baidu.com
> `今天所用都是完全限定[结构]域名`
### 二.hosts文件 
* `作用： 实现名字解析，主要为本地主机名、集群节点提供快速解析`
* `数据库： 平面式结构，集中式数据库`
* `Windows hosts文件位置:C:\Windows\System32\drivers\etc\`
* `Linux CentOS hosts文件位置:/etc/hosts`
> 可以修改那么在一个局域网中可以自己拥有域名。绑定任意Ip 
### 三.DNS域名服务器
```
作用： 实现名字解析（例如将主机名解析为 IP） 命名空间 name space： 用于给互联网上的主机命名的一种机制 
 
DNS 数据库 Datebase： 层次化的，分布式的数据库 
 
权威名称服务器： 存储并提供某个区域的实际数据，例如 126.com 的 DNS 服务器，记录了 126.com 域中 所有主机的记录如：
www.126.com. x.x.x.x ftp.126.com. y.y.y.y 

注册授权域名:到网上买的 接受备案 互联网唯一的 直接了当 
 
权威名称服务器类型包括： Master: 主 DNS 服务器，包含原始区域的数据 Slave: 备份 DNS 服务器，通过（区域传输）从 Master 
服务器获得区域数据的副本 

在自己的局域网里面跑的域名:跑在自己的网络里面
 
非权威名称服务器： 不存储某个区域的实际数据，仅缓存 DNS 服务器，虽然可以提供查询，但查询的内 容不具有权威
```
### 四.DNS 解析流程： 
```
例如客户端解析 www.126.com 
1. 客户端查询自己的缓存（包含 hosts 中的记录），如果没有将查询发送/etc/resolv.conf 中的 DNS 服务器 

2. 如果本地 DNS 服务器对于请求的信息具有权威性，会将（权威答案）发送到客户端。 

3. 否则（不具有权威性），如果 DNS 服务器在其缓存中有请求信息，则将（非权威答案）发送到客户端  

4. 如果缓存中没有该查询信息，DNS 服务器将搜索权威 DNS 服务器以查找信息：

a. 从根区域开始，按照 DNS 层次结构向下搜索，直至对于信息具有权威的名称服务器，为客户端获答案 DNS 服务器将信息传递给客户端 ，

并在自己的缓存中保留一个副本，以备以后查找。 
b. 转发到其它 DNS 服务器 

``` 
![DNS解析图片](/Image/DNS.png)
### 五.Cache Only DNS服务器 Hosts文件
> 惟缓存服务器: 不提供正向逆向地址解析,只是提供解析缓存,例如某个主机第一次访问www.wangzhe.com，本地没有地址,询问DNS服务器,然后DNS服务器查询自己或者询问其他的DNS服务器,得到地址后返回给客户机,然后自己缓存一份地址,下一次客户机再次访问www.wangzhe.com的时候,就可以快速查询缓存,解析速度更快
#### 1. 测试 `[使用虚拟机]`
* Virtual Box 启动两台服务器 一台Server 一台Client 

* Server 先安装Tcpdump [| tcpDump 简介](https://www.cnblogs.com/f-ck-need-u/p/7064286.html) [tcpDump 详解 |](https://www.cnblogs.com/tingyuxuanzhuzi/p/6906199.html)----抓包工具 `两个都安装保险一点`

* 管理里面 启动主机网络管理器 启动DHCP  然后两台主机 设置网络为 host-only 组件成为一个局域网

![主机管理](/Image/DHCP_Host_only.png)
``` shell
 这里我们会用到两条命令
 
 1.dump -i wangkaName -nn host 192.168.56.101 抓取主机和192.168.56.101的Tcp UDP通信信息
 
 2.dump -i wangkaName -nn port 53 抓取端口53的Tcp UDP通信信息
 
 wangkaName： 
 tcpdump -D 查看 下面第一行
```
> 如果发现配好了 不生效  请systemctl restart network

* 启动好后

* 修改客户机 client 的 /etc/resolv.conf 增加下面一行  其他的都注释掉 
> nameserver server_IP `IP 为域名机 地址`
-----
* 然后修改Server etc/hosts文件 增加一行  
> 192.168.56.110 www.baidus.com
------------
* 然后两边重启
systemctl restart network
------
* client 去 ping  www.baidus.com
* server 去 tcpdump -i enp0s3 -nn port 53 然后可以看到服务器想DNS请求域名解析的信息了
* yum -y install bind bind-chroot  安装DNS服务
* vim /etc/named.conf
``` shell

#改成any 记住 
options { listen-on port 53 { any; }; 
listen-on-v6 port 53 { any; }; 
directory "/var/named"; 
dump-file "/var/named/data/cache_dump.db";
statistics-file "/var/named/data/named_stats.txt";
memstatistics-file "/var/named/data/named_mem_stats.txt"; 
allow-query { any; }; 
#重新启动 
[root@aliyun ~]# systemctl restart named 
[root@aliyun ~]# systemctl enable named 
#查询端口 
[root@aliyun ~]# ss -tuln |grep :53 |column -t udp
UNCONN 0 0 114.215.71.214:53 *:* 
udp UNCONN 0 0 10.29.89.165:53 *:* 
udp UNCONN 0 0 127.0.0.1:53 *:* 
udp UNCONN 0 0 :::53 :::* 
tcp LISTEN 0 10 114.215.71.214:53 *:* 
tcp LISTEN 0 10 10.29.89.165:53 *:* 
tcp LISTEN 0 10 127.0.0.1:53 *:* 
tcp LISTEN 0 10 :::53 :::* 
```
yum -y install bind-utils

```
查看 DNS 服务主配置文件
[root@aliyun ~]# vim /etc/named.conf 根提示区域 [默认] 

var/named 文件夹里面

directory       "/var/named"; 存放了全球十三个顶级域名

 
DNS 转发 Forward [通常转发到上一级的 DNS 服务器] 
options { 
... forwarders{ 114.114.114.114; 202.106.0.20; }; 
};
```
