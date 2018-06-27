mysql 数据库管理
----
> mysql 新建数据库一般要指定它的字符集,不然难以存储中文 [`字符集注意事项`](https://mp.weixin.qq.com/s?__biz=MzIwMzg1ODcwMw==&mid=2247487968&idx=1&sn=2ff7b511f6727c7816ab02fc0e1c0361&chksm=96c9a780a1be2e961cd5e7c5e5ff32961cd2b6c1bac480f8f1c3f281e5bf1504fecebdd59d48#rd)

#### 字符集指定
> `show character set; 查看mysql当前支持的字符集`
* 修改配置文件
```
[client]
default-character-set=utf8mb4

[mysql]
default-character-set=utf8mb4

[mysqld]
character-set-client-handshake=FALSE
character-set-server=utf8mb4
collation-server=utf8mb4_unicode_ci
init_connect='SET NAMES utf8mb4'
```
* 创建数据库指定字符集 **重要** <br/>
----

`Create` `Database` `IF` `NOT` `EXISTS` `your_dbname` `DEFAULT` `CHARSET` `utf8mb4` `COLLATE` `utf8mb4_general_ci`<br/>

---
* 创建后修改字符集
```
ALTER DATABASE database_name CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

ALTER TABLE table_name CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE table_name table_name CHANGE column_name VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```
---
#### 删除数据库
`drop database db_name`
