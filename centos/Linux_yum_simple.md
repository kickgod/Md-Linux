Yum 按照简介
----
`Yum`（全称为 `Yellow dog Updater, Modified`）是一个在Fedora和RedHat以及CentOS中的Shell前端软件包管理器。基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包，无须繁琐地一次次下载、安装。<br/>

#### 默认Yum 源
* 安装的时候会在前面显示 `base` `extras` `updates` 这是三个yum默认源,它们在国外,是三个官方的yum源,缺省自带,基础源,对于很多的扩展源都没有,如果需要扩展源 需要epel源,一般可以安装后将yum 源多一个指向国内的yum源 例如 [`阿里云Yum源`](https://mirrors.aliyun.com/centos/) 163 清华 因为这样安装更快 ，从国外安装会慢一点.但是由于网速足够快,所有一般人都不会添加yum源。
* [yum repolist](https://github.com/kickgod/Md-Linux/blob/master/centos/Linux_yum_simple.md)  查看`yum` 包
* ` vim  /etc/yum.repos.d/CentOS-Base.repo` 查看默认的yum源配置文件 
> 1.RedHat 光盘或官方网站 ftp://ftp.redhat.com <br/>
> 2.rpmfind.net <br/> 
> 3.相应软件官方网站如 http://www.mysql.com <br/>
----
1. uname -m 查看系统平台 多少位
2. cat /etc/redhat-release 查看系统版本
#### 说明
* yum本质安装的是:`rpm` 包 ,rpm和 `yum`适用于**RedHat/Centos**  Ubuntu和Debian 一般使用DPKG apt  rpm 名称结构:软件包名 版本号(Version) 发布版本(Release) 系统平台 例如:  `mysql-community-common`-`5.7.12`-`1.el7`.`i686`.rpm 
* 主要获得 RPM 包途径：

----
#### 命令简介 yum(选项)(参数)
1. `yum provides locate` 查看locate命令属于哪个包 <br/>
2. `yum list name` 查看包 <br/>
``` vim
-h：显示帮助信息；
-y：对所有的提问都回答“yes”；
-c：指定配置文件；
-q：安静模式；
-v：详细模式；
-d：设置调试等级（0-10）；
-e：设置错误等级（0-10）；
-R：设置yum处理一个命令的最大等待时间；
-C：完全从缓存中运行，而不去下载或者更新任何头文件。
```
```
install：安装rpm软件包；
update：更新rpm软件包；
check-update：检查是否有可用的更新rpm软件包；
remove：删除指定的rpm软件包；
list：显示软件包的信息；
search：检查软件包的信息；
info：显示指定的rpm软件包的描述信息和概要信息；
clean：清理yum过期的缓存；
shell：进入yum的shell提示符；
resolvedep：显示rpm软件包的依赖关系；
localinstall：安装本地的rpm软件包；
localupdate：显示本地rpm软件包进行更新；
deplist：显示rpm软件包的所有依赖关系。
```


### 配置阿里云 基础yum源
* 1.备份Yum配置文件 <br/>
`mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup` <br/>
* 2.选择版本 使用curl 或者 wget 没有请安装 下载对应版本的repo文件 <br/>
`CentOS 7`<br/>
`wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo`<br/>
`或者`<br/>
`curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo`<br/>
* 3.生成缓存 生效<br/>
`yum clean all`<br/>
`yum makecache`<br/>
* 参考文件[参看帮助] [安装 163yum](http://mirrors.163.com/.help/centos.html) [安装 aliyun yum](https://opsx.alibaba.com/mirror)

----
### yum 配置EPEL 扩展源
1. 使用官方扩展EPEL源<br/>
`yum -y install epel-release `<br/>
2. 使用aliyun 扩展<br/>
 `如果没有epel源 在/etc/yum.repos.d中没有epel.repo 那么直接`<br/>
 `wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo`<br/>
 `如果有epel 需要改的话 那么先备份就行`
3. 安装好后 使用[yum repolist](https://github.com/kickgod/Md-Linux/blob/master/centos/Linux_yum_simple.md) 可以看到一个新的 yum源 `epel/x86_64`   并且多出了一万多个包
-----
### yum epel的缺点 
1. 官方epel的包版本常常不是最新的，例如nginx epel包里面是1.1.12版本的时候, 官网已经是1.1.15版本
### 
----
[ 1. 阿里云Linux yum源](https://opsx.alibaba.com/mirror)  [  2. 清华Yum 源](https://mirrors.tuna.tsinghua.edu.cn/) [  3. 163 yum源](http://mirrors.163.com/)
