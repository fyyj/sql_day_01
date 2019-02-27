/*
	������ϰ��������ѯ--day_03
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
	���������﷨��ϰ
*/
SELECT e.id as "E", f.id as "F" from e, f where e. id = f.id;
/*
	���������﷨
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
	������	���Լ������������ ȡ��������
*/
SELECT d.name, table2.introduce
from d, d table2
where d.id=table2.num;
/*
	���������൱��û�����������Ķ��
	������ѯ�����Ϊ�ѿ����˻� CROSS JOIN
	�﷨��
		SELECT last_name, department_name
		FROM employees
		CROSS JOIN departments ;
*/
/*
	��Ȼ����  �൱�ڵ�������
	ֻ��������ϵͳ�Լ�ȥ�����ű����ֶ�����ͬ���ֶ���Ϊ
�� ���������ӡ�����
*/
/*
	������  �ؼ��֣�INNER JOIN
	����ʡȥINNER
	����ѧ�ĽǶ�����������������Ľ���
*/
select *
from e
JOIN f  ON e.id = f.id;
/*
	�����ӿ��Է�Ϊ�������Ӻ��������� ȫ������
	������������	LEFT OUTER JOIN
	��������Ľ���������ʣ�µ�����
*/
select e.lastname,e.firstname ,f.lastname
from e
left OUTER JOIN f
ON (e.id = f.id);
/*
	��������	RIGHT OUTER JOIN
	��������Ľ�������ұ�ʣ�µ�����
	Ҳ������(+)  �Ǹ���д��(+)�ʹ����Ǹ�����Ҫ����
*/
select e.lastname,e.firstname ,f.lastname
from e
RIGHT OUTER JOIN f
ON (e.id = f.id);
/*
	ȫ������  FULL  OUTER JOIN
	mysql��֧��ȫ������
	����ʹ�ùؼ���union�������������ӵĽ��
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
	������㺯��
	��͡���ƽ��ֵ�����������׼��󷽲�����ֵ������Сֵ��
	MIN,MAX�������κ���������,��AVG,SUM,STDDEV,VARIANCE 	  ����������ֵ���ֶ�
	�﷨��SELECT [column,] group_function(column), ...
				FROM  table
				[WHERE condition]
				[GROUP BY  column]
				[ORDER BY  column];
*/
SELECT sum(id)
from e;
SELECT avg(id)
from e;
select stddev(id)  --��׼��
from e;
select VARIANCE(id)
from e;
select min(id)
from e;
SELECT max(id)
from e;
/*
	COUNT����   ���
*/




