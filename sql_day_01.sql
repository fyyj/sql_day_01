/*
	建表
*/
create table p1 (
	id int PRIMARY key,
	name varchar(20) not null,
	sex enum ('boy', 'girl')
);

create table p2 (
	id int PRIMARY key ,
	name varchar(20) not null,
	likes varchar(30) DEFAULT null
);
/*
	insert 语句
*/
insert into p1 values(1, 'aaa', 'boy'),(2, 'bbb', 'girl'), (3, 'ccc', 'boy');
insert into p2 values(4, 'ddd', 'chess'),(5, 'eee', 'run');  --插入数据到表p2

select p1.name "name_p1", p2.likes likes_p2 from p1, p2 where p1.id = 1 and p2.name='ddd';
CONCAT(select name from p1 where id = 1, is a ,select sex from p1 where id = 1);
DECLARE a varchar(20) DEFAULT 'aaa', b varchar(20) DEFAULT 'bbb'

drop table p2;
delete  from p2;

/*
	通配符的用法
*/
create table p3 (
str varchar(30) PRIMARY key

);
insert into p3 values('sdkfja%df'), ('a%dfalkdg'),('fd%df'),('adf');

select * from p3 where str like '%K%%'escape'K';

/*
	CONCAT(str1,str2,...)的用法
*/
select CONCAT('Hello','world')

/*
	SUBSTR(str FROM pos FOR len)的用法
*/
select SUBSTR('HelloWorld',1,5) as 'OK';
select SUBSTR('hello',4);  --从指定位置截取到末尾

/*
	INSTR(str,substr)
	*/
select INSTR('abcda','a')

/*
	ROUND(X)
*/
select ROUND(45.674, 1);
select ROUND(45.674, 2);
select ROUND(45.674, 0);
select ROUND(45.674,);
select ROUND(45.674, -1);
select ROUND(45.674, -2);

/*
	TRUNC(X)
*/
select TRUNCATE(45.674, 0);





