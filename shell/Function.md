Shell 函数
====
>`传参 $1,$2 变量 local 返回值 return $?` 
`完成特定功能的代码片段（块） 在 shell 中定义函数可以使用代码模块化，便于复用代码 函数必须先定义才可以使用`
 1. 声明方法  
 函数名() {  
 函数要实现的功能代码  
 }  
 2. 声明方法2  
 function 函数名 {  
 函数要实现的功能代码  
 }  
 ### 1.定义一个函数
 ```shell
 Sum(){
   result=1;
   for i in $(seq 1 $1)
   do
      let result=$i*$result
   done
   echo $result;
}

Sum $1 ;
 ```
 > 调用函数就如同调用shell一样   函数参数使用$1 $2  
 > 如果需要把调用shell的$1 $2传递给函数 需要在调用时  函数名称 $! $2 如果不在调用函数时传递  那么函数调用出错
 > 如同上面 Sum $1 如果没有传递$1 函数执行内部$1为空 
 
 ### 函数调用
 * `函数调用不需要加上小括号()`
 * `函数名 参数1 参数2... 函数内部通过 $1 $2 $3..调用参数`
 *  函数使用shell中的参数 如果使用 $Name 访问则 无法改变其值  如果直接变量名=值 那么只能在函数内部改变其值  无法改变外部的值
 ```shell
 Name="JxKicker";
function getName {
    let $Name='User'
    echo $Name 
}
echo  $Name
getName
echo $?
###输出
 6
JxKicker
JxKicker
0
```
---
 ```shell
 Name="JxKicker";
function getName {
    Name='User'
    echo $Name 
}
echo  $Name
getName
echo $?
###输出
 6
User
JxKicker
0
```
 ### 函数的返回值
 * 默认情况下:函数的返回值是最后一条命令的状态吗 0或1
 * 如果需要函数的数值返回 使用return 数值  最大返回255 超过二进制截取
 * 但是无法返回字符串 
 ```shell
 function getName {
    let $Name='User'
    echo $Name 
    return ${#Name};
}

echo  $Name
getName
echo $?
###输出
6
JxKicker
JxKicker
8

 ```
