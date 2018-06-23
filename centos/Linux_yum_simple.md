Yum 按照简介
----
`Yum`（全称为 `Yellow dog Updater, Modified`）是一个在Fedora和RedHat以及CentOS中的Shell前端软件包管理器。基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包，无须繁琐地一次次下载、安装。<br/>

#### 默认Yum 源
* 安装的时候会在前面显示 `base` `extras` `updates` 这是三个yum默认源,它们在国外,是三个官方的yum源,缺省自带一般可以安装后将yum 源多一个指向国内的yum源 例如 [`阿里云Yum源`](https://mirrors.aliyun.com/centos/) 163 清华 因为这样安装更快 ，从国外安装会慢一点.但是由于网速足够快,所有一般人都不会添加yum源。
* [yum repolist](https://github.com/kickgod/Md-Linux/blob/master/centos/Linux_yum_simple.md)  查看`yum` 包
* ` vim  /etc/yum.repos.d/CentOS-Base.repo` 查看默认的yum源
```vim 
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the 
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-$releasever - Base
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#released updates 
[updates]
name=CentOS-$releasever - Updates
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/
gpgcheck=1

```
----
1. uname -m 查看系统平台 多少位
2. cat /etc/redhat-release 查看系统版本

----
#### 命令简介
1. `yum provides locate` 查看locate命令属于哪个包 <br/>

-----
[ 1. 阿里云Linux yum源](https://opsx.alibaba.com/mirror)  [  2. 清华Yum 源](https://mirrors.tuna.tsinghua.edu.cn/) [  3. 163 yum源](http://mirrors.163.com/)
