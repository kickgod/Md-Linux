Linux NFS `(Network File System/网络文件系统)`
---
`NFS`是`FreeBSD`支持的文件系统中的一种，由Sun公司开发，于 1984年向外公布 ,`NFS`允许网络中的计算机之间通过TCP/IP网络共享资源 ,在NFS的应用中,
本地NFS的客户端应用可以透明地读写位于远端 `NFS`服务器上的文件，就像访问本地文件一样,`NFS`类似于Windows中的`映射网络驱动器功`  

----
`NFS` 用于设置Linux系统之间的文件共享,`NFS`只是一种文件系统，本身没有传输功能，是基于`RPC`协议 实现的，才能达到两个Linux系统之间的文件目录共享；
 `NFS`为C/S架构
#### 优势: 
 1、`节省本地存储空间，将常用的数据存放在一台NFS服务器上且 可以通过网络访问，那么本地终端将可以减少自身存储空间的使用。` 
 
 2、`用户不需要在网络中的每个机器上都建有Home目录，Home目 录可以放在NFS服务器上且可以在网络上被访问使用` 
 
 3、`一些存储设备可以在网络上被别的机器使用，提高设备利用率`
 
 ##### NFS一般用于中小企业,现代大数据 大规模文件管理 采用的文件系统为 HDFS GFS等等
 ### 1.安装
 * `#yum install -y nfs-utils`
 * 运行-设置开机启动： 
   * `#systemctl enable rpcbind `
   * `#systemctl enable nfs-server`
 * 运行-服务
   * `#systemctl start rpcbind`
   * `#systemctl start nfs-server`
  ----
  #### 2.相关命令
  * 1.rpcinfo  显示那些使用portmap注册的程序的信息,并向程序进行RPC调用, 检查它们是否正常运行 
  * 2.exportfs nfs服务命令，用于查看状态，加载配置文件等  exportfs -rv 重新加载配置文件 
  * 3.showmount -e [nfs服务器IP]  检查 NFS 服务器端是否有目录共享： 
  * 4.nfsstat 查看NFS的运行状态
  #### 3.配置文件: /etc/export
  > 默认配置文件为空 根据需要配置共享文件夹： 
  * /etc/exports文件内容格式： 
  * <输出目录> [客户端1 选项（访问权限,用户映射,其他）] [客户端2 选项（访问权限,用户映射,其他）] … 
  ##### 解释
  ```
    输出目录:是指NFS系统中需要共享给客户机使用的目录； 
    
    客户端:客户端是指网络中可以访问这个NFS输出目录的计算机;
    
    客户端常用的指定方式: 
    
    指定ip地址的主机：192.168.240.132 
    指定子网中的所有主机： 192.168.0.0/24  192.168.0.0/255.255.255.0 
    指定域名的主机：david.bsmart.cn 
    指定域中的所有主机：*.bsmart.cn
    所有主机：*
  ```
  ##### 选项：用来设置输出目录的访问权限、用户映射等 
  NFS主要有3类选项： `访问权限选项` `用户映射选项` `其它选项`
  ##### 访问权限选项 
  设置输出目录只读：`ro`
  设置输出目录读写：`rw` 
  
  ##### 用户映射选项 
  
  `all_squash：将远程访问的所有普通用户及所属组都映射为匿名 用户或用户组（nfsnobody）`<br/>
  `no_all_squash：与all_squash取反（默认设置)` <br/>
  `root_squash：将root用户及所属组都映射为匿名用户或用户组 （默认设置)` <br/>
  `no_root_squash：与rootsquash取反`<br/>
  `anonuid=xxx：将远程访问的所有用户都映射为匿名用户，并指 定该用户为本地用户（UID=xxx）默认为nfsnobody（65534)` <br/>
  `anongid=xxx：将远程访问的所有用户组都映射为匿名用户组账 户，并指定该匿名用户组账户为本地用户组账户（GID=xxx）， 默认为nfsnobody（65534)` <br/>
  
   ##### 其它选项 
  
  `secure：限制客户端只能从小于1024的tcp/ip端口连接nfs服务 器（默认设置)` <br/>
  `insecure：允许客户端从大于1024的tcp/ip端口连接服务器`<br/>
  `sync：将数据同步写入内存缓冲区与磁盘中，效率低，但可以保 证数据的一致性`<br/>
  `async：将数据先保存在内存缓冲区中，必要时才写入磁盘`<br/>
  `wdelay：检查是否有相关的写操作，如果有则将这些写操作一起 执行，这样可以提高效率（默认设置）` <br/>
  `no_wdelay：若有写操作则立即执行，应与sync配合使用`  <br/>
  `subtree：若输出目录是一个子目录，则nfs服务器将检查其父目 录的权限(默认设置)` <br/>
  `no_subtree：即使输出目录是一个子目录，nfs服务器也不检查 其父目录的权限，这样可以提高效率`<br/>
#### 4.介质
* 所有Server共享的文件都会显示在 /var/lib/nfs/etab 中 配置后查看这个里面是否有记录 配置后好了没有 请重启一下
> `systemctl restart nfs-server`

### 客户端开始配置
> 无论客户端或者其他服务端 都要安装 `yum -y install nfs-utils rpcbind`
1. systemctl enable rpcbind
2. systemctl start  rpcbind
3. vim /etc/exports `/temp  192.168.214.0(insecure,rw,async,no_root_squash)`
4.chmod 777 /temp
5.重启nfs-server
6.关闭 setenforce 0
7.systemctl stop firewall
8. rpcinfo -p 测试 server 是否允许成功
9. exportfs -v 查看已经共享的文件配置
10. exportfs 查看已经共享文件的简略信息  
----
|命令|选项一|选项二|
|--|--|--|
| exportfs -v|共享文件目录|文件配置信息|
|exportfs|共享文件目录|允许共享主机或者网段|
#### showmount –e 主机ip、检查 NFS 服务器端是否有目录共享  
11.showmount -e 192.168.214.3
挂载文件
1. /mkdir /mnt/nfs 
2. mount -t nfs 192.168.214.3:/temp /mnt/nfs
3. df -h 查看挂载结果
### 错误
* mount.nfs: access denied by server while mounting 192.168.214.3:/temp 
1. 可能是端口大于1024的访问问题 加上参数insecure
解决方法:/temp  192.168.214.0(insecure,rw,async,no_root_squash)
