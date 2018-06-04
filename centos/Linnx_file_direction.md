### Linux 目录结构
---
* ` Window： 以多根目的方式组织文件系统 E: F： C：`  
* ` Linxu: 以单根的方式组织文件系统 /`    
----
![文件目录](/Image/centos7.png)
![文件公牛](/Image/fileFunction.png)

----
### 切换文件目录
`相对目录: 相对于当前目录开始`  
`绝对目录: 相对于开始的路劲` 
``` shell
* cd -     返回上次目录
* cd       直接返回自己的用户目录
* pwd      查看当前用户所在目录
* cd path  切换到path路径下
```
### 创建目录 mkdir 
* **mkdir diretionayName**  不能再不存在的目录下创建目录 例如: mkdir /list/NewDir `如果list目录不存在 那么会报错`
* **mkdir -p path**         例如: mkdir -p /list/NewDir 那么 如果前面的目录不存在那么会创建目录 
* **mkdir -v path**   打印创建信息
> 大多数情况下 我们会使用 mkdir -pv path pv关键字

### 删除目录 rmdir
> rmdir 只能够删除空的目录 如果目录中有文件存在那么删除会报错 所以删除文件我们尽量使用 rm
> rmdir -p  a/b/c删除 相当于  rmdir a/b/c  rmdir a/b  rmdir a 父级目录都删除 
