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
----
**`命令:runlevel`**
