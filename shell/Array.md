Shell 数组
====
### 定义数组： 方法一
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
### 方法二
```shell
 一次赋多个值
```
