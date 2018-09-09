<a id="top" href="#top">Git log和版本切换  :maple_leaf:</a> 
----
`log可以查看版本更新日志,版本切换可是实现更好的版本管理`

- [x] :maple_leaf: <a href="#GITLOG">`Git log`</a>
    - <a href="#gitp2">`参数`</a>
- [x] :maple_leaf: <a href="#GitResethardhead">`版本回退命令`</a>
    - <a href="#GotRElog">`全部回退历史`</a>
    - <a href="#CheXiaoZheciGG">`撤销本次工作区尚未提交的更改`</a>
    - <a href="#CheXiaoZanCunQuGG">`撤销本次暂存区尚未提交的更改`</a>


####  <a id="GITLOG" href="#GITLOG">Git log 命令 </a>  :star2: <a href="#top"> :arrow_up: </a>
**`Git log`** `查看git的日志管理,下年是git log的常用格式` <br>

```C#
[root@localhost GitLearing]# git log

commit c0da76c621e6d0d4a6ff489cc71a01cd77a1cf04     --------------- 提交版本号 可是实现版本回退
Author: KikcerGoer <xing1427035242@163.com>         --------------- 作者 邮箱
Date:   Sun Sep 9 09:22:38 2018 +0800               --------------- 提交时间
                                   
    第二次提交                                       --------------- 提交备注 

```
#####  <a href="#gitp2" id="gitp2">`参数`</a>
`git log 会按提交时间列出所有的更新，最近的更新排在最上面。`<br/>
* 选项 说明
   * `-p`: `按补丁格式显示每个更新之间的差异。`
   * `--stat`: `显示每次更新的文件修改统计信息。`
   * `--shortstat`: `只显示 --stat 中最后的行数修改添加移除统计。`
   * `--name-only`:`仅在提交信息后显示已修改的文件清单。`
   * `--name-status` :`显示新增、修改、删除的文件清单。`
   * `--abbrev-commit`: `仅显示 SHA-1 的前几个字符，而非所有的 40 个字符。`
   * `--relative-date` :`使用较短的相对时间显示（比如，“2 weeks ago”）。`
   * `--graph` :`显示 ASCII 图形表示的分支合并历史。`
   * `--pretty` :`使用其他格式显示历史提交信息。可用的选项包括 oneline，short，full，fuller 和 format（后跟指定格式）。`
   * `-(n)`: `仅显示最近的 n 条提交`
   * `--since, --after`:` 仅显示指定时间之后的提交。`
   * `--until, --before`: `仅显示指定时间之前的提交。`
   * `--author`: `仅显示指定作者相关的提交。`
   * `--committer`: `仅显示指定提交者相关的提交。`


`-p 选项展开显示每次提交的内容差异，用 -2 则仅显示最近的两次更新：`<br/>

**`-2 前几次提交记录`**

```C#
$ git log -3
commit 5072859fca89ca6598c7f56c6b20e0d7d9413e28 (HEAD -> master, origin/master, origin/HEAD)
Author: KikcerGoer <xing1427035242@163.com>
Date:   Sun Sep 9 10:29:24 2018 +0800

    Add File

commit d93e406c93fdbd20ca901265b6aa41c0046ec4a0
Author: KikcerGoer <xing1427035242@163.com>
Date:   Sun Sep 9 10:08:41 2018 +0800

    第三次提交

commit 943413eb4a1dc12696ce8b3dea0ab88cb488608b
Author: Jxkicker <1427035242@qq.com>
Date:   Sun Sep 9 09:44:58 2018 +0800

    second Commit
```

**`-p 查看不同`**

