Linux文件权限 UGO<一>
===
##### `我们通常在文件上面设置什么用户用户组具有什么样的权限.`
> 解析长列表:drwxr-xr-x. 119 root root 8192 6月   9 14:00 etc
-----
|d       |rwx   |r-x     |r-x      |119      |root       |root         |8192   |6月   9 14:00   |etc |
|:-------|------|--------|---------|---------|-----------|-------------|-------|----------------|----|
|文件类型|属主权限|属组权限|其他人权限|文件索引号|文件属主    |文件属组     |文件大小|最后一次修改日期|文件名|
|文件目录|读写执行|读执行  |读执行    |119      |属主root   |属组root     |8192    |6月9日 14点    |etc  |
### 1. chown 改变文件所属 change owner
* [root@tianyun ~]# chown alice.hr file1   //`改属主、属组 属主变为alice 属组变为hr `
* [root@tianyun ~]# chown alice file1    //`只改属主  更改属主 alice`  
* [root@tianyun ~]# chown .hr file1    //`只改属组    更改属组为`
* chgrp groupName [/path/]filename  修改文件属组
* -R 参数  如果加上 则递归子文件改变  属组或者属主
### 2. chmod 改变权限
``` shell
改变对象 u g o   #user group other
操作 + - =
符号 r w x
例如: chmod u+w filename 给文件的主人增加读的权限
例如: chmod g+w filename 给文件的属组增加读的权限
例如: chmod g-w filename 取消属组对于文件的写权限
例如: chmod g=w filename 属组的权限设置为只读
```
