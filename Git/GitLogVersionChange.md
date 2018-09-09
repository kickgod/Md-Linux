<a id="top" href="#top">Git log和版本切换  :maple_leaf:</a> 
----
`log可以查看版本更新日志,版本切换可是实现更好的版本管理`

- [x] :maple_leaf: <a href="#GITLOG">`Git log`</a>
- [x] :maple_leaf: <a href="#GitResethardhead">`版本回退命令`</a>
    - <a href="#GotRElog">`全部回退历史`</a>
- [x] :maple_leaf: <a href="#">``</a>
- [x] :maple_leaf: <a href="#">``</a>

####  <a id="GITLOG" href="#GITLOG">Git log 命令 </a>  :star2: <a href="#top"> :arrow_up: </a>
**`Git log`** `查看git的日志管理,下年是git log的常用格式` <br>

```shell
[root@localhost GitLearing]# git log

commit c0da76c621e6d0d4a6ff489cc71a01cd77a1cf04     --------------- 提交版本号 可是实现版本回退
Author: KikcerGoer <xing1427035242@163.com>         --------------- 作者 邮箱
Date:   Sun Sep 9 09:22:38 2018 +0800               --------------- 提交时间
                                   
    第二次提交                                       --------------- 提交备注 

```
**`git log --pretty=oneline`** `只查看最近的四条数据,且一行显示信息` <br>
```C#
$ git log --pretty=oneline
943413eb4a1dc12696ce8b3dea0ab88cb488608b (HEAD -> master, origin/master, origin/HEAD) second Commit
5a50afc67bd841552dccf6b80043fad8d01bde0c first commit
```
#####  <a id="GitResethardhead" href="#GitResethardhead">版本回退命令</a>  :star2: <a href="#top"> :arrow_up:</a>
`回退命令要使用到commit Id 也就是版本号 或者HEAD `: **`git reset --hard HEAD/commit_Id(提交版本号)`** <br/>

:whale2: **`git reset --hard HEAD`** `回退到上一个版本`<br/>
:whale2: **`git reset --hard HEAD^^`** `回退到上上一个版本`<br/>
:whale2: **`git reset --hard c0da76c621e6d0d4a6ff489cc71a01cd77a1cf04`** :`回退到版本号为c0da76...的版本`<br/><br/>

**`注意`**:`你会发现当你回到过去的版本以后，你的git log变少了,你回到的版本将会成为你最新的git log,你之后更改的git log不见了
比如：有十个git log 提交版本 当你回到第六个的时候 ,你会发现 输入git log后 就只有六个提交历史了`
#####  <a id="GotRElog" href="#GotRElog">Git reflog 全部回退历史 </a>  :star2: <a href="#top"> :arrow_up: </a>
`查看全部回退更改提交的版本`：**`git reflog`**

```C#
$ git reflog
d93e406 (HEAD -> master, origin/master, origin/HEAD) HEAD@{0}: reset: moving to HEAD^
90e3ea8 HEAD@{1}: reset: moving to HEAD
90e3ea8 HEAD@{2}: reset: moving to HEAD
90e3ea8 HEAD@{3}: commit: 第四次提交
d93e406 (HEAD -> master, origin/master, origin/HEAD) HEAD@{4}: commit: 第三次提
交
943413e HEAD@{5}: commit: second Commit
5a50afc HEAD@{6}: clone: from https://github.com/KikcerGoer/GitLearing.git
```

####  <a id="" href="#"></a>  :star2: <a href="#top"> :arrow_up: </a>
####  <a id="" href="#"></a>  :star2: <a href="#top"> :arrow_up: </a>
####  <a id="" href="#"></a>  :star2: <a href="#top"> :arrow_up: </a>
####  <a id="" href="#"></a>  :star2: <a href="#top"> :arrow_up: </a>
####  <a id="" href="#"></a>  :star2: <a href="#top"> :arrow_up: </a>






