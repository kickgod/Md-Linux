Linux 用户和用户组 <零> 简记
====
### 用户操作基本命令
``` bash
 useradd:   添加用户 
 userdel:   删除用户 
 passwd:    设置密码 
 usermod:   修改用户(登录名，主目录等) 
 finger:    查看用户信息(此命令需安装： #yum install -y finger) 
 id:        查看用户UID,GID及所属用户组  
 su - :     切换用户
 ```
 ----
#### Useradd 添加新用户  命令参数  
 > * `-d` 设置主目录  
 > * `-g` group 设置该账号的组-主要组 主要组每个用户只有一个 不能把用户从主要组删除  
 > * `-s` 设置登录Shell  
 > * `-U` 设置ID
 > * `-p` 设置用户密码
 > * `-G` 设置该账号的组可以附属多个  
 > * 其他选项 man useradd  
 `添加新用户时，系统做了两件事`   
 `1.在/etc/passwd, /etc/shadow中分别添加一行数据`  
 `2.创建用户主目录: /home/用户`  
 #### passwd 修改用户密码 
 > * passwd 设置root 密码
 > * passwd username
 > * `-l`  锁定密码 #passwd –l  u1   #在文件/etc/shadow的密码区域前加上!!
 > * `-u`  密码解锁
 > * `-d`  设置密码为空 
 > *  `-S` 显示密码状态
##### 注意: 密码不能与账号相同
##### 注意: 密码必须八个字符以上
#### userdel [选项] 用户名 删除用户
 > * -r 删除用户极其主目录  userdel -r Kicker
 ```Shell
 #不能删除一个已登陆进系统的账户  删除账号前，必须先杀死属于指定账号的运行进程 
 ps  -aux | grep 'u1' 或者 
 find / -user username 
 kill -9 pid
 ```
 ----
 #### Usermod [选项] 用户ID  
 > 只有root用户可以使用此命令  
 ``` shell
usermod -L u1 #在文件/etc/shadow的密码区域前加上“!!” 
usermod -U u1 #删除文件/etc/shadow的密码区域前的“!!” 
usermod –d /home/u1234   u1
 ```
 #### finger [-s] 用户名 查询用户信息
 > 此命令需要安装 yum -y install finger  
 > -s 使用长传数据输出格式  
 > finger -s root  
 #### id [选项] 用户名
 > * -a 打印用户名 UID和用户所属的所有制
 > * -G 输出所有不同的组的ID(有效的)
 > * -g 输出有效的组ID  
 #### su 切换用户工具 、临时切换身份命令 
 > * su - 用户名 切换并且改变shell环境
 > * su  不加任何参数 默认切换到root
 > * sudo 一般切换为用有限制的sudo
