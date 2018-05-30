Linux 使用入门
====
> * Tab*2自动补全命令
### 零. 快捷键
> * Ctrl+C/D 停止运行当前程序/退出当前程序
> * Ctrl+L 清屏
> * Ctrl+A 跳到当前行最前端
> * Ctrl+E 跳到当前行最后端
> * Ctrl+U 删除光标前所有的字符
> * Ctrl+K 删除光标后所有的字符
> * Ctrl+S 删除光标后一个字符
> * Ctrl+R 搜索历史命令 利用关键字
### 壹. 基本使用
> * **!$** 引用上一个命令的最后一个参数 例如; 上一个命令 ls /home/user/ 输入 cs !$ 结果系统执行命令为 cd /home/user/ 成功跳到 /home/user 目录下
> * alias tianyun='cat /etc/sysconfig/network/script/ifcfg.eth0' [不能有空格 等号两边]
> * unalias tianyun 取消tianyun别名
> * alias 查看系统别名
> * [别名永久生效](https://blog.csdn.net/u013521296/article/details/77898908)
> * 系统中的需对的命令其实不是真正的系统命令而是带参数的系统命令,比如mv 命令其实 是一个命令别名 系统实际执行的是 mv -i 如果要用纯系统命令而不是别名命令可以使用 /bin/mv 或者使用\mv 也可以 所有的命令都在usr的bin文件下面 或者 bin64下面
> * type -a ls 查看命令类型
> * echo  alias catdire='cat /home/user/asd.txt' > /etc/bashrc 就可以吧catdire添加进系统文件永久别名
### 贰. ls命令查看列表
> 1. -a 隐藏目录
> 2. -l 长列表
> 3. h 人性化显示比如带下编程 k，m
> 4. -d 只查看目录名
> 5. -t  /time按照时间排序
> 6. -S /Sise 按照文件大小排序 大写
> 7. -r /reverse 逆序排序
> 8. -i 显示文件的索引号
