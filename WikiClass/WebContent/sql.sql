//���� ������ �����ֱ�
create user wcadmin identified by wcadmin;
grant connect, resource to wcadmin;


create table admin(
id varchar2(20),
password varchar2(20),
nickname varchar2(20)
);
insert into admin values('admin','qwer1234!@#$','������');
drop table member
//ȸ�����̺�
create table member(
num number primary key,
email varchar2(20) unique,
password varchar2(12),
nickname varchar2(10) unique,
senddate date
);

select * from member
alter table member add(senddate date)

create sequence member_num
start with 1
increment by 1

//���������� ���̺�
create table member_info(
num number,
company varchar2(20),
favorite varchar2(30),
age number,
gender number,
foreign key(num) references member(num)
);

select * from MEMBER
insert into member values(1,'qer@fd','esdfwrwer','n33nn',sysdate)
insert into member values(2,'qesdfdsfr@fd','edddwrwer','nsgnn',sysdate)
insert into member values(3,'qsdfer@fd','agesdwrwer','n1234nn',sysdate)

select * from MEMBER_info
insert into member_info values(1,'23434d','234',34,1)
insert into member_info values(2,'45745','45',234564,2)
insert into member_info values(3,'3456323434d','245634',234564,1)


select member.*, member_info.* from member inner join MEMBER_INFO on member.num=member_info.num


create sequence member_info_num
start with 1
increment by 1;

//�α���Ƚ�� Ȯ�� ���̺�
create table visit_info(
num number,
senddate date
);

select count(*) from visit_info where to_char(senddate,'YYYY/MM/DD') = '2017/11/29'


insert into visit_info values(1,sysdate)
insert into visit_info values(2,sysdate)
insert into visit_info values(3,sysdate)

select * from VISIT_INFO

//���ϱ���
select senddate,to_char(senddate,'D') from visit_info 




create table admin_memo(memo_1 number, memo_2 number, memo_3 number, content varchar(300));




create sequence adm_memo
start with 1
increment by 1;

select * from adm_memo


create sequence visit_info_num
start with 1
increment by 1;


//�׷����̺�
create table wikigroup(
num number primary key,
name varchar2(50) unique,
content varchar2(1000)
);

select * from wikigroup
insert into wikigroup values(1,'dkjfkd','lksjf');
insert into wikigroup values(2,'df','qqwe');
insert into wikigroup values(3,'dfdf','qwe');

select * from wikigroup where name = 'df'
create sequence wikigroup_num
start with 1
increment by 1;

//�׷쿡 �߰��� ��� ���̺�
create table group_person(
group_num number REFERENCES wikigroup(num),
nickname varchar(20)
)

select * from wikiclass
insert into wikiclass values(1,4,3,'�ȳ�','�о�','�̹����ּ�','Ŭ�����ּ�',sysdate)
insert into wikiclass values(2,44,23,'346�ȳ�','��2222��','2356�̹����ּ�','Ŭ��346���ּ�',sysdate)
insert into wikiclass values(3,34,35,'��346��','��1111��','�̹���346�ּ�','346Ŭ�����ּ�',sysdate)

drop table wikiclass

//Ŭ���� ���̺�
create table wikiclass(
group_num number,
mem_num number,
num number primary key,
name varchar2(50),
favorite varchar2(30),
imgPath varchar2(200),
classPath varchar2(200),
senddate date
);

select * from wikiclass where group_num=2

insert into note values(123,12,1,'��qwe�㰢','ȣwqe����','qweq','klkljh',sysdate)
insert into note values(234,21,2,'dfg','dfgdfg','gd',sysdate)
insert into note values(53,34,3,'d4t','ret','qweq',sysdate)



create sequence wikiclass_num
start with 1
increment by 1;

//���� ���̺�
create table class_grant(
class_num number REFERENCES wikiclass(num),
mem_num number REFERENCES member(num)
);

drop table note

//��Ʈ ���̺�(Ŭ������ȣ, ��ȣ, �̸�, ���, �ۼ���, �ۼ���¥)
create table note(
class_num number not null,
num number primary key,
name varchar2(50),
path varchar2(200),
author varchar2(20),
senddate date
);



insert into note values(1,12,'hi','�ܹ㰢','ȣ����',sysdate)
insert into note values(2,16,'hii','�ܹ㰢��','�츮��ȣ����',sysdate)
insert into note values(3,15,'hiii','�ܹ�㰢','��ũ',sysdate)

select * from note

select * from note where name = '?';

create sequence note_num
start with 1
increment by 1;





