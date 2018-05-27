Git 命令记录
---
### 零. 配置信息
  *  显示git 版本 : git version
  *  显示git 当前的配置          : git config --list 
  *  设置git 提交仓库的用户名     : git config --global user.name  "Jxkicker"
  *  设置git 提交仓库的邮件信息   : git config --global user.email  "1427035242qq.com"
+ 查看git日志  
> git文本 操作和Vim linux一般.

### 一 建立代码仓库
* **git init** 从当前目录建一个Git仓库
* **git clone [url]**  下载一个项目和它的整个历史代码
* **git add [file1] [file2]** 添加指定文件到暂存区
* **git rm [file] [file]** 删除工作区文件,并且将这次删除放入暂存区
* **git mv [file-origin] [file-renamed]** #改名文件,并将改名放入暂存区
