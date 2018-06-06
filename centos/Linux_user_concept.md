Linux 用户和用户组概念 
====
##### 用户文件:/etc/passwd  root：x:0:0:root:/root:/bin/bash x:密码占位符 /root 用户目录  
##### 密码文件:/etc/shadow  root:$6$UhbYN.... 存放密码信息 但是并非明文 为加密后的密码 加密算法$id： $1:  MD5 $5:  SHA-256 $6:  SHA-51
##### 组信息  :/etc/group   kick：x:1000:   存放用户组文件
##### 系统约定： centos6  uid: 0  特权用户 uid: 1~499   系统用户 uid: 500+    普通用户
##### 如果创建一个用户时，未指定任何组（主组或附加组），系统会创建一个和用户名相同的组作为用户的 Primary Group. 
![用户组](/Image/user_group.png)
