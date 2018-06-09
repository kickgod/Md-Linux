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
* \# chown alice.hr file1   //`改属主、属组 属主变为alice 属组变为hr `
* \# chown alice file1    //`只改属主  更改属主 alice`  
* \# chown .hr file1    //`只改属组    更改属组为`
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
例如: chmod a+w filename 给所有人加写权限 a all //简写: chmod +w filename
----------------------------------------------
rwx 
111 二进制 7
110 6 读写不执行
100 4 读
000 0没有任何权限
chmod 777 filename 一次性设置文件属主 属组 其他用户的权限 读写执行
chmod 740 filename 一次性设置文件属主 属组 其他用户的权限 
```
##### `对目录有w权限,可以在目录中创建新文件,可以删除文件中的文件(跟文件的权限无关)`
### 3. setfacl 命令 set file access control lists
* `setfacl [-bkndRLPvh] [{-m|-x} acl_spec] [{-M|-X} acl_file] file ...`
* -m 设置权限 -x 删除权限
* \# setfacl -m u:alice:rw /home/test.txt  //增加用户 alice 权限
* \# setfacl -m u:jack:- /home/test.txt   //增加用户 jack 权
```
例子
        授予额外的用户读取权限
               setfacl -m u：lisa：r文件

        撤销所有组和所有指定用户的写入权限（使用有效权限掩码）
               setfacl -m m :: rx文件

        从文件的ACL中删除已命名的组条目
               setfacl -x g：员工档案

        将一个文件的ACL复制到另一个文件
               getfacl file1 | setfacl --set-file = - file2

        将访问ACL复制到默认ACL中
               getfacl --access dir | setfacl -d -M- dir
```
### 4. getfacl 命令 查看文件权限信息
* \# getfacl /path/filname
