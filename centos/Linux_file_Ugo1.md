Linux文件权限 Ugo<一>
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
改变对象 u g o  a #user group other  all  
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
![权限](/Image/解释.png)
##### `对目录有w权限,可以在目录中创建新文件,可以删除文件中的文件(跟文件的权限无关)`
### 3. setfacl 命令 set file access control lists
* `setfacl [-bkndRLPvh] [{-m|-x} acl_spec] [{-M|-X} acl_file] file ...`
* -m 设置权限 -x 删除权限
* \# setfacl -m u:alice:rw /home/test.txt  //增加用户 alice 权限
* \# setfacl -m u:jack:- /home/test.txt   //增加用户 jack 权
* \# u g o m //m  设置所有的权限
```shell
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
               
        #给某个用户赋予什么权限               
        [root@localhost script]# setfacl -m u:sour:rwx user
        [root@localhost script]# getfacl user
        # file: user
        # owner: kick
        # group: sour
        user::rw-
        user:sour:rwx
        group::rw-
        mask::rw-
        other::rw-
        #这个时候sour 不算是other
        #取消sour用户对于user目录的权限
        setfacl -x u:sour user
```
* setfacl -b /home/test.txt    //删除所有 acl 权限 
* setfacl -x g:hr /home/test.txt    //删除组 hr 的 acl 权限 
* setfacl -b /home/test.txt    //删除所有 acl 权限 

##### setfacl: Option -m: 无效的参数 near character 3
##### setfacl: Option -m incomplete
##### 以上错误 用户或者用户组不存在 或者写错了名字 参数

##### 有了setfacl之后就把有些核心重要的文件归类禁止其他用户的权限这样就可以单独给一些用户设置权限.

### 4. getfacl 命令 查看文件权限信息
* \# getfacl /path/filname
### 5. ACL 高级特性 
#### mask 用于临时降低用户或组（除属主和其他人）的权限 `mask决定了他们的最高权限`   不影响其他人和所有者 
* `建议：为了方便管理文件权限，其他人的权限置为空 `
* setfacl -m o::- /path/name 
* chmod o=- /path/name
* setfacl -m m::--- /path/name
* mask只是一个临时行为 任何设置权限setfacl 都会使得mask 重新设置  
``` Shell
[root@localhost script]# touch file1
[root@localhost script]# getfacl file1
# file: file1
# owner: root
# group: root
user::rw-
group::r--
other::r--

[root@localhost script]# setfacl -m u:kick:r file1 
[root@localhost script]# getfacl file1 
# file: file1
# owner: root
# group: root
user::rw-
user:kick:r--
group::r--
mask::r--
other::r--

[root@localhost script]# setfacl -m u:sour:rw file1 
[root@localhost script]# getfacl file1
# file: file1
# owner: root
# group: root
user::rw-
user:kick:r--
user:sour:rw-
group::r--
mask::rw-
other::r--

[root@localhost script]# setfacl -m g:sour:rwx file1 
[root@localhost script]# getfacl file1 
# file: file1
# owner: root
# group: root
user::rw-
user:kick:r--
user:sour:rw-
group::r--
group:sour:rwx
mask::rwx
other::r--
#
[root@localhost script]# setfacl -m  mask::r file1 
[root@localhost script]# getfacl file1 
# file: file1
# owner: root
# group: root
user::rw-
user:kick:r--
user:sour:rw-			  #effective:r--    #mask 屏蔽了用户sour的写权限
group::r--
group:sour:rwx			#effective:r--   #mask 屏蔽了sour的wx 权限 
mask::r--
other::r--
[root@localhost script]# setfacl -m u:kick:rwx file1  
echo '随意设置一次setfacl权限 都会改变mask 所以说mask 是临时的改变'
[root@localhost script]# getfacl file1 
# file: file1
# owner: root
# group: root
user::rw-
user:kick:rwx
user:sour:rw-
group::r--
group:sour:rwx
mask::rwx
other::r--

[root@localhost script]# 


```
### 6. default

>default: 继承（默认） 
    要求： 希望 alice 能够对/home 以及以后在/home 下新建的文件有读、写、执行权限 
    
    思路： 
    步骤一： 赋予 alice 对/home 读、写、执行权限 
    [root@tianyun ~]# setfacl -R -m u:alice:rwx /home 
       
    步骤二： 赋予 alice 对以后在/home 下新建的文件有读、写、执行权限（使 alice 的权限继承） 
    [root@tianyun ~]# setfacl -m d:u:alice:rwx /home
