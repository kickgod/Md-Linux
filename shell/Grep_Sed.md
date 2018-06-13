Linux sed  grep
====
### 一.grep 命令 全局搜索
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
### 二.Sed 编辑器
`sed 是一种在线的、非交互式的编辑器，它一次处理一行内容。处理时，把当前处理的行存 储在临时缓冲区 中`
<br/>
`称为“模式空间”（pattern space），接着用 sed 命令
处理缓冲区中的内容，处理完成后， 把缓冲区的内容 送往屏幕。`
<br/>
`接着处理下一行，这样不断重复，直到文件末尾。文件内容并没有改变，除非你 使用重定向存储输出。`
<br/> 
`Sed 主要用来自动编辑一个或多个文件；简化对文件的反复操作；编写转换程序等`  

----
![sed工作模式](/Image/sed.png)
##### sed 和 grep 不一样，不管是否找到指定的模式，它的退出状态都是 0  
```
 命令格式
 sed [options] 'command' file(s) 
 sed [options] -f scriptfile file(s) 
```
##### 支持正则表达式
* 与 grep 一样，sed 在文件中查找模式时也可以使用正则表达式(RE)和各种元字符。正则表达 式是 括在斜杠间的模式，用于查找和替换，以下是 sed 支持的元字符。 
* 使用基本元字符集 ^, $, ., \*, [], [^], \< \>,\(\),\{\} 
* 使用扩展元字符集 ?, +, { }, |, ( )
#### 1. 实例
* sed -r '/root/p' /etc/passwd `打印所有行 但是吧带有root的行打印两次 因为sed 会输出一次  然后匹配到了 命令p 还有在打印一次 使用-n可以静默sed的输出`
* sed -r  -n '/root/p' passwd  `只打印带有root的行`
* sed -r 's/root/JiangXingKanZheLi-----------/gi' passwd 将root 替换为JiangX... 然后输出出来 gi全问匹配 忽略大小写
* sed -r 's#root#JiangXingKanZheLi-----------#gi' passwd  和上面一样 只是分隔符不同  防止内容里面包含/
* sed -r 's#root#JiangXingKanZheLi-----------#gi p' passwd  替换后打印出来 替换的那几行
#### 2. 定址 确定处理的行的范围
* 1. 默认是全部行
```
 sed -r 'd' passwd 删除所有行 无输出
 sed -r '3d' passwd 删除第三行 
  sed -r '3，5d' passwd 删除三到五行 
```
### 4.命令 
* `d` 删除 delete
* `p` 打印 print
### 4.参数
* `-r` `支持扩展元字符`
* `-n` `静默工作方式 使用正表达式的时候不打印未匹配的`
* `-p` `打印匹配的结果` 
