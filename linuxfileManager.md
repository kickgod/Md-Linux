Linux文件系统 文件权限 文件管理
===
## 一  文件系统
###  文件查找  find命令的详解: [find 命令](https://zhidao.baidu.com/question/490058098582576932.html)
* -name：按照文件名查找文件。
* -type 查找某一类型的文件，诸如：
b - 块设备文件。
d - 目录。
c - 字符设备文件。
p - 管道文件。
l - 符号链接文件。
f - 普通文件。
* -user： 按照文件属主来查找文件。
* -group：按照文件所属的组来查找文件。
### 二 文本文件统计命名 **wc** 命令参数
* -c，bytes打印字节数
* -m，chars打印字符数  
* -l，lines将打印新行计数
* -L，--max-line-length打印最长行的长度
* -w，--words打印字数
----
### 三 文件搜索命令 grep 表达式 /目录
* grep 'root' /etc/passwd 搜索带有root的行 可以跟正则表达式
* grep '^root' /etc/passwd 搜索以root开始的行 可以跟正则表达式
---
### 四 命令位置查看 which
* type -a 命令  查看命令所在位置
* which 命令  查看命令所在位置

