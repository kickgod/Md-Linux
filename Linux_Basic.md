Linux 使用入门
====
> * Tab* 2自动补全命令
### 零. 快捷键
> * Ctrl+C/D 停止运行当前程序/退出当前程序
> * Ctrl+L 清屏
> * Ctrl+A 跳到当前行最前端
> * Ctrl+E 跳到当前行最后端
> * Ctrl+U 删除光标前所有的字符
> * Ctrl+K 删除光标后所有的字符
> * Ctrl+D/d 删除光标后一个字符
> * Ctrl+R 搜索历史命令 利用关键字
### 壹. 基本使用
> * **!$** 引用上一个命令的最后一个参数 例如; 上一个命令 ls /home/user/ 输入 cs !$ 结果系统执行命令为 cd /home/user/ 成功跳到 /home/user 目录下
> * **$?** 返回上一个命令执行的结果 如果执行成功返回 true 0 否则失败 false 1
> * alias tianyun='cat /etc/sysconfig/network/script/ifcfg.eth0' [不能有空格 等号两边]
> * unalias tianyun 取消tianyun别名
> * alias 查看系统别名
> * [别名永久生效](https://blog.csdn.net/u013521296/article/details/77898908)
> * 系统中的需对的命令其实不是真正的系统命令而是带参数的系统命令,比如mv 命令其实 是一个命令别名 系统实际执行的是 mv -i 如果要用纯系统命令而不是别名命令可以使用 /bin/mv 或者使用\mv 也可以 所有的命令都在usr的bin文件下面 或者 bin64下面
> * type -a ls 查看命令类型
> * echo  alias catdire='cat /home/user/asd.txt' > /etc/bashrc 就可以吧catdire添加进系统文件永久别名
> * echo * 输出当前文件夹下面的所有文件名
> * echo "信息" > li.txt 将li.txt里面的所有文字信息替换成信息
> * echo "信息" >> li.txt 在li.txt 里面追加信息
### 贰. ls命令查看列表
> 1. -a 隐藏目录
> 2. -l 长列表
> 3. h 人性化显示比如带下编程 k，m
> 4. -d 只查看目录名
> 5. -t  /time按照时间排序
> 6. -S /Sise 按照文件大小排序 大写
> 7. -r /reverse 逆序排序
> 8. -i 显示文件的索引号
### 叁 .date 命令
> 1. date 显示日期默认格式  
> 2. date +%F 月-日-年 显示样式
> 3. date +%A 显示英文星期几
> 4. date +%Y 得到年 +%H 得到小时 +%d 得到日 +%m 得到月 +%M 得到分钟
> **创建以日期参与命名的文件名称  例如:touch `data +%F`file.txt 记住是分号** 结果 2018-05-31file.txt
### 肆 .man命令的使用
> 1. man -f passwd #列出所有章节的passwd  
> 2. man -a passwd #在所有章节查找
### 武 .cat的使用 --一点点重定向 < >
> 1. cat /path...查看文件
> 2. cat < /path... 和一一样 吧文件里面东西传递给cat  然后cat 打印给 屏幕
> 3. cat </pate.. > /etc/host1 吧文件里面东西传递给cat 然后cat 打印给 /etc/host1文件里面  完成单文本文件复制
> 4. EOF cat 范围 导入
----
``` Shell
[root@iZn4pjam1xnbipZ script]# cat  <<-EOF
> 123456
> 456789
> EOF
123456
456789
[root@iZn4pjam1xnbipZ script]# 
```
> #EOF 标识  可以换任意字符 例如@@ 减号 -可有可没有 如果没有最下面的EOF 必须对对齐左边 否则 可以不对齐左边
----
``` Shell
[root@iZn4pjam1xnbipZ script]# cat <<-@@ > inner.txt
> 你好啊！
> 我创建了一个文本
> 创建时间: `date +%F`
> @@
[root@iZn4pjam1xnbipZ script]# ls inner.txt 
inner.txt
[root@iZn4pjam1xnbipZ script]# cat inner.txt 
你好啊！
我创建了一个文本
创建时间: 2018-06-02
```
> 将cat 的输入 导入一个新创建的文件夹里面去

### 牛 .管道
> 1. tee 管道 
----
``` Shell
[root@iZn4pjam1xnbipZ script]# date > date.txt
[root@iZn4pjam1xnbipZ script]# date | tee date1.txt
Sat Jun  2 19:04:36 CST 2018
[root@iZn4pjam1xnbipZ script]# 
```
> 2. grep
>> ip addr |grep 'inet' |grep eth0 查看etho网卡的IP地址
### 旗 .;; 分号 && 命令排序执行
> 1 ; ./config;mkdir user;ls 
>> A.当./config命令 无论成功与否 于后面的执行无法   ./config不成功 mkdir user 任然执行 ls任然执行 三者无关
> 2 && ./config;mkdir user;ls 
>> A.第一条命令成功后第二条才会执行  否则不执行  
> 3. || > 1 ./config||mkdir user||ls 
>> A. 只要前面命令失败后面的命令才会执行
### 霸 . 元字符
> **\*** 通配符 任意字符 任意多个  
> **?** 匹配一个或者零个任意字符  
> **[]** [0-9] 匹配任意数字 [a-z] 匹配任意小写字母 [A-Z] 匹配任意大写字母  
> **[^]** [^0-9] 不能是数字 [^0-9a-zA-Z] 不能使数字大小写字母  
> **{}** 创建一个集合  mkdir {a..b}{1..3} 就会创建 a1,a2,a3,b1,b2....  
>> A {asd,a,sd} 三个值  
>> B {,sd} 两个值   
> **\** 转义 mkdir tian\ yun  将会创建一个文件 tian yun  中间的空格不再是分隔符的意思 而是被转义成为了一个字符串  
> **()** 在子Shell中执行  
### 酒 . echo 

> 1. echo -e "\e[1;31mThis is red text]"; #颜色范围31-37 
-----
### 狮 .设置控制台颜色 

   0：控制台支持的颜色:black red green yellow blue magnta cyan white

   1 .  设置控制台字体颜色  命令: setterm -foreground color_name    

        例如- 设置字体颜色为绿色: setterm -foreground green 

   2 . 设置控制台背景颜色  命令:setterm -background color_name   

        例如- 设置背景颜色为绿色: setterm -background green

   3. 交换背景色和前景色  [将字体和背景色交换]

        setterm -inversescreen -on/off

   4. -reset 将终端外观恢复成默认设置并清屏

   5. -store 将终端当前的前景色和后景色设置成-reset选项的值
 
