Linxu DHCP 动态主机配置协议配置
---
#### 0.简单介绍
* 1. DHCP 是 TCP／IP协议簇 中的一种  
* 2. DHCP 是一个 局域网 的网络协议，使用 UDP协议 工
详解: [`DHCP工作原理`](https://www.cnblogs.com/happygirl-zjj/p/5976526.html)
#### 1.安装DHCP Linxu
* 使用yum 安装 `yum -y install dhcp`
* IPV4配置文件位置:`/etc/dhcp/dhcpd.conf` 
* IPV6配置文件位置:`/etc/dhcp/dhcpd6.conf` 
* 租约数据库文件  : /var/lib/dhcpd/dhcpd.leases
* 使用Dhcp 主机网络管理器 下面DHCP服务器 
#### 2.配置DHCO
* 配置模型文件: `/usr/share/doc/dhcp*/dhcpd.conf.example`  *: 是版本号
* `参数解析 `
```shell
 default-lease-time 600          :定义默认IP租约时间,以秒为单位的租约时间  超过时间可以续约 续约上了继续连接  续不上
                                 找别的dhcp服务器 退租需要发DHCPRELESE命令
 
 max-lease-time 7200             :定义客户租约时间的最大值,用户超过租约时间,缺尚未更新Ip时,最长可以使用该IP的时间
 
                                 例如:主机1 中途关机了 时间超过600秒后,服务器会暂时在7200秒内保留此主机1Ip地址,
                                  不会分给其他机器。超过7200秒后 再分配给其他机器
 log-facility local7             :定义日志类型
 
option routers Ip 地址            :为客户端指定默认网管

option domain-name-server IP 地址 :为客户端指定DNS服务器地址 

 subnet 网络号 netmask 子网掩码 {  :定义为客户端分配的IP地址池等等有时候服务启动出错 就是应为地址不匹配问题
    选项与参数                      网络号必须与DHCP服务器的网络号相同
 }
 
 ----以局部参数为主-----------------------
 
 ```
 #### 3. 参数简记----`网络号必须与DHCP服务器的网络号相同`
----
*  `ddns-update-style`：配置DHCP-DNS 互动更新模式 

* `default-lease-time`：指定默认地址租期 
 
* `max-lease-time`：指定最长的地址租期 
 
* `hardware`：指定硬件接口类型及硬件地址 
 
* `fixed-address`：为DHCP客户指定IP地址 
 
* `filename`：指定启动时载入的初始启动文件 
 
* `next-server`：指定初始启动文件存放的主机 
 
* `domain-name`：为客户指明DNS名字 

* `domain-name-servers`：为客户指明DNS服务器的IP地址 
 
* `host-name`：为客户指定主机名 
 
* `time-offset`：为客户设置与格林威治时间的偏移时间（秒） 
 
* `ntp-servers`：为客户设置网络时间服务器的IP地址 
 
* `routers`：为客户设置默认网关 
 
* `subnet-mask`：为客户设置子网掩码 
 
* `broadcast-address`：为客户设置广播地址 
---- 
```shell
（1）range 其实IP 地址 结束IP 地址

     作用:指定动态Ip 地址范围 
     注意:可以在subnet定义多个range 但是多个range定义的Ip范围不能重复
     
    subnet 10.5.5.0 netmask 255.255.255.224 {
      range 10.5.5.26 10.5.5.30; 地址范围
      option domain-name-servers ns1.internal.example.org; DNS服务器
      option domain-name "internal.example.org"; 域名
      option routers 10.5.5.1; 网管
      option broadcast-address 10.5.5.31; 广播地址
      default-lease-time 600; 租约时间
      max-lease-time 7200;   最大租约时间
    }
```
#### 4.实验环境 
* 无法桥接     需要一个干净的服务器  桥接就会产生一个DHCP服务器了
* VS Box 使用同名的内部网络 或者主机Host-only 但不启动DHCP服务器说
```
示例  要求：

1、主机地址：192.168.1.100 

2、分配地址：192.168.1.110 – 192.168.1.120 

3、为一台主机(DNS服务器)单独分配地址192.168.1.200(主机名: dns-server mac: 00:A0:78:8E:9E:AA) 

4、假设DNS服务器域名为:  www.baidu.com  5、默认地址租约：1小时  最长地址租约：1天 

```
