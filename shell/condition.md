Linux 条件测试条件控制
====
### 一 .Shell 条件测试格式:
---
格式 1： `test 条件表达式`  例子: test -d /script/condition.sh 返回false 1   
格式 2： `[ 条件表达式 ]`   例子: [ -d  /script/condistion.sh ]括号两边有空格   
格式 3： `[[ 条件表达式 ]]` 例子:[[ $Name =~^[0-9]+$ ]]  
``` shell
  name="JiangXing"
  #匹配字符串 以Jian开头
  if [[ "$name" =~ ^Jian* ]]
  then
          echo "用户名正确!"
  else
         read -p "请输入正确的用户名" name
         echo  "用户输入为:" $name
  fi

```
##### man test 查看所有的测试命令
##### %? 得到上一个命令执行结果 如果成功 返回true 0 不然返回 false 1
### 二 .数值比较
> * [ 1 -gt 10 ] 大于 
> * [ 1 -lt 10 ] 小于
> * [ 1 -eq 10 ] 等于 
> * [ 1 -ne 10 ] 不等于 
> * [ 1 -ge 10 ] 大于等于 
> * [ 1 -le 10 ] 小于等于 
> * 可以使用 ((1>2)) ((1!=2)) ((`id -u` >0 )) 同样可以条件测试
```shell
$ ((1<2));echo $? 0 
$ ((1==2));echo $? 1 
$ ((1>2));echo $? 1 
$ ((1>=2));echo $? 1 
$ ((1<=2));echo $? 0 
$ ((1!=2));echo $? 0 
$ ((`id -u`>0));echo $? 1
$ (($UID==0));echo $? 
```
### 三 .使用正则 匹配
* 1.`[ $num =~ ^[0-9]+\*$ ]` 但是 []不支持正则 会把后面的当做字符串匹配
* 2.`[[ "$num" =~ ^[0-9]+\*$ ]]` 要是用 [[]] 同时正则表达式不要加引号 变量使用双引号
### 四 .流程控制 if 注: if结束
``` shell
单分支结构 
if 条件测试 
then 命令序列 
fi 

双分支结构 
if 条件测试 
then 命令序列 
else 命令序列 
fi 
 
多分支结构 
if 条件测试 1 
then 命令序列 
 
elif 条件测试 2 
then 命令序列 
 
elif 条件测试 3  
then 命令序列]... 
 
else 命令序列 
fi 
```
### 五 .流程控制 case 注: esac结束
``` shell
case variable in
模式一)
命令序列1
;;
模式二)
命令序列2
;;
模式三)
命令序列3
;;
\*)
命令序列1
esac;
```
```shell
case $1 in
20)
  echo "比十大!"
  echo "这是王牌"

;;
6)
cat <<-EOF
数字范围
大于0
小于10
EOF
;;
*)
 echo "数字不符合规则"
esac;

```
### 六 .流程控制 for 注: esac结束
for 变量名 [ in 取值列表 ]  
do 循环体  
done  
```shell
for i in $(seq 1 10) #seq  #产生1~10之间的数字 遍历数组请用 $(seq 0 last_index)
do
echo "循环次数" $i
done
--------
for i in {2..100} #{2..100} 表示一个2-100的集合
do 
echo "循环次数" $i
done
```
### 七 .while循环
while 条件测试  
do 循环体  
done  
当条件测试成立（条件测试为真），执行循环体  
```shell
#从user.txt中读出文件 然后打印出来
while read user
do
 echo $user
done < user.txt

j=100;
while [ $j -gt 10 ] #比较一定不能用> = >=....
do
  echo '$j:' $j
  let j=$j-5  ##j 的自减 方法
done

```
### 八 .Until
until 条件测试  
do  
循环体  
done   
> `当条件测试成立（条件测试为假），执行循环体`
### 九 .exit  退出循环
