文件系统
----
#### 文件系统
* #mkfs.xfs /dev/sdb1   #将/dev/sdb1 格式化为xfs格式 
* #mkfs.ext4 /dev/sdb2  #将/dev/sdb2分区格式化为ext4格式 
* df -h 查看文件系统挂载情况
* #mount -t ext4 /dev/sda5 /mnt/sda  通过-t ext4来指定/dev/sda5是ext4文件系统，并且挂载到 /mnt/sda目录 
* 永久挂载 /etc/fstab 修改里面增加UUID
* #mount -a 让挂载生效 
#### 磁盘
* 1、查询磁盘信息   -- #fdisk -l  
* 2.为磁盘分区 -- #fdisk /dev/sdb  
* 3.格式化分区  #mkfs.xfs /dev/sdb1
* 4.挂载分区，使分区可用 --#mount /dev/sdb1  /mnt 
* 5.开机自动挂载 -- 
```
#vim /etc/fstab 设置开机时自动载入新分区 
#blkid /dev/sdb1 >> /etc/fstab 
```
#### 文件类型
 第1位表示文件类型: 
  * d:目录（directory） 
  * -:普通文件 
  * l:符号链接文件 
  * c:字符设备文件 
  * b:块设备文
