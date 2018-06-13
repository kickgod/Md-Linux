Linux sed  grep
====
### 一.[grep](http://man.linuxde.net/grep) 命令 全局搜索
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
### 二.[Sed](http://man.linuxde.net/sed) 编辑器
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
 
 sed -rn '1,5p' /script/passwd  打印1~5行
 
 sed -r '/root/,5d' passwd  从匹配的行 删除到第五行 
 
 sed -r '/root/,+5d' passwd  从匹配的行 再向下删除5行 加上自己正好6行
 
 sed -r '1~2d' passwd 删除所有的奇数行
 
 sed -r '0~2d' passwd 删除所有的偶数行
 
 sed -r '0~3d' passwd 删除所有的偶数行 从0开始 每隔三个删除一个
```
------
### 4.命令 
* `d` 删除 delete $表示最后一行
>  sed -r '3d' passwd 删除第三行 
* `p` 打印 print
>  sed -r '3p' passwd 打印第三行 
* `a` 在当前行后面添加一行或者多行 add
>  sed -r '1a\asdasdasdasdasdasd' passwd  在第一行后面再添加一行 内容为asdasdasdasdasdasd
>  sed -r 'a\   ' passwd 在每一行的后面后面加一个空行
* `c` 用新文本修改(替换)当前行中的文本 cover 覆盖
>  sed -r '2c11111111111111111' passwd 将第二行换成1111111111111111111
>  sed -r `2s/.*/1111111111111/` passwd 也可以完成
* `s` 匹配替换文本
>  sed -r 's#root#aaa#' passwd 在root后面加上aaa 或者  
>  sed -r 's/(.)(.)(.\*)/\1YYY\2\3/' passwd  利用()分组在每一行的第二字符后面加上YYY
* `i` 在当前行之前插入文本 INSERT
>  sed -r '2i11111111111111111' passwd 在第二行前面插入一行111111111111111111111
* `l` 列出非打印字符 list
>  sed -rn '1,3l' passwd 打印出1到3行的非字符串
* `n` 读取下一输出行 并从下一条命令而不是第一条命令开始对其处理 next
>  sed -r 'd/adm/{n;d}' passwd 删除具有adm哪行的下一行 
>  sed -rn '/adm/{n;s/sbin/#####/;p}' passwd 对于具有adm的哪一行的下一行里面的sbin替换为#####然后再打印出来  
* `q` 结束或者退出sed quit
>  sed -r '3q' passwd 第三行的时候退出  
* `!` 取反 对所选的行以外的其他行应用命令
>  sed -r '3!d' passwd 除了第三行 其他的都删除了 
* `g` 在行内进行全局替换 global 
* `i` 忽略大小写 ignore
>  sed -r `2r list` passwd 读到第二行的时候 将其写入passwd文件读入  
* `r` 从文件中读  read
>  sed -r `2r /etc/host` passwd 读到第二行的时候 将/etc/host文件读入  
* `e` 废材 多编辑
>  sed -r -e '1,3d' -e 's/Halle/root/' passwd 1-3行删除  然后替换Halle为root
>  sed -r '1,3d;s/halle/root' passwd 完成e的功能
```
h 把模式空间里的内容复制到暂存缓冲区(覆盖) 
H 把模式空间里的内容追加到暂存缓冲区  

sed -r '1h，$G' passwd 将第一行复制到最后一行  
sed -r '1{h;d}，$G' passwd 将第一行剪切到最后一行
sed -r '1h;2,3H;$G' passwd  将1~3行 复制到最后面去

g 取出暂存缓冲区的内容，将其复制到模式空间，覆盖该处原有内容 
G 取出暂存缓冲区的内容，将其复制到模式空间，追加在原有内容后面 
x 交换暂存缓冲区与模式空间的内
```
* `w` 将行写入文件 

-------------
``` shell
  1.{} 对一行进行多命令处理
  sed -rn '3{p;d}' passwd 打印第三行  然后再删除它 
  
  2.$表示最后一行
  sed -rn '3,${p;d}' passwd 打印第三行到最后一行  再删除
  
  3.下面是错误的 d应该放在{} sed -r 'd/adm/{n;d}' passwd 
  sed -r 'd/adm/{n}d' passwd 
```
-----
### 4.参数
* `-r` `支持扩展元字符`
* `-n` `静默工作方式 使用正表达式的时候不打印未匹配的`
* `-p` `打印匹配的结果` 
* `-i` `你所做的一切都会在文件中生效 就地编辑` 
