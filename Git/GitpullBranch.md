<a id="top" href="#top">Git 分支 使用 :maple_leaf:</a> 
----
`分支操作--非常重要,团队协作的关键`

- [x] :maple_leaf: [`将本地分支推送到服务器上面`](#PushNewBranch)
- [x] :maple_leaf: [`将远程git仓库里的指定分支拉取到本地`](#PushNewBranch)


####  <a id="PushNewBranch" href="#PushNewBranch">将本地分支推送到服务器上面</a>  :star2: <a href="#top"> :arrow_up: </a>
`例如，我要把上一步创建的本地dev1推送到远程仓库`：`语法: git push --set-upstream origin 分支名`
* `如果远端服务器没有此分支,那么将会创建新分支`
```powershell
git push --set-upstream origin dev1
```
####  <a id="PushNewBranch" href="#PushNewBranch"></a>  :star2: <a href="#top"> :arrow_up: </a>
`将远程git仓库里的指定分支拉取到本地（本地不存在的分支）`
```powershell
 git checkout -b 本地分支名 origin/远程分支名
```







