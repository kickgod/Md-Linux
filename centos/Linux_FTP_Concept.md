FTP 文件传输服务
-----
`FTP(File Transfer Protocol)`, 中⽂文为 “⽂文件传输协议” 是一种在互联网上进行文件传输的协议, 用于 在Internet上控制文件的双向传输。
FTP是一个应用程序, 基于客户端/服务器器模式，默认使⽤用`TCP 20/21端口`:
1. FTP控制链接：
> 21 端口，用于接受客户端发出的相关FTP命令与参数  
> 20 端口，用于数据传输, 比如: 上传、下载数据  
#### 优点
`FTP`服务端通常部署在企业内⽹网, 具有容易易搭建、⽅方便便管理理、安全稳定等特征。 ⽽而且有些FTP客 户端⼯工具⽀支持⽂文件的多点下载
以及断点续传技术，因此FTP服务得到了了⼴广⼤大⽤用户的⻘青睐
#### hostnamectl set-hostname ftp-server  修改服务端 服务器名称
#### hostnamectl set-hostname ftp-client  修改客户端 服务器名称
### 1.安装
1. 安装包 yum -y install vsftpd db4-utils
> db4-utils 安装没有包 请修改yum源 指向阿里云yum源 
2. systemctl start vsftpd 启动
3. systemctl enable vsftpd 设置开机自启动
> 默认使用匿名用户访问共享目录站点为 /var/ftp 仅仅拥有下载权限
### 2.配置
1. 配置文件位置: cat /etc/vsftpd/vsftpd.conf
[root@ftp-server	~]#	cat	/etc/vsftpd/vsftpd.conf
#### 参数解释
1. **`anonymous_enable=YES`**									`是否启用匿名用户` 
2. **`local_enable=YES`**											`是否启动本地用户` 
3. **`write_enable=YES`**											`开启全局上传⽂文件` 
4. **`local_umask=022`**											`控制本地用户上传文件默认权限 ,	umask 表示要减掉的权限` 
5. **`anon_umask=022`**												`控制匿名用户上传文件的默认权限` 
6. `anon_upload_enable=YES`								  `允许匿名用户上传` 
7. `anon_mkdir_write_enable=YES`					  `允许创建目录` 
8. `dirmessage_enable=YES`									`配置用户目录显示信息` 
9. `xferlog_enable=YES`										 `启动日志`
10. `xferlog_file=/var/log/vsftpd.log`      `指定日志位置，配置 xferlog_enable 使用` 
11. `connect_from_port_20=YES` 
12. `xferlog_std_format=YES` 
13. `listen=YES`														     `是否作为一个独立守护进程运行行` 
14. `chroot_local_user=YES`									     `禁锢所有用户在用户目录下` 
15. `chroot_list_enable=YES`							       `配合 chroot_list_file 使用` 
16. `chroot_list_file=/etc/vsftpd/chroot_list`	 `禁锢⽤用户列列表` 
17. `pam_service_name=vsftpd`								     `PAM 认证⽂文件` 
18. `userlist_enable=YES`					               `ftpusers ⽂文件下的⽤用户都被拒绝登陆访问`
19. `tcp_wrappers=YES` 
20. `guest_enable=YES`					                  `开启虚拟⽤用户` 
21. `guest_username=www`													`FTP 虚拟用户对应的系统⽤用户` 
22. `user_config_dir=/etc/vsftpd/ftplogin`			  `授权 FTP 虚拟用户所在⽬目录`
##### 权限限制 
23. `local_root=/data/ftp`				  `指定本地用户访问⽬录站点`
24. `anon_root=/data/ftp`					  `指定匿名用户访问目录站点`
##### 资源控制 
25. `anon_max_rate=500000`				 `匿名用户限速` 
26. `local_max_rate=800000`			   `本地用户限速` 
27. `max_clients=100`							 `同时能接收多少请求` 
28. `max_per_ip=2`									`一个 ip 同时能有多少连接`

-----
#### 匿名用户 -1、	允许匿名用户登录/ftp/open并下载文件

##### 实验环境
1. Server IP 192.168.214.3
2. client Win7 
3. client IP 192.168.214.4
4. 安装好vsftp 后更改配置文件vim  /etc/vsftpd/vsftpd.conf 
```shelll
 anonymous_enable=YES                    启用匿名用户
 anon_max_rate=5000000                   匿名用户限速 5M/s最大
 anon_upload_enable=NO								   不允许匿名用户上传 
 anon_mkdir_write_enable=NO 					   不允许创建目录 
 
```
5. 重启 systemctl restart vsftpd
###### 注意:即使赋予了可以上传创建目录的权限 如果不在linux内部文件赋予权限同样无法修改 双重权限设置
6. 完成使用例如win7 测试 ftp://192.168.214.3 就可以看见文件夹 并且下载 但是不能上传
#### 2.匿名用户 -2 可读可写可创建
1. 修改默认 ftp 共享⽬目录站点权限，最后重新加载 vsftpd 服务 
2. [root@ftp-server	~]#	chmod	-R	777	/var/ftp/
3. [root@ftp-server	~]#	systemctl	restart	vsftpd
4. 或者 chown ftp.ftp /vat/ftp 
#### 3.测试工具 Linux 下使⽤用 lftp 客户端⼯工具访问 vsftpd 服务验证，安装此工具 
1. `yum	install	lftp	-y`
2. `lftp	192.168.56.11` 连接ftp
3. 测试命令  `mkdir` 创建目录 `rm` 删除 [lftp命令](https://blog.csdn.net/lockey23/article/details/76284366) [left命令详解](http://man.linuxde.net/lftp)
##### 赋予ftp服务权限
4. vim  /etc/vsftpd/vsftpd.conf 
```shel
 anonymous_enable=YES                    启用匿名用户
 anon_max_rate=5000000                   匿名用户限速 5M/s最大
 anon_upload_enable=YES								   
 anon_mkdir_write_enable=YES 					  
 
``` 
##### 赋予文件权限
5. [root@localhost ~]# chown ftp.ftp /var/ftp **`如果不-R 那么无法写ftp 内部的子文件`**
6. [root@localhost ~]# chown -R  ftp.ftp /var/ftp **`拥有子文件读写权限`**
7. chmod -R 777 /var/ftp 同样可以达到目的
8. 重启测试 systemctl restart vsftpd
-----
#### 本地用户 默认就有上传下载权限
1. 修改配置文件 支持本地用户
```shell
# vim /etc/vsftpd/vsftp.conf
   guest_enable=YES                      #实体用户均被假设成‘guest’登录
   guest_username=virtftp                #这个‘guest’被映射为本地的‘virtftp’用户
   pam_service_name=vsftpd               #设置在PAM所使用的名称，默认值为vsftpd
   user_config_dir=/etc/vsftpd/virt_dir  #虚拟用户的单独配置信息设置放在/etc/vsftpd/virt_dir下
```
1. [root@ftp-client	\~]#	lftp	192.168.56.11  
2. lftp	192.168.56.11:\~>	login	ftp_test	123  
3. lftp	ftp_test@192.168.56.11:/>	mkdir	ftp  
4. [root@ftp-server	~]#	ls	/home/ftp_test  
