Linux 命.令
----
命令格式: `#command [-/--option] [arguments]`----> `命令 选项 参数`</br>

**`注意`**:
* `单字符参数用 - , 单词参数使用 -- `  `例如:ll -a;top --help`</br>
* `Linux 区分大小写`
#### man命令手册
> 手册有多个部分,默认显示 第1部分  一般模式命令是 man passwd 但是实际上执行为 man 1 passwd
* 1：Executable programs or shell commands  命令使用文档   
* 2：System calls 系统调用,如open,write之类的(通过这个，至少可以很方便 的查到调用这个函数，需要加什么头文件)  
* 3：Library calls 库函数,如printf,fread4是特殊文件,也就是/dev下的各种设 备文件  
* 4：Special files 特殊文件
* 5：File formats and conventions  文件的格式,比如passwd, 就会说明这个 文件中各个字段的含义  
* 6：Games 游戏,由各个游戏自己定义   
* 7：Miscellaneous 附件还有一些变量,比如向environ这种全局变量在这里就 有说明   
* 8：System administration commands系统管理用的命令,这些命令只能由 root使用,如ifconfig   
##### **`如：#man 5 passwd 若没有第5部分：安装 #yum install man-pages `**

|按键| Man page:  操作 |
|------|-----|
|Space| 向下翻一页 |
|[Page Down]| 向下翻一页，↓为向下一行 |
|[Page Up] |向上翻一页，↑为向上一行 [Home]或g 到第一页 [End]或G 到最后一页 |
|/string| 向『下』搜寻 string 字符串，如 /unique ，搜寻unique |
|?string| 向『上』搜寻 string字符串 |
|n, N| 利用 / 或 ? 來搜寻字符串时，用 n 来继续下一个搜寻 (不论是 / 或 ?) ， 利用 N 进行『反向』搜寻。举例來说，我以 /unique 搜寻 unique， 可以按n 继续往下查询，用 N 往上查询。若以 ? unique 向上查询 unique， 那可以用 n 继续『往上』查询，用 N 反向查询。| 
|q |退出 man page |
#### 登陆注销
注销命令
* Logout
* Exit
* Ctrl+D

重启
* reboot

关机:`shutdown [options] time [warning  message]`
* shutdown now   # 立即关机 
* shutdown +2   # 2 min 后关机
* shutdown –r now  #重启计算机 
* shutdown –h 17:00  # 下午5点关机并关闭电
#### 查看系统运行级别
**`命令:runlevel`**
#### 复制文件
* cp [option] [源文件或目录] [目标文件或目录] 
  * `-i` : `如果文件将会覆盖你的目标中的文件，提示确认。` 
  * `-r` : `递归复制整个目录树、子目录及其它，此时目标文件必须是一个 目录名` 
  * `-v` : `详细显示文件的复制进度`
#### 删除文件
* rm [option]  filename 
  * -i: interactive 确认删除，避免误删文件。
  * -f : force  强制删除,不提示地删除 
  * -v: view  显示文件的删除进度。  
  * -r : recursion 递归删除
#### 双向重定向保存文档 
>  同时将数据流发送到文件和屏幕（标准输出）  **tee**
* #cat 1.txt | tee 3.txt 完成后3.txt会有1.txt的内容
#### 文件链接
> `在Linux的文件系统中，保存在磁盘分区中的文件不管是什么类型都 给它分配一个编号，称为索引节点号(Inode Index)。` 
* 1、硬连接(Hard link)： 
  * 多个文件名指向同一索引节点, 这种连接就是硬连接 
  * 作用：允许一个文件拥有多个有效路径名，以防止‚误删 
  * 只有当所有硬连接被删除后，文件的数据块及目录的连接才会被释放  
```
建立硬链接【In 命令】: ln  /var/www/html/test.css    /root/linktest 
```
* 2.软连接(Soft link)：   
  * 软链接文件即快捷方式 
  * 它是一个特殊的文件,其中包含的有另一文件的位置信息 
```
建立软链接【In 命令 -s 表示软链接】: ln -s /var/www/html/test.css    /root/linktest 
```
#### 查看或者合并文件 cat
* cat [选项] [文件名] 
  * 1.一次显示整个文件   # cat file1 
  * 2.从键盘创建一个文件  # cat > file1      
  * 只能创建新文件,不能编辑已有文件    [Ctrl ]+D 退出创建 
  * 3.将几个文件合并为一个文件：  #cat file1 file2 > file3 
  * 4.向已有文件追加内容  #cat 'aabb' >> file3 
  * 5.重定向输入已有文件  #cat > file1 << EOF 
#### 管道(pipes) :  | 
> `把前一个命令的标准输出作为下一个命令的标准输入. `
* (管道)参数传递命令：xargs 
  * #ls test | cat 
  * #ls test | xargs cat  #cat test  
```
    1.txt 文件中有三个字符串 111 222 333 
    cat 1.txt | xargs  echo 
    输出:111 222 333 

    cat 1.txt | xargs  echo 
    输出
    cat: 111:: No such file or directory
    cat: 222:: No such file or directory
    cat: 333:: No such file or directory

   cat 查看文件
   解释: xargs  是一个输出一个输出的传输
```
* #echo "--help" | cat 
* #echo "--help" | xargs cat
#### 查看文件中的行数、字数和字符数 
* wc  [文件名] 
  * -l   `统计文件中的行数 `
  * -c   `统计文件中的字符个数` 
  * -w   `统计文件中的单词个数` 
#### 解压打包 vf 常在 x解压 c 打包
* 解包：#tar xvf FileName.tar `解压`
* 打包：#tar cvf FileName.tar DirNam  `compression 压缩`
