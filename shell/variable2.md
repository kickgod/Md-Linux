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
* 1  " " 双引号 弱引用 引用变量 变量里面还是变量 但是如果是一条命令缺不会执行
* 2  ' ' 强引用  变量引用还是原来的符号
``` bash
[root@tianyun ~]# school=1000phone 
[root@tianyun ~]# echo "${school} is good" 1000phone is good 
1000phone is good 1000phone is good
[root@tianyun ~]# echo '${school} is good' ${school} is good
${school} is good 1000phone is good
```
### 伍 .变量的替换和删除于其他操作 
* 1 .获取字符串长度Length： ${#string}
* 2 .删除匹配
----
  >`url=www.sina.com.cn`  
  > echo ${url#\*.} 从前往后，最短匹配   
  > echo ${url##\*.} 从前往后，最长匹配 贪婪匹配  
  > echo ${url%.\*}  从后往前，最短匹配 www.sina.com  
  > echo ${url%%.\*} 从后往前，最长匹配 贪婪匹配www   
  > `#向前匹配 %向后匹配 *任意字符`
---
* 3 .切片操作 ${url:index_start:index_end} / ${url:index_start}
---
> echo ${url:0:5} # www.s  
> echo ${url:10} # om.cn
---
* 4 .内容替换操作 ${val/n/N} ${val//n/N} 前面短匹配   后面贪婪匹配  替换搜索
> val="www.sima.com.cn"        
> echo ${val/sina/SINA}  #www.SINA.com.cn    
> echo ${val/w/W}  #www.sina.com.cn    
> echo ${val//w/W} #WWW.sina.com.cn    
> echo ${val/%w/W} 从开头替换  
> echo ${val/%w/W} 从结尾开始替换  
* 5 .${变量名:-新的变量值}   变量没有被赋值：会使用“新的变量值“ 替代 变量有被赋值（包括空值）： 不会被替代 
> \- 符号的作用   echo ${vals:-1513215} 如果vals未赋值 那么输出 1513215 但是vals任然为空 否则为vals的值  
---
* 6 .${变量名:=新的变量值}   变量存在且未被赋值：变量被复制为新值并且输出 
> = 符号的作用   echo ${vals:-1513215} vals如果已经赋值那么不改变 否则vals值为1513215
---











