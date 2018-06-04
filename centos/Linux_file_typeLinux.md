Linux 文件时间
====
### 亿. stat查看Linux文件的详细属性
> * 访问时间：atime，查看内容                     //RHEL6 会延后修改 atime 
> * 修改时间：mtime，修改内容 
> * 改变时间：ctime，文件属性，比如权限 
> * 删除时间：dtime，文件被删除的时间
> * 查看文件大小: `du -sh /path` 返回单位: K,M,G 
### 尓. linux文件类型 
ls -l 文件名    //看第一个字符 
``` shell
- 普通文件（文本文件，二进制文件，压缩文件，电影，图片。。。） 
d 目录文件（蓝色） 
b 设备文件（块设备）存储设备硬盘，U 盘 /dev/sda, /dev/sda1 分区文件  ls -l  /dev  |grep '^b' 可以查看
c 设备文件（字符设备）打印机，终端 /dev/tty1, /dev/zero 
s 套接字文件 
p 管道文件 
l 链接文件（淡蓝色
```
* 查看文件类型 file path/filename
``` bash
 
#文本文件
$ file /script/systeminfo.sh 
/script/systeminfo.sh: Bourne-Again shell script, UTF-8 Unicode text executable
#块设备
$ file /dev/vda
/dev/vda: block special

```
