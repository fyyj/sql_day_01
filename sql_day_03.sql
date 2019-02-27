/*
	建表练习多表关联查询--day_03
*/
create table e(
	id int primary key,
	lastname varchar(20) not null,
	department varchar(40),
	firstname varchar(30)
);
CREATE TABLE d(
	num int PRIMARY KEY,
	id int ,
	name varchar(30) not null,
	introduce varchar(40)
);
insert into d values(1,2,'zhu','I"m fan'),(2,1,'zhu','OK');
insert into e values(1, 'zhu', 'hanke', 'jiqiang'),
(2,'zhu','xinfeng', 'jiawei'), (3,'zhang','zhengzhou', 'qianjie'),
(4,'xv','guizhou', 'ailin');
insert into e values(0,'yang', 'hanke', 'deqing');
create table f(
	id int primary key,
	lastname varchar(20) not null,
	department varchar(40),
	firstname varchar(30)
);
insert into f values(1,'zhou','China', 'runfa'),(2,'wu','Shanghai','yanzu'),(3,'zhang','sichuan','jie'),(4,'xie', 'sichuan','na');
insert into f values(5, 'wang', 'guangzhou', 'hao'),(6,'xv','beijing','xin');
/*
	等于连接语法练习
*/
SELECT e.id as "E", f.id as "F" from e, f where e. id = f.id;
/*
	不等连接语法
*/
select e.id as "E" 
from e 
where e.id not in (select f.id from f);
select f.id as "F"
from f 
where f.id not in (select e.id from e);
select f.id as "F"
from f , e
where f.id > e.id;
/*
	自连接	与自己本身进行连接 取别名操作
*/
SELECT d.name, table2.introduce
from d, d table2
where d.id=table2.num;
/*
	交叉连接相当于没有连接条件的多表
	关联查询，结果为笛卡尔乘积 CROSS JOIN
	语法：
		SELECT last_name, department_name
		FROM employees
		CROSS JOIN departments ;
*/
/*
	自然连接  相当于等于连接
	只不过是让系统自己去找两张表中字段名相同的字段作为
） “等于连接”条件
*/
/*
	内连接  关键字：INNER JOIN
	可以省去INNER
	从数学的角度来理解就是求两个表的交集
*/
select *
from e
JOIN f  ON e.id = f.id;
/*
	外连接可以分为左外连接和右外连接 全外连接
	例：左外连接	LEFT OUTER JOIN
	求两个表的交集外加左表剩下的数据
*/
select e.lastname,e.firstname ,f.lastname
from e
left OUTER JOIN f
ON (e.id = f.id);
/*
	右外连接	RIGHT OUTER JOIN
	求两个表的交集外加右表剩下的数据
	也可以用(+)  那个表写了(+)就代表那个表需要补充
*/
select e.lastname,e.firstname ,f.lastname
from e
RIGHT OUTER JOIN f
ON (e.id = f.id);
/*
	全外连接  FULL  OUTER JOIN
	mysql不支持全外连接
	可以使用关键字union联合左右外连接的结果
*/
select e.lastname,e.firstname ,f.lastname
from e
LEFT OUTER JOIN f
ON (e.id = f.id)
union
select e.lastname,e.firstname ,f.lastname
from e
RIGHT OUTER JOIN f
ON (e.id = f.id);
/*
	分组计算函数
	求和、求平均值、计数、求标准差、求方差、求最大值、求最小值等
	MIN,MAX可用于任何数据类型,但AVG,SUM,STDDEV,VARIANCE 	  仅适用于数值型字段
	语法：SELECT [column,] group_function(column), ...
				FROM  table
				[WHERE condition]
				[GROUP BY  column]
				[ORDER BY  column];
*/
SELECT sum(id)
from e;
SELECT avg(id)
from e;
select stddev(id)  --标准差
from e;
select VARIANCE(id)
from e;
select min(id)
from e;
SELECT max(id)
from e;
/*
	COUNT函数   求和
*/




