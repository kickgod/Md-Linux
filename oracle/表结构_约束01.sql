
  create table MEMBERINFO(
    mid varchar(30) , --primary key not null,
    email varchar(30) ,--unique
    age int ,--check(age >18 and age <150),
    constraint uk_emali unique(email),
    constraint pk_mid primary key(mid),
    constraint ck_age check((age >18) and (age <150)),
    constraint Fk_mid foreign key(mid) references  users(USER_ID) 
  )
  --UK UL 
  /*约束的名称 约束简写_字段*/
  alter table member add constraint uk_email unique(emali);
  alter table member add constraint pk_mid primary key(mid);
  
  -- 主键约束 PK
  
  --查看约束
  select * from SYS.USER_CONSTRAINTS where table_name='MEMBERINFO';
  
  select * from SYS.USER_CONS_COLUMNS where table_name='MEMBERINFO';
  
  --修改约束
  --非空约束
  alter table MEMBERINFO modify(AGE int not null);
  -- 禁用主键
  alter table MEMBERINFO disable constraint PK_MID;

  alter table MEMBERINFO disable constraint PK_MID cascade ;--如果有外键关系
  
  --重新启用
  alter table MEMBERINFO Enable constraint PK_MID;
 --删除约束
 
  alter table MEMBERINFO drop constraint PK_MID;
   