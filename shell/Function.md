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
 ### 函数返回值2
 * return 无法自由返回字符串 数值 等等
 * 这个时候我们使用输出 echo 把函数执行结果复制给变量
 ```shell
 Name="JxKicker";


function getName {
    Name='User'
    echo $Name 
}

Name=`getName`
echo "name:" $Name
输出
Name: User
```
* `这样就能够正常返回结果了`
### 函数的参数
* 值参数
```shell
fun3(){
    let result=$1*$2*$3;
    echo $result;
}

echo `fun3 1 2 3`

. Function.sh  2 3 4
输出 结果
6

如果要实现2*3*4
调用方式
echo `fun3 $1 $2 $3`
```
* 数组作为参数 利用 $@获取所有参数 利用 for val in $@ 遍历所有参数
```shell

fun3(){
   local result=1;
   for val in $@
   do
     let result=$result*$val;
   done
   echo $result;
}

echo `fun3 $@`




[root@localhost script]# . Function.sh  2 3 4
开始执行
24
执行完毕

[root@localhost script]# . Function.sh  2 3 4 5 6 7
开始执行
5040
执行完毕

--------------------------------------------
fun3(){
   local arraylist=($*) #数组复赋值
   local result=1;
   for val in ${arraylist[@]}
   do
     let result=$result*$val;
   done
   echo $result;
}

Array=(1 2 3 4 5 6 7)

echo `fun3 ${Array[*]}`

```
* 如果需要返回数组 那么只需要 echo ${Array[\*]} 即可

### 函数的变量
* 函数内部使用local 修饰成为本地变量


