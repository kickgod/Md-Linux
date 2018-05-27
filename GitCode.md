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
* **git rm [file] [file]** 删除工作区文件,并且将这次删除放入暂存区
* **git mv [file-origin] [file-renamed]** #改名文件,并将改名放入暂存区
* **git status** 查看当前仓库的状态  是否有增删改查
* **git log** 查看当前仓库的日志
* **git commit -m [message]** 例如  git commit -m '增加了一个文件'
* **git commit -a -m [message]** 直接从工作区,不仅过缓存区直接提交到仓库 前提该文件以及有仓库中的历史版本
* **git show 版本号** 查看某个版本的信息
