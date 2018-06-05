Linux Shell 世界旅程
=====
> 最后更新时间 2018/6/2 号
* 1.[第壹场 Shell变量笔记](https://github.com/kickgod/Md-Linux/blob/master/shell/variable.md)
* 2.[第贰场 Shell变量笔记](https://github.com/kickgod/Md-Linux/blob/master/shell/variable2.md)
* 3.[第弎场 Shell条件测试](https://github.com/kickgod/Md-Linux/blob/master/shell/condition.md)
-----
##### 提示 小计
 `() 子shell中执行`  
 `(()) 数值比较 运算  类似于C语言`  
 `$()命令替换 得到执行结果两个tab上面的键也可以`    
 `$(()) 整数运算`    
 `{} ${} 操作变量`    
 `[] 条件测试`  
 `[[]] 条件测试  支持正则 =~`  
 `$[] 整数运算`  
 
 ----
 ##### 执行脚本
 ``` bash
> * ./01.sh 需要执行权限 在shell中执行
> *  bash 01.sh 不需要执行权限 在子 shell 中执行 
> * . 01.sh 不需要执行权限 在当前 shell 中执行 
> * source 01.sh 不需要执行权限 在当前 shell 中执
> * sh -n 02.sh 仅调试 syntax error 
> * sh -vx 02.sh 以调试的方式执行，查询整个执行过程 
```
