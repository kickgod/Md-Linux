FTP 配置
-----
### 配置-匿名用户 FTP
----
> `目标:.配置匿名用户访问ftp服务，拥有创建文件夹、上传下载文件、不允许删除、移动、重命令`
#### 关闭防火墙和安全设置 开启服务
* 第一步:  `systemctl stop firewall`
* 第二步:  `systemctl disable firewall`
* 第三步:  `setenforce 0`
* 第四步:  `systemctl start vsftpd` 启动
* 第五步:  `systemctl enable vsftpd` 设置开机自启动
#### 配置文件
* 位置:`vim /etc/vsftpd/vsftpd.conf`<br/>
> 1. 启动匿匿名⽤用户、允许上传和创建⽂文件权限 <br/>
`anonymous_enable=YES` <br/>
`anon_upload_enable=YES`<br/>
`anon_mkdir_write_enable=YES`<br/>
> 2. 修改默认 ftp 共享⽬目录站点权限，最后重新加载 vsftpd 服务 <br/>
	`chmod	-R	777	/var/ftp/` `-R 很重要 不然只有目录有权限`<br/>  ·
  `systemctl	restart	vsftpd`<br/>

### 严重工具 
> 1. Linux 下使⽤用 lftp 客户端⼯工具访问 vsftpd 服务验证，安装此工具  <br/>
`yum	install	lftp	-y` <br/>
 匿名登陆:  `lftp	192.168.56.11 ` <br/>
 
 ### 配置-本地用户 FTP
 -----
 > `默认用于上次下载权限`
