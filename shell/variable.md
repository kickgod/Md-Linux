Shell变量 精讲解析笔记<一>
=====
### 壹. 变量的立意
A .**定义变量**： 变量名=变量值 变量名必须以字母或下划线开头，区分大小写 
> 注释:变量的等号之间没有空格  
----
B .**引用变量**: $变量名 或 ${变量名} 

C .**变量小例子** 在shell 中执行Python
``` shell
#!/bin/bash
# Test is OK to Connect network

#ping -c 4  www.baidu.com > /dev/null  && echo "It is Scusseful to reach baidu website" || echo "whitout any wifi or userful nework"

echo -e "\e[1;32m进入程序开始";

ip='www.baidu.com'
if ping -c  4 $ip &> /dev/null; then

    echo 'Network is OK'

else

   echo 'Network is Down'
fi

echo -e "\e[1;32m请输入你的名称";
read name
echo 'Your Name is' ${name}

# using pyton code
/usr/bin/python <<-EOF
print "hello word!"
print "Python carry out ing"
EOF
echo "执行完毕"
echo -e "\e[1;37m";
```
D .**用户输入** read ip;用户输入 放入ip中
> `提示输入` read -p "Please input your name:" ip   #prompt 提示
---
### 贰 .环境变量 / 位置变量
> 1. 执行shell 输入变量 `[root@iZn4pjam1xnbipZ script]$ . VariableYi.sh haha haskjdha` 
``` shell
echo -e "\e[1;33m---程序开始---";

echo 'Your first variable is：' $1

echo 'Your second variable is:' $2

echo ‘执行完毕’

echo -e "\e[1;37m";
------------
[root@iZn4pjam1xnbipZ script]$ . VariableYi.sh haha haskjdha
---程序开始---
Your first variable is： haha
Your second variable is: haskjdha
‘执行完毕’

[root@iZn4pjam1xnbipZ script]$ 

```

