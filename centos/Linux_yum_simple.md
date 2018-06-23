Yum 按照简介
----
`Yum`（全称为 `Yellow dog Updater, Modified`）是一个在Fedora和RedHat以及CentOS中的Shell前端软件包管理器。基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包，无须繁琐地一次次下载、安装。<br/>

#### 默认Yum 源
* 安装的时候会在前面显示 `base` `extras` `updates` 这是三个yum默认源,它们在国外,一般可以安装后将yum 源多一个指向国内的yum源 例如阿里云 163 清华...
----
1. uname -m 查看系统平台 多少位
2. cat /etc/redhat-release 查看系统版本

----
#### 命令简介
1. `yum provides locate` 查看locate命令属于哪个包 <br/>
