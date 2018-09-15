<a id="top" href="#top">Git 分支操作  :maple_leaf:</a> 
----
`Git 分支 分支算是很重要的了,几乎每一种版本控制系统都以某种形式支持分支。使用分支意味着你可以从开发主线上分离开来，然后在不影响主线的同时继
续工作。在很多版本控制系统中，这是个昂贵的过程，常常需要创建一个源代码目录的完整副本，对大型项目来说会花费很长时间。 Git 的分支模型称为“必杀技特性”，
Git 鼓励在工作流程中频繁使用分支与合并` [`分支理解`](http://git.oschina.net/progit/3-Git-%E5%88%86%E6%94%AF.html#3.1-%E4%BD%95%E8%B0%93%E5%88%86%E6%94%AF)

- [x] :maple_leaf: <a href="#BranchNow">`分支创建`</a>
- [x] :maple_leaf: <a href="#BranchManager">`分支的管理`</a>
- [x] :maple_leaf: <a href="https://blog.csdn.net/wuyinlei/article/details/53607582" >`向别人贡献你的代码`</a>


####  <a id="BranchNow" href="#BranchNow">分支的创建</a>  :star2: <a href="#top"> :arrow_up: </a>
`默认指针指向 master主分支 `

**`$ git branch testing`**：`创建一个新的分支/但是不吧当前的分支切换到新的分支上面`---`创建了一个名称为testing的分支`<br/>
**`$ git checkout testing`**：`切换当前分支为testing` <br/>
**`$ git checkout -b iss53`**:`创建一个新的分支 iss53 并且切换当前分支为iss55 `<br/>
**`$ git branch -d hotfix`**:`删除hotfix分支`<br/>
**`$ git merge iss53`**:`当前分支 和iss5 分支相互合并`<br/>
##### `遇到冲突时的分支合并问题`
`有时候合并操作并不会如此顺利。如果在不同的分支中都修改了同一个文件的同一部分，Git 就无法干净地把两者合到一起`

```shell
$ git merge iss53
  Auto-merging index.html
  CONFLICT (content): Merge conflict in index.html
  Automatic merge failed; fix conflicts and then commit the result.
```
**`git status `**：`这个时候查看那些文件有冲突,然后手动定位 修改 冲突文件`
```html
<<<<<<< HEAD:index.html
  <div id="footer">contact : email.support@github.com</div>
  =======
  <div id="footer">
  please contact us at support@github.com
  </div>
  >>>>>>> iss53:index.html
```
**`在解决了所有文件里的所有冲突后，运行 git add 将把它们标记为已解决状态`**<br/>
`再运行一次 git status 来确认所有冲突都已解决,如果觉得满意了，并且确认所有冲突都已解决，也就是进入了暂存区，就可以用 git commit 来完成这次合并提交`

####  <a id="BranchManager" href="#BranchManager">分支的管理</a>  :star2: <a href="#top"> :arrow_up: </a>
**`$ git branch`**: `命令不仅仅能创建和删除分支，如果不加任何参数，它会给出当前所有分支的清单：` `*` `字符它表示当前所在的分支` <br/>
**`$ git branch -v`**: `若要查看各个分支最后一个提交对象的信息`<br/>
**`$ git branch --merged`**:` 查看哪些分支已被并入当前分支（译注：也就是说哪些分支是当前分支的直接上游。）`<br/>
**`$ $ git branch --no-merged`**:`查看尚未合并的工作`<br/><br/>