```C#
$ git log -p -2
commit 5072859fca89ca6598c7f56c6b20e0d7d9413e28 (HEAD -> master, origin/master, origin/HEAD)
Author: KikcerGoer <xing1427035242@163.com>
Date:   Sun Sep 9 10:29:24 2018 +0800

    Add File

diff --git a/Resource/Kicker.md b/Resource/Kicker.md
new file mode 100644
index 0000000..22383a2
--- /dev/null
+++ b/Resource/Kicker.md
@@ -0,0 +1 @@
+Son of bish

commit d93e406c93fdbd20ca901265b6aa41c0046ec4a0
Author: KikcerGoer <xing1427035242@163.com>
Date:   Sun Sep 9 10:08:41 2018 +0800

    第三次提交

diff --git a/README.md b/README.md
index 9f73238..e0284ae 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,3 @@
 <a href="#top" id="top">Git 学习实验室仓库</a>
+--------------
+`Git学习之旅`

```

##### 代码审查需要
`在做代码审查，或者要快速浏览其他协作者提交的更新都作了哪些改动时，就可以用这个选项。此外，还有许多摘要选项可以用，比如 --stat，仅显示简要的增改行数统计：`
```C#
$ git log -5 --stat
commit 6d967aac9b9627404db79827ea22118f2db593a9 (HEAD -> master, origin/master, origin/HEAD)
Author: Kicker <1427035242@qq.com>
Date:   Sat Sep 8 10:55:28 2018 +0800

    你们好啊

 PowerShell/README.md | 1 +
 1 file changed, 1 insertion(+)

commit 27b9299be80c3dccc7ba5cced64bed73ca3a3540
Author: Kicker <1427035242@qq.com>
Date:   Sat Sep 8 10:53:57 2018 +0800

    Powershell 文件系统的使用--未包含权限问题

 PowerShell/PSFileSystem.md | 1 -
 1 file changed, 1 deletion(-)

commit 6a9955e33567301bbbf808d3955b85f6ff551adb
Author: Kicker <1427035242@qq.com>
Date:   Sat Sep 8 10:53:07 2018 +0800

    PowerShell 文件系统 --超基础

 PowerShell/PSFileSystem.md | 225 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 208 insertions(+), 17 deletions(-)

commit 97eae36aac71223a233367fad2ec4e32341fc254
Author: Kicker <1427035242@qq.com>
Date:   Sat Sep 8 00:21:45 2018 +0800

    我是一匹好人

 PowerShell/PSFileSystem.md | 54 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

commit 4e6d14409cc3372e2f67544eef61b41224b6e069
Author: Kicker <1427035242@qq.com>
Date:   Fri Sep 7 23:57:16 2018 +0800

    Create PSFileSystem.md

 PowerShell/PSFileSystem.md | 134 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

```

##### **`git log --pretty=oneline`** `只查看最近的四条数据,且一行显示信息` <br>
```C#
$ git log --pretty=oneline
943413eb4a1dc12696ce8b3dea0ab88cb488608b (HEAD -> master, origin/master, origin/HEAD) second Commit
5a50afc67bd841552dccf6b80043fad8d01bde0c first commit
```
#####  格式化选项
```c#
$ git log --pretty=format:"%h - %an, %ar : %s" -3
6d967aa - Kicker, 29 hours ago : 你们好啊
27b9299 - Kicker, 29 hours ago : Powershell 文件系统的使用--未包含权限问题
6a9955e - Kicker, 29 hours ago : PowerShell 文件系统 --超基础
```

```C#
选项 说明
    %H 提交对象（commit）的完整哈希字串
    %h 提交对象的简短哈希字串
    %T 树对象（tree）的完整哈希字串
    %t 树对象的简短哈希字串
    %P 父对象（parent）的完整哈希字串
    %p 父对象的简短哈希字串
    %an 作者（author）的名字
    %ae 作者的电子邮件地址
    %ad 作者修订日期（可以用 -date= 选项定制格式）
    %ar 作者修订日期，按多久以前的方式显示
    %cn 提交者(committer)的名字
    %ce 提交者的电子邮件地址
    %cd 提交日期
    %cr 提交日期，按多久以前的方式显示
    %s 提交说明
```

##### 列出所有最近两周内的提交
```C#
 $ git log --since=2.weeks
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
