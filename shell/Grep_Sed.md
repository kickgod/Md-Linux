Linux sed  grep
====
### grep 命令 全局搜索
> grep  :在文件中全局查找指定的正则表达式,并且打印所有包含该表达式的行  
> egrep :扩展的grep ，支持更多的正则表达式元字符  
> fgrep :固定的grep 不支持正则表达式  
*  grep 的返回
```shell 
   找到            grep 返回的退出状态为0
   没找到          grep 返回的退出状态为1
   找不到指定的文件 grep 返回的退出状态为2
```
#### 命令参数
* -q   解释:slient 静默方式  只需要返回值 不需要输出
* -E 达到egrep的扩展作用
* -v 对结果进行取反   # grep -v '^#' /etc/list.conf 查找非#开头的行
* -i 忽略大小写
* -R -r过滤一个目录下面的所有行
* -o 只显示查找的内容 不显示整行
* -B before 后几行  # grep -B3  '^root' /etc/list.conf 目标行的后三行
* -A after后几行  # grep -a3  '^root' /etc/list.conf 目标行的前三行
* -C content上下几行   # grep -C3  '^root' /etc/list.conf 目标行的上下三行
* -n 显示结果的行号
#### 使用
* > #grep Tome 
* > #ll | grep "sshd"
* > grep "alice" /etc/passwd /etc/shadow/etc/group 从三个文件中过滤Alice
----
`sed 是一种在线的、非交互式的编辑器，它一次处理一行内容。处理时，把当前处理的行存 储在临时缓冲区 中，称为“模式空间”（pattern space），接着用 sed 命令
处理缓冲区中的内容，处理完成后， 把缓冲区的内容 送往屏幕。接着处理下一行，这样不断重复，直到文件末尾。文件内容并没有改变，除非你 使用重定向存储输出。 
Sed 主要用来自动编辑一个或多个文件；简化对文件的反复操作；编写转换程序等`  
