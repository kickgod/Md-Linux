Git 命令记录
---
### 零. 配置信息
  *  显示git 版本 : git version
  *  显示git 当前的配置          : git config --list 
  *  设置git **[非常重要]**  提交仓库的用户名     : git config --global user.name  "Jxkicker"
  *  设置git **[非常重要]**  提交仓库的邮件信息  : git config --global user.email  "1427035242qq.com"
+ 查看git日志  
> git文本 操作和Vim linux一般.

### 壹. 建立代码仓库
* **git init** 从当前目录建一个Git仓库
* **git clone [url]**  下载一个项目和它的整个历史代码
* **git add [file1] [file2]** 添加指定文件到暂存区
* **git add .** 一次提交改变 
* **git rm [file] [file]** 删除工作区文件,并且将这次删除放入暂存区
* **git mv [file-origin] [file-renamed]** #改名文件,并将改名放入暂存区
* **git status** 查看当前仓库的状态  是否有增删改查
* **git log** 查看当前仓库的日志
* **git commit -m [message]** 例如  git commit -m '增加了一个文件'
* **git commit -a -m [message]** 直接从工作区,不仅过缓存区直接提交到仓库 前提该文件以及有仓库中的历史版本
* **git show 版本号** 查看某个版本的信息
### 贰. 同步远程仓库
* **git remote add [shortname] [url]** 增加远程仓库,并命名  例如: $git remote add origin https://github.com/kickgod/demo.git
* **git push [remote] [branch]** 将本地的提交推送到远程仓库
* **git pull [remote] [branch]** 将远程仓库的提交拉下到本地
* **git remote -v** 查看远程连接情况
> 每次提交之前 也就是使用push之前 请用pull先拉下来看看 有没有一样的。切记主机上面和本地上面同时修改
> 如果需要和远程仓库建立联系 需要首先使用 git remote add name [url] 建立连接 push到远程之前需要 commit commit之前需要 git add .
> 每次远程之前需要关注本地和远程谁发生了变化。尽量两者变化的位置不一样。

##### `要查看尚未暂存的文件更新了哪些部分，不加参数直接输入 git diff：`
```C#
Kick@DESKTOP-SQETH1P MINGW64 /m/Git-KikcerGoer/GitLearing (master)
$ git diff
warning: LF will be replaced by CRLF in Resource/Kicker.md.
The file will have its original line endings in your working directory.
diff --git a/Resource/Kicker.md b/Resource/Kicker.md
index 22383a2..2a12e69 100644
--- a/Resource/Kicker.md
+++ b/Resource/Kicker.md
@@ -1 +1,3 @@
 Son of bish
+
+ZHESHIYIDUANFEIHUA
```
##### `要从 Git 中移除某个文件`
`就必须要从已跟踪文件清单中移除（确切地说，是从暂存区域移除），然后提交。可以用 git rm 命令完成此项工作，并连带从工作目录中删除指定的文件，这样以后就不会出现在未跟踪文件清单中了。`
```shell
$ git rm grit.gemspec
rm 'grit.gemspec'
$ git status
# On branch master
#
# Changes to be committed:
# (use "git reset HEAD <file>..." to unstage)
#
# deleted: grit.gemspec
#
```
##### `移动文件`
```C#
 $ git mv file_from file_to
```
