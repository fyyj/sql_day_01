/*
	DISTINCT的用法
*/
insert into p1 values(6, 'zzz', 'boy');
select DISTINCT sex from p1;
/*
		隐私转换规则
*/
create table test1 (
	id int PRIMARY KEY,
	column1 varchar(20)
);
insert into test1 values(1, '4%56a'),(2,'1234'), (3,'aaaa');
select * from test1 where column1='1234';
select * from test1 where column1=1234;

select STR_TO_DATE('2011-2-22','YYYY-MM-DD') from dual;
select CAST(expr AS type)
STR_TO_DATE(str,format)



