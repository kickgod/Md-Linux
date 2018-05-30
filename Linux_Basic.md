Linux 使用入门
====
> * Tab*2自动补全命令
### 零. 快捷键
> * Ctrl+C/D 停止运行当前程序/退出当前程序
> * Ctrl+L 清屏
> * Ctrl+A 跳到当前行最前端
> * Ctrl+E 跳到当前行最后端
> * Ctrl+U 删除光标前所有的字符
> * Ctrl+K 删除光标后所有的字符
> * Ctrl+S 删除光标后一个字符
> * Ctrl+R 搜索历史命令 利用关键字
### 壹. 基本使用
> * **!$** 引用上一个命令的最后一个参数 例如; 上一个命令 ls /home/user/ 输入 cs !$ 结果系统执行命令为 cd /home/user/ 成功跳到 /home/user 目录下
> * alias tianyun='cat /etc/sysconfig/network/script/ifcfg.eth0' 
> * 解释:如果你想给每一位用户都生效的别名，请把alias la='ls -al' 一行加在/etc/bashrc最后面，bashrc是环境变量的配置文件 /etc/bashrc和~/.bashrc 区别就在于一个是设置给全系统一个是设置给单用户使用 有，如果你想给每一位用户都生效的别名，请把alias la='ls -al' 一行加在/etc/bashrc最后面，bashrc是环境变量的配置文件 /etc/bashrc和~/.bashrc 区别就在于一个是设置给全系统一个是设置给单用户使用 *
