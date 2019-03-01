/*
	基于MYSQL
	事务控制
	COMMIT  ROLLBACK
	当有用户修改数据时，Oracle 先把那部分原始数据备份到回滚段，在Commit 之前，其他Session 用户读到的这
  部分数据是回滚段上的；  在提交之后，回滚段被释放
*/
/*
	锁
	防止  并发事务对相同的资源（所谓资源是指  表、行、共享的数据结构、
	数据字典行等）进行更改的时候，相互破坏
*/
/*
	表
	命名要求
	1 、必须以字母开头
	2 、长度不能超过30 个字符
	3 、只能包含 A–Z, a–z, 0–9, _, $, and #
	4 、不能与数据库中的已有对象重名
	5 、不能使用Oracle 数据库的保留字
	语法：CREATE TABLE [schema.]table
				(column datatype [DEFAULT expr][, ...]);
*/
/*
	复制表
*/
create table testtab1 as select * from e;	--语法
/*
	保留表结构不要数据
*/
CREATE table testtab2 as select * from e where 1 = 2;
/*
	添加列
*/
ALTER TABLE testtab2
ADD (locations VARCHAR(50) default 'China');
/*
	更改列属性
*/
ALTER table testtab2
MODIFY column location varchar(100) default 'America';
/*
	更改列名
*/
ALTER TABLE testtab1
CHANGE column department location VARCHAR(100);
/*
	删除列
*/
ALTER TABLE testtab2
drop column locations;
/*
	删除表
*/
drop table table_name
DROP TABLE testtab2;
/*
	更改表名
*/
ALTER table testtab1
RENAME testtab;
/*
	一次性清空一张表中的所有内容，保留表结构
	与delete的区别：
		没有Rollback的机会；
		HWM标记复位
*/
TRUNCATE table testtab1;

/*
	约束
	使用“约束”来阻止对数据库表中数据的不合法的“增删改”动作
		1.not null 非空约束
		2.UNIQUE	 唯一性约束
		3.primary key 主键约束
		4.FOREIGN KEY 外键约束
		5.CHECK		 自定义约束
*/
--在创建表的时候创建约束 number、varchar2在MySQL不属于数据类型
CREATE TABLE employees(
employee_id char(6),
first_name VARCHAR(20),
job_id VARCHAR(10) NOT NULL,
CONSTRAINT employees_lock PRIMARY KEY (EMPLOYEE_ID));
--单独创建约束  
ALTER TABLE testtab1 ADD CONSTRAINT testtab1_lock1
PRIMARY KEY(id);
/*
	删除主键约束
*/
ALTER TABLE testtab1 DROP primary key;
/*
	唯一约束
*/
ALTER TABLE testtab1 
add CONSTRAINT testtab1_lock2 UNIQUE(location);
drop table testtab1;
create table testtab1(
	id int primary key ,
	name varchar(30),
	location varchar(100)  not null,
	CONSTRAINT testtab1_name UNIQUE(name)
)
/*
	UNIQUE约束
*/
ALTER TABLE testtab
add CONSTRAINT testtab_firstname UNIQUE(firstname);
insert into testtab values(11, 'zhu', 'nicai', 'dan');
insert into testtab values(11, 'zhu', 'nicai', 'dan');
/*
	删除约束
*/
ALTER TABLE testtab
DROP CONSTRAINT_name --约束名
/*
	外键约束
*/
INSERT into d values(3, 3, 'zjq', 'good boy'), (4,4,'zjw','best girl');
create table dd (
	id int PRIMARY KEY,
	name varchar(100),
	CONSTRAINT dd_id_fk FOREIGN key (id) REFERENCES d(id)--参考的字段在另一个表里必须是唯一的
);

drop table d;

create table d(
	num int primary key,
	id int unique,			--UNIQUE
	name VARCHAR(30),
	introduce VARCHAR(100)
);
insert into dd values(1, 'zjq');
/*
	约束生效和失效
*/
ALTER TABLE employees
ENABLE CONSTRAINT emp_emp_id_pk;
ALTER TABLE employees
DISABLE CONSTRAINT  emp_emp_id_pk CASCADE;
/*
	自定义约束 CHECK
	mysql中check约束被忽略了
*/
drop table tt;
create table tt (
	id int primary key,
	height int,
	CONSTRAINT tt_id_check check (height < 100)
);
insert into tt values(1, 88);
/*
•	REFERENCES:  表示列中的值必须在父表中存在
• ON DELETE CASCADE:  当父表记录删除的时候自动删除子表中的相应记录.
• ON DELETE SET NULL:  当父表记录删除的时候自动把子表中相应记录的值设为NUL
*/
/*
	视图 view 简单视图  复杂视图
*/
CREATE VIEW emp_v
as select id, lastname, department
FROM testtab 
where firstname = 'deqing'; --简单视图

select * from emp_v; --查看视图
create VIEW def_v 
(name, max_id, min_id, avg_id)
as select CONCAT(firstname,lastname), max(id), min(id), avg(id)
FROM testtab ;

select * from def_v;
DROP VIEW def_v;
/*
	序列
*/