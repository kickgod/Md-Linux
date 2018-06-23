文件查找 which Locate Find
---
---
* `grep` :  `文件内容过滤` 
* `which`:  `命令查找`
* `find` :  `文件查找，针对文件名` [博客](http://man.linuxde.net/find)
---
**1**. 命令按照:`locate` 需要安装  `yum -y install mlocate`  

### which 命令查找
#### 例如: which ls，whereis vim        
* 从 PATH 环境变量 （echo $PATH） 里面查找<br/>
* `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin` 面有四个目录 首先从 `/usr/local/sbin` 里面查找ls 如果有返回 没有查找第二个目录,依次查找.如果四个目录都没有这些目录那么就没有这个命令. 如果将PATH=其他目录可能会到导致一些命令无法执行  因为bash执行用户输入的命令也是靠PATH环境变量查找命令. `which`也是依存环境变量`PATH`查找的
### Type 查询命令是否是别名
* type cp `cp 是 cp -i 的别名`

----
### locate 命令 
* 它是一个需要安装的命令，它在本地维持一个文件数据库,初次安装locate  需要手动建立更新数据库 **数据库位置**(`/var/lib/mlocate/mlocate.db`)，它固定在每天的一个时间更新数据库,建立一个 计划任务：每天自动更新数据库 **`/etc/cron.daily/mlocate.cron`** 所有当前新建的文件不一定能够查找到,所有在查找之前最好 使用命令 **`updatedb`** 手动更新一下数据库. <br/>
关键命令:<br/>
updatedb  `更新数据库`<br/>
locate fileName `定位所有名称里面包含filename的文件`<br/>

### find 最强大的命令
`find`是文件查找中最强大的命令但是他的速度比不上which和locate 但是它功能强大,支持多种查找方式<br/>

命令格式:`find [options] [path...] [expression] [action]` 选项 查找路径 表达式 动作

----
* 按照文件名称查找 find /path -name /-iname
```shell
 find /etc -name "ifcfg-eth0"
 find /etc -iname "ifcfg-eth0"       //-i 忽略大小写 
 find /etc -iname "ifcfg-eth*"
```
----
* 按照文件的大小查找  find /path `-size` + - 单位
```shell
 find /etc -size +5M         //大于 5M 的文件
 find /etc -size 5M          //小于 5M 的文件
 find /etc -size -5M         //小于 5M 的文件   
```
----
* 指定查找的目录和深度： `-maxdepth / -mindepth`  
``` shell
find / -maxdepth 3 -a  -name "ifcfg-eth0"  在根目录下面查找名称为ifcfg-eth0的文件  最大查找深度为3
find /etc -maxdepth 3 -a  -name "ifcfg-eth0"  在etc目录下面查找名称为ifcfg-eth0的文件  最大查找深度为3
```
----
* 按时间找(atime,mtime,ctime) accessed  modify  change 
```v
 find /etc -mtime +5       //修改时间超过 5 天
 find /etc -mtime 5        //修改时间等于 5 天 
 find /etc -mtime -5       //修改时间 5 天以内 
 find /etc -cmin -5        //文件状态修改时间 5 分钟以内 
 find /etc -amin -5       //文件被访问 5 分钟以内 
```
----
*  按文件属主、属组找
```shell
find /home -user jack        //属主是 jack 的文件
find /home -group hr         //属组是 hr 组的文件 
find /home -user jack -group hr //属主是 jack 且 属组是 hr的文件
find /home -user jack -a -group hr  //a：and
find /home -user jack -o -group hr  //o:or
find /home -nouser  //没有属主
find /home -nogroup //没有属组
find /home -nouser -o -nogroup //没有属主 和 属组 
```
----
*  按文件类型 `-type` p
```shell
find /dev -type f         //f 普通 
find /dev -type d         //d 目录 
find /dev -type l         //l 链接 
find /dev -type b         //b 块设备 
find /dev -type c         //c 字符设备 
find /dev -type s         //s 套接字 
find /dev -type p         //p 管道文件
```

----
* 按文件权限
```shell
find / -perm 644 -ls   #查找权限为644的文件
find / -perm -644 -ls  #查找包含644权限的文件 满足条件的文件权限可是 777 666 655...
find / -perm -600 -ls  #查找包含600权限的文件 满足条件的文件权限可是 777 666 655...
find / -perm -222 -ls  
```
----
* 按正则表达式： -regex pattern
```
find /etc  -regex  '.*ifcfg-eth[0-9]'  #.*       任意多个字符  |  [0-9]  任意一个数字
find /etc -regex '.*ifcfg-enp0s25' 
```
----
* Action
```
找到后处理的动作 ACTIONS： （默认动作-print
-print 
-ls 
-delete            #直接删除 没有提醒 
-exec              后面跟自定义的 shell 命令 
-ok                后面跟自定义的 shell 命令

find /etc -name "ifcfg*" 
find /etc -name "ifcfg*" -print
find /etc -name "ifcfg*" -ls 
find /etc -name "ifcfg*" -exec cp -rvf {} /tmp \;
find /etc -name "ifcfg*" -ok cp -rvf {} /tmp \; 
find /etc -name "ifcfg*" -exec rm -rf {} \; 
find /etc -name "ifcfg*" -delete 

```
----
* 扩展知识：[find](https://github.com/kickgod/Md-Linux/edit/master/centos/Linux_file_serarch.md) 结合 xargs
```
 find . -name "yang*.txt" |xargs rm -rf         
 find /etc -name "ifcfg-eth0" |xargs -I {} cp -rf {} /var/tmp 
```

