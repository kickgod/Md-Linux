Shell变量 精讲解析笔记<一>
=====
### 壹. 变量的立意
A .**定义变量**： 变量名=变量值 变量名必须以字母或下划线开头，区分大小写 
> 注释:变量的等号之间没有空格  
----
B .**引用变量**: $变量名 或 ${变量名} 

C .**变量小例子** 在shell 中执行Python
``` shell
#!/bin/bash
# Test is OK to Connect network

#ping -c 4  www.baidu.com > /dev/null  && echo "It is Scusseful to reach baidu website" || echo "whitout any wifi or userful nework"

echo -e "\e[1;32m进入程序开始";

ip='www.baidu.com'
if ping -c  4 $ip &> /dev/null; then

    echo 'Network is OK'

else

   echo 'Network is Down'
fi

echo -e "\e[1;32m请输入你的名称";
read name
echo 'Your Name is' ${name}

# using pyton code
/usr/bin/python <<-EOF
print "hello word!"
print "Python carry out ing"
EOF
echo "执行完毕"
echo -e "\e[1;37m";
```
D .**用户输入** read ip;用户输入 放入ip中
> `提示输入` read -p "Please input your name:" ip   #prompt 提示 如果多个变量 ip name 中间用空格隔开  
----
E .**查看环境变量**： echo $变量名 env 例如 env |grep back_dir2  
F .**取消环境变量**： unset 变量名
>
---
### 贰 .环境变量 / 位置变量
> 0. export 查看环境变量
---
 * 1.$PATH  查看路径
 * 2.$USER  查看当前用户
 * 3.$UID   查看当前用户ID
 * 4.$SHELL 查看当前shell
---
> 1. 执行shell 输入变量 `[root@iZn4pjam1xnbipZ script]$ . VariableYi.sh haha haskjdha` 
``` shell
echo -e "\e[1;33m---程序开始---";

echo 'Your first variable is：' $1

echo 'Your second variable is:' $2

echo ‘执行完毕’

echo -e "\e[1;37m";
------------
[root@iZn4pjam1xnbipZ script]$ . VariableYi.sh haha haskjdha
---程序开始---
Your first variable is： haha
Your second variable is: haskjdha
‘执行完毕’

[root@iZn4pjam1xnbipZ script]$ 
```
> 2. 作用范围： 仅在当前 shell 中有效 
> 3. 实现多个Shell公共工作 ,使用 . 或者 source 执行shell 在当前shell 执行shell  当前shell 环境就可以获得执行shell 中的变量
> 如此这样当多个脚本使用的时候,如果需要更改变量那么就不需要更改每个文件里面的变量 这样只需要更改一个变量就可以更改每个文件的变量
----
![Pulic shell](/Image/publicsh.png)
* 实例
> Public.sh
``` shell
#!/bin/bash

# define last update time

 last_update_time='2018/6/3';

# define commit personCount

  join_person_count=3

# define password 

  password='2016110418'

# efine Id List

  ID_Jx='2018001'
  ID_LMC='2018002'
```
----
> login.sh
``` shell
#!/bin/bash

 . Public.sh

 echo -e "\e[1;32m程序开始";

 echo '密码为:'  $password

 echo "程序结束"
 echo -e "\e[1;37m";
``` 
``` bash
[root@iZn4pjam1xnbipZ script]$ vim Public.sh
[root@iZn4pjam1xnbipZ script]$ vim login.sh
[root@iZn4pjam1xnbipZ script]$ . login.sh
程序开始
密码为: 2016110418
程序结束

[root@iZn4pjam1xnbipZ script]$ 
          
```
---
* 3 .位置变量 $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} 
 
* 4 .预定义变量  
> . $0 脚本名   
> . $* 所有的参数   
> . $@ 所有的参数   可以当数组用  
> . $# 参数的个数    
> . $$ 当前进程的 PID   
> . $! 上一个`后台`进程的 PID   
> . $? 上一个命令的返回值 0 表示成功  
### 弎. $() 
* 1 .获取命令执行结果 $(ls -l /) 获取执行结果
### 肆. 变量运算
* 1 .expr  r=`expr 1+2`    不是分号 是 Esc键下面的 符号   #expression 表达 表达式 完全不同意的方式 遭人厌 垃圾设计
* 2 .$(()) 乘法 $((8\*8)) =64 取余 $((8%2))=0  $((2\*\*10)) 2的10次方  
---
> $ num1=20;num2=30  
> $ echo $(($num1+$num2))  
> 50  
---
* 3 .$[] 例子:$[2+5] $[7\*8]
``` shell
   #get how many neicun  being use 
   $ free -m | grep '^Mem'| awk '{print $3}'
   272
```
* 4 .let 例子 let sum=3+5，let i++;
* 5 . 小数运算 
---
> 例子:
*  echo "2\*4" |bc 
*  echo "2^4" |bc 
*  echo "scale=2;6/4" |bc #scale 控制进度  
*  awk 'BEGIN{print 1/2}'  $awk 使用 BEGIN 
*  echo "print 5.0/2" |python 
---
* 6 .let i++ let ++i 不谈 太简单了
