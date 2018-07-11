mysql 数据库.管理
----
> mysql 新建数据库一般要指定它的字符集,不然难以存储中文 [`字符集注意事项`](https://mp.weixin.qq.com/s?__biz=MzIwMzg1ODcwMw==&mid=2247487968&idx=1&sn=2ff7b511f6727c7816ab02fc0e1c0361&chksm=96c9a780a1be2e961cd5e7c5e5ff32961cd2b6c1bac480f8f1c3f281e5bf1504fecebdd59d48#rd)
推荐使用字符串`utf8mb4` 
-----
> `查看现有数据库` `show databases`;  
> `查看某个数据库所有的表` `show tables FROM DataBase_Name;`

#### 字符集指定
> `show character set; 查看mysql当前支持的字符集`
##### 通过修改配置文件 修改字符串 以后创建的数据库字符集就都是`utf8mb4`
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
##### 创建数据库 病指定字符串
**`Create Database if not exists DataBase_Name default  charset utf8mb4 collate utf8mb4_general_ci`** <br/

* 创建数据库后修改数据库的字符集
  * `Alter Database Database_name Character  set = utf8mb4 Collate = utf8mb4_unicode_ci;`
* 创建表后修改表的字符集
  * `Alter Table Table_name Convert TO Character set utf8mb4 Collate utf8mb4_unicode_ci;`
---
#### 删除数据库
`drop database db_name`

------
#### 数据库引擎
> MySQL数据库引擎取决于MySQL在安装的时候是如何被编译的。要添加一个新的引擎，就必须重新编译MYSQL。在缺省情况下，MYSQL支持三个引擎：ISAM、MYISAM和HEAP。另外两种类型INNODB和BERKLEY（BDB），也常常可以使用。如果技术高超，还可以使用MySQL+API自己做一个引擎。下面介绍几种数据库引擎：
-----

ISAM：`ISAM是一个定义明确且历经时间考验的数据表格管理方法，它在设计之时就考虑到数据库被查询的次数要远大于更新的次数。因此，ISAM执行读取操作的速度很快，而且不占用大量的内存和存储资源。ISAM的两个主要不足之处在于，它不 支持事务处理，也不能够容错：如果你的硬盘崩溃了，那么数据文件就无法恢复了。如果你正在把ISAM用在关键任务应用程序里，那就必须经常备份你所有的实 时数据，通过其复制特性，MYSQL能够支持这样的备份应用程序`

----    
   
MyISAM:`MyISAM是MySQL的ISAM扩展格式和缺省的数据库引擎。除了提供ISAM里所没有的索引和字段管理的大量功能，MyISAM还使用一种表格锁定的机制，来优化多个并发的读写操作，其代价是你需要经常运行OPTIMIZE TABLE命令，来恢复被更新机制所浪费的空间。MyISAM还有一些有用的扩展，例如用来修复数据库文件的MyISAMCHK工具和用来恢复浪费空间的 MyISAMPACK工具。MYISAM强调了快速读取操作，这可能就是为什么MySQL受到了WEB开发如此青睐的主要原因：在WEB开发中你所进行的大量数据操作都是读取操作。所以，大多数虚拟主机提供商和INTERNET平台提供商只允许使用MYISAM格式。MyISAM格式的一个重要缺陷就是不能在表损坏后恢复数据.`

----

HEAP：`HEAP：HEAP允许只驻留在内存里的临时表格。驻留在内存里让HEAP要比ISAM和MYISAM都快，但是它所管理的数据是不稳定的，而且如果在关机之前没有进行保存，那么所有的数据都会丢失。在数据行被删除的时候，HEAP也不会浪费大量的空间。HEAP表格在你需要使用SELECT表达式来选择和操控数据的时候非常有用。要记住，在用完表格之后就删除表格。`
    
----

InnoDB：`InnoDB：InnoDB数据库引擎都是造就MySQL灵活性的技术的直接产品，这项技术就是MYSQL+API。在使用MYSQL的时候，你所面对的每一个挑战几乎都源于ISAM和MyISAM数据库引擎不支持事务处理（transaction process）也不支持外来键。尽管要比ISAM和 MyISAM引擎慢很多，但是InnoDB包括了对事务处理和外来键的支持，这两点都是前两个引擎所没有的。如前所述，如果你的设计需要这些特性中的一者 或者两者，那你就要被迫使用后两个引擎中的一个了。`

---

**`MyISAM与InnoDB的区别`**<br/>
　　`InnoDB和MyISAM是许多人在使用MySQL时最常用的两个表类型，这两个表类型各有优劣，视具体应用而定。基本的差别为：MyISAM类型不支持事务处理等高级处理，而InnoDB类型支持。MyISAM类型的表强调的是性能，其执行数度比InnoDB类型更快，但是不提供事务支持，而InnoDB提供事务支持已经外部键等高级数据库功能。`
