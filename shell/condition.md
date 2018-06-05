Linux 条件测试
====
#### Shell 条件测试格式:
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
