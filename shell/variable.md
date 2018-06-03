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

ip='www.baidu.com'
if ping -c  4 $ip &> /dev/null; then

    echo '$ip can connect so Network is OK'

else

   echo '$ip can not connect os Network is Down'
fi

# 在shell 里面调用Python 或者其他语言

# using pyton code
/usr/bin/python <<-EOF
print "hello word!"
print "Python carry out ing"
EOF

echo "Python 支持完毕"
```
