<a id="top" href="#top">Git log和版本切换  :maple_leaf:</a> 
----
`log可以查看版本更新日志,版本切换可是实现更好的版本管理`

- [x] :maple_leaf: <a href="#GITLOG">`Git log`</a>
- [x] :maple_leaf: <a href="#GitResethardhead">`版本回退命令`</a>
    - <a href="#GotRElog">`全部回退历史`</a>
    - <a href="#CheXiaoZheciGG">`撤销本次工作区尚未提交的更改`</a>
    - <a href="#CheXiaoZanCunQuGG">`撤销本次暂存区尚未提交的更改`</a>


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
#### <a id="GitResethardhead" href="#GitResethardhead">版本回退命令</a>  :star2: <a href="#top"> :arrow_up:</a>
`回退命令要使用到commit Id 也就是版本号 或者HEAD `: **`git reset --hard HEAD/commit_Id(提交版本号)`** <br/>

:whale2: **`git reset --hard HEAD`** `回退到上一个版本`<br/>
:whale2: **`git reset --hard HEAD^^`** `回退到上上一个版本`<br/>
:whale2: **`git reset --hard c0da76c621e6d0d4a6ff489cc71a01cd77a1cf04`** :`回退到版本号为c0da76...的版本`<br/><br/>

**`注意`**:`你会发现当你回到过去的版本以后，你的git log变少了,你回到的版本将会成为你最新的git log,你之后更改的git log不见了
比如：有十个git log 提交版本 当你回到第六个的时候 ,你会发现 输入git log后 就只有六个提交历史了`
#####  <a id="GotRElog" href="#GotRElog">Git reflog 全部回退历史 </a>  :star2: <a href="#top"> :arrow_up: </a>
`查看全部所有的回退更改提交的版本历史log`：**`git reflog`**

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
#####  <a id="CheXiaoZheciGG" href="#CheXiaoZheciGG">撤销本次工作区尚未提交的更改 </a>  :star2: <a href="#top"> :arrow_up: </a>
`有时候,我们更改了文件在工作区,但是还没有提交到暂存区,和本地仓库,那么我们可以使用一个命令撤销本次对于一个文件的修改` <br/>
```C#
//当我们对文件做了修改以后,如果要撤销此次更改可以使用 git checkout 命令
$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   Kicker.md

no changes added to commit (use "git add" and/or "git commit -a")
```
**`git Checkout`**:`撤销工作区的所有更改`<br/>
**`git Checkout --filename.xxx`**:`撤销工作区的某一个文件的更改`<br/>

#####  <a id="CheXiaoZanCunQuGG" href="#CheXiaoZanCunQuGG">撤销本次暂存区尚未提交的更改 </a>  :star2: <a href="#top"> :arrow_up: </a>
* `如果你已经git add 了将你的改变提交到暂存区,那么怎么回到原始版本呢,这个时候一个Git Checkout的命令就不够了`
  * `第一步：将暂存区的内容reset到上个版本的最新内容 撤销更改`
  * `第二部：将工作区使用checkout 回到上个版本的最新内容 撤销更改` 
```C#
git reset HEAD;  //全部暂存区文件返回原来版本
git reset HEAD --filename.xx; //撤销某一个文件在暂存区的更改

git checkout ;//全部工作区文件返回原来版本
git checkout --filename.xx; //撤销某一个文件在工作区的更改
```
