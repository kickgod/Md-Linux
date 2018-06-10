Shell 数组
====
### 定义普通数组： 方法一
```shell
 #一次赋一个值 
 #数组名[下标]=变量值 
 
 index=0;

 array[0]="name";
 array[1]="age";
 array[2]="sex";

 #遍历数组

 for index in {0..2}
 do
  echo ${array[$index]}
 done
```
### 定义普通数组： 方法二
```shell
 一次赋多个值
 # array2=(tom jack alice) 
 # array3=(`cat /etc/passwd`) 希望是将该文件中的每一个行作为一个元数赋 值给数组 array3 
 # array4=(`ls /var/ftp/Shell/for*`) 
 # array5=(tom jack alice "bash shell") 
 # colors=($red $blue $green $recolor) 
 # array5=(1 2 3 4 5 6 7 "linux shell" [20]=puppet)
```
``` shell
 #遍历更目录文件名称
 dirlist=(`ls /`);
 starts=0;
 last=${#dirlist[@]};

 echo $last 

 for starts in $(seq 0 $last)
 do
   echo  ${dirlist[$starts]}
 done

```
### 3. 数组声明 declare 
* declare -A 声明关联数组
* declare -a 声明普通数组
###  4. 数组遍历  
```shell
#数组遍历的正确方法 1.0

declare -a  Langs
Langs=('JAVA' 'C#' 'F#' 'C++' 'C')

# ${!ArrayName[@]}   获得数组的索引列表 0 1 2 3 4 


for i in ${!Langs[@]}
do
  echo "Langs[$i]:"${Langs[$i]} 
done
```
----
### 声明关联数组  即 键值对
* declare -A 声明
#### 一 .声明方法  一个一个赋值
``` shell
declare -A ArrayName

ArrayName['A0001']='JxKicker';
ArrayName['A0002']='Kicker';
ArrayName['A0003']='Wang';

for index in ${!ArrayName[@]}
do
  echo "$index :" ${ArrayName[$index]}
done
echo "A0003:" ${ArrayName['A0003']}
#####输出
A0001 : JxKicker
A0003 : Wang
A0002 : Kicker
A0003: Wang
```
#### 二 .声明方法 一次赋值
```shell
Map=([name]=MapList [count]=5 [opacity]=10 [owner]="root kicker" [top]=person )
echo ${Map[@]};
```
### 数组的属性
`# echo ${array[index2]} 访问数组中的第二个元数`  
`# echo ${array[@]} 访问数组中所有元数 等同于 echo ${array1[\*]}`   
`# echo ${#array[@]} 获得数组元数的个数`  
`# echo ${!array[@]} 获得数组元数的索引`  
### 案例
#### 1. 将文件内容按行输入当数组中
``` shell
index=0;
declare -a Array;
while read info
do
  Array[$index]=$info
  echo ${Array[$index]}
  let index++

done < /etc/passwd
```
> * 只打印具有bash的用户
```shell
index=0;
declare -a Array;
while read info
do
  Array[$index]=$info
  if [[ "$info" =~ .*bash$ ]]
  then
    echo ${Array[$index]}
  fi;
  let index++

done < /etc/passwd

```
