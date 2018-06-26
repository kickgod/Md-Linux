Linux Samba 服务
-----
`SMB`协议 （`Server Messages Block`，信息服务块）是一种在局域网上 共享文件和打印机的一种通信协议 微软开发 
 SMB为`局域网内`的不同计算机之间提供文件及打印机等资源的共享 服
* `Samba主要用于Unix(Linux)与Windows共享文件 `
* `服务端：Unix Linux` 
* `客户端：Window`
```
 早期网络中，不同主机之间的传输大多是使用 FTP  但使用FTP 传输文件却有个问题: 1. 无法直接修改主机上面的文件数据 
 想要更改Linux 主机上的某个文件时，必需要由 Server 端将该文 件下载到 Client端后才能修改 该文件在 Server 与 Client 
 端都会存在 

```
 `Samba` 目标
 > 1.在 Client 端的机器上面直接读写Server 上面的文件  
 > 2.Client 端不需要保存文件
 -----
`Samba`	软件包  
> samba: samba服务端共享程序  
> common: samba服务配置⽂文件语法检验testparm  
> cifs-utils: samba客户端软件, 提供所需⼯工具指令  
#### samba 运行
* samba安装 `#	systemctl	stop	firewalld ; #	setenforce	0 ;#	yum	-y	install	samba` 
* 运行重启 查看
> #systemctl start smb  
> #systemctl restart smb  
> #systemctl reload smb  
> #systemctl status smb  
`PS：关闭或者设置：防火墙和SELinux`  `setenforcr 0` ;`systemctl stop firewalld`; [红帽考试的时候不能关]
----
#### 1. 配置文件
* 目录：/etc/samba/smb.conf
```
1. smb.conf含有多个段，每个段由段名开始，直到下个段名

2. 每个段名放在方括号中间

3.每段的参数的格式是：名称=指令 

4. 配置文件中一行一个段名和参数，段名和参数名不分大小写。 

4. 除了 [global] 段外，所有的段都可以看作是一个共享资源 

5. 段名是该共享资源的名字，段里的参数是该共享资源的属性。
```
* testparm : 测试smb.conf配置是否正确 
* testparm -v : 详细的列出smb.conf支持的配置参数

|程序名| 功能| 端口| 
|---|--|--|
|nmbd |提供基于NetBios主机名称解析| udp/137,138|
|smbd |提供对⽂文件、打印资源的共享 |udp/139,445|
------
#### Samba配置文件注释 #	egrep	-v	'^#|^$'	/etc/samba/smb.conf
```
[global]                        // 全局参数				

workgroup = SAMB                // ⼯工作组名称				

hosts allow=192.168.56.         // 表示允许 IP 或⽹网段 ,	允许使⽤用通配符或主机名	

interfaces = eth0               //SambaServer 监听⽹网卡 ,	也可以写 IP 地址			

max connections = 0             // 最⼤大连接数⽬目 ,	超出拒绝 ,	0 表示不不限制		

max log size = 50               // 定义⽇日志⽂文件的最⼤大容量量为 50KB	

security = user                 安全验证⽅方式，总共有 4 种			

                                share: ⽆无需验证身份 ,	简单⽅方便便 ,	安全性差																											
                                user: 需要验证⽤用户密码才可访问 ,	安全性⾼高																											
                                server: 需要通过三⽅方服务验证账号密码 ,	（集中管理理账户）																										
                                domain:	使⽤用域控制器器进⾏行行身份验证				
                                
passdb backend = tdbsam         定义⽤用户密码的类型，共有 3 种																											 
                                smbpasswd: 为系统⽤用户设置 Samba 服务程序的密码																										
                                tdbsam: 创建数据库⽂文件并使⽤用 pdbedit 命令建⽴立 Samba 服务程序的 ⽤用户																								
                                ldapsam:	基于 LDAP 服务进⾏行行账户验证		
                                
printing = cups                 设置 Samba 共享打印机的类型 (bsd,	sysv,	plp,	lprng,	aix,	hp ux,	qnx)	

printcap name = cups            设置共享打印机的配置⽂文件

load printers = yes             设置在 Samba 服务启动时是否共享打印机设备			

cups options = raw              打印机的选项

// 为了更方便查阅共享重要参数的功能 ,	共享参数如下： 

[共享名/访问名] 

  comment	=	任意字符串串 
  
  path	=	共享⽬目录路路径 
  
  browseable	=	指定该共享是否可以浏览 
  
  writable	=	指定该共享路路径是否可写 
  
  valid	users	=	允许访问该共享的用户 
  
  invalid users = 禁⽌止访问该共享的用户 
  
  write	list	=	允许写⼊入该共享的用户 
  
  guest	ok	=	指定该共享是否允许guest账户访问
```
#####   Smaba 配置文件 写命令需要用 true/false yes/no
**3**.建⽴立访问共享资源, 在	Linux7	系统中, `Samba`服务程序默认使⽤用的是⽤用户⼝口令认证模式,确保仅 让有密码且受信任的⽤用户访问共享资源,
不不过需要使⽤用	pdbedit	建⽴立账户信息数据库来管理理SMB 服务程序

----
#### `pdbedit`	[ 选项 ]	账户  
> -a	⽤用户名				建⽴立 Samba ⽤用户  
> -x	⽤用户名				删除 Samba ⽤用户  
> -L				列列出⽤用户列列表  
> -Lv			列列出⽤用户详细信息的列列表  

 * useradd	bgx 
 * pdbedit	-a	-u	bgx new	password:			// 输⼊入密码
 * retype	new	password:				// 确认密码
 * smbpasswd -a alice  也可以达到上面要求 将Alice 添加进用户列表

6.重启	smb	服务并加⼊入开机⾃自启动
######	systemctl	restart	smb 
######	systemctl	enable	smb
###### 如果必须开启防⽕火墙,	注意执⾏行行如下指令 
######	firewall-cmd	--permanent	--add-service=samba 
######	firewall-cmd	--reload

##### useradd -s /sblin/nologin alice
##### mkdir /myshare
##### chown 766 /myshare
##### pdbedit -a alice
``` shell
# See smb.conf.example for a more detailed config file or
# read the smb.conf manpage.
# Run 'testparm' to verify the config is correct after
# you modified it.

[global]
        workgroup = SAMBA
        security = user

        passdb backend = tdbsam

        printing = cups
        printcap name = cups
        load printers = yes
        cups options = raw
[share-samba]
        comment= This is Share /temp
        path= /temp
        public = yes
        writeable=true
        browseable=true
        guest ok=true
[myshare]
        comment = This is Share Directionary /myshare
        path = /myshare
        guest ok= true
        public = yes
        browseable = true
        writeable = true  
   
```
#### 由于是双重权限 即使用户Alice 使用setfacl 或者其他赋予读写权限  但是由于 writeable = false 那么用户同样无权限 读写文件
#### 最后 重启一次 
* `systemctl restart smb`
