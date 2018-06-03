Shell变量 精讲解析笔记<二>
=====
### 壹 .参数的故事
* 要求用户必须输入几个参数 否则提示 要求有三个参数 $# 参数个数  $@ 所有参数
``` shell
#!/bin/bash

#must hava tree variable

 echo -e "\e[1;32m程序开始";

 if [ $# -eq 3 ]; then

   echo 'input variabilitise are : ' $@   

 else
   echo "your input:" $@ '个数:' $#

   echo 'please in put three variabilities'

 fi;

 echo "程序结束"

echo -e "\e[1;37m";
```
### 贰 .变量的赋值
> * 1. 变量名=变量值
> * 2. read -p "prompt title" value  变量提示用户输入  
> * 3. 反引号 命令替换： data="date +%F" 实际上 data=date +%F  使用``变量替换 data=`date +%F` 实际上 data=2018-6-3 当前时间  
> * 4. read -t 5 -p "title" value 等待五秒
### 山 .变量的引用 符号
* 1. " " 双引号 弱引用 引用变量 变量里面还是变量 但是如果是一条命令缺不会执行
* 2. ' ' 强引用  变量引用还是原来的符号
``` bash
[root@tianyun ~]# school=1000phone 
[root@tianyun ~]# echo "${school} is good" 1000phone is good 
1000phone is good 1000phone is good
[root@tianyun ~]# echo '${school} is good' ${school} is good
${school} is good 1000phone is good
```
