FTP⽂文件传输服务
-----
`FTP(File Transfer Protocol)`, 中⽂文为 “⽂文件传输协议” 是⼀一种在互联⽹网上进⾏行行⽂文件传输的协议, ⽤用于 在Internet上控制⽂文件的双向传输。
FTP是⼀一个应⽤用程序, 基于客户端/服务器器模式，默认使⽤用`TCP 20/21端⼝`:
1. FTP控制链接：
> 21 端口，用于接受客户端发出的相关FTP命令与参数  
> 20 端口，用于数据传输, 比如: 上传、下载数据  
#### 优点
`FTP`服务端通常部署在企业内⽹网, 具有容易易搭建、⽅方便便管理理、安全稳定等特征。 ⽽而且有些FTP客 户端⼯工具⽀支持⽂文件的多点下载
以及断点续传技术，因此FTP服务得到了了⼴广⼤大⽤用户的⻘青睐
### 1.安装
1. 安装包 yum -y install vsftpd db4-utils
2. systemctl start vsftpd 启动
3. systemctl enable vsftpd 设置开机自启动
> 默认使用匿名用户访问共享目录站点为 /var/ftp 仅仅拥有下载权限
### 2.配置
1. 配置文件位置: cat /etc/vsftpd/vsftpd.conf
[root@ftp-server	~]#	cat	/etc/vsftpd/vsftpd.conf
#### 参数解释
1. **`anonymous_enable=YES`**									`是否启⽤用匿匿名⽤用户` 
2. **`local_enable=YES`**											`是否启动本地⽤用户` 
3. **`write_enable=YES`**											`开启全局上传⽂文件` 
4. **`local_umask=022`**											`控制本地用户上传文件默认权限 ,	umask 表示要减掉的权限` 
5. **`anon_umask=022`**												`控制匿名用户上传文件的默认权限` 
6. `anon_upload_enable=YES`								`允许匿名用户上传` 
7. `anon_mkdir_write_enable=YES`					  `允许创建目录` 
8. `dirmessage_enable=YES`									`配置用户目录显示信息` 
9. `xferlog_enable=YES`										`启动日志`
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
