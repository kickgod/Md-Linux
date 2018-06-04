Linux 文件系统操作
====
> last update time：2018/6/4 12:28 
### 创建文件 touch
> 1. **`touch [path]/file_name`**  如果文件以及存在那么 就更新文件的时间 否则创建文件  
> 2. **`touch file1 file2`** 创建两个文件file1 file2 
> 3. **`{}`** 创建多个文件  touch path/file{,1,2,3}.txt 会创建 file.txt file1.txt file2.txt file3.txt  
----
### 复制文件 cp  语法: cp 被复制文件路径/name   新文件路径/newname  
> 1 .参数 -v 限制复制信息  
> 2 .参数 -r 递归复制文件  
> 注释:使用cp `一般 -rv 参数` 最为常用
----
### 移动文件 mv 旧地址 新地址
```shell
# mv file1 /home/dir3                       将 file2 移动到/home/dir3 
# mv file2 /home/dir3/file20                将 file2 移动到/home/dir3，并改名为 file20 
# mv file4 file5                            将 file4 重命名为 file5，当前位置的移动就是重命名 
```
### 删除文件 rm 路径  参数: -r 递归 -f force 强制 -v 详细过程 -i 询问你是否删除
* 1 .rm -rf * 或者 rm -rf / 传说中的删库到跑路 
* 2 .rm -rfi \*.pdf 删除以pdf结尾的文件  后面可以跟正则表达式
---
### 查看文件内容 cat / grep / vi vim 
```bash
less  more head  tail  
#查看文件前面一部分 大部分  头部  尾部 十行
[root@tianyun ~]# head  /etc/passwd
[root@tianyun ~]# head -2 /etc/passwd 查看前面两行 
[root@tianyun ~]# tail /etc/passwd 
[root@tianyun ~]# tail -1 /etc/passwd 查看倒数第一行
[root@tianyun ~]# tail /var/log/messages 
[root@tianyun ~]# tail -20 /var/log/messages 
[root@tianyun ~]# tail -f /var/log/secure         //-f 动态查看文件的尾部 
[root@tianyun ~]# tail -F /var/log/secure            //-F 动态查看文件的尾部
grep 针对文件内容进行过滤 
# grep 'root' /etc/passwd 
# grep '^root' /etc/passwd 
# grep 'bash$' /etc/passwd 
# grep 'failure' /var/log/secure
```
