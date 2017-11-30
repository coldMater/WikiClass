//���� ������ �����ֱ�
create user wcadmin identified by wcadmin;
grant connect, resource to wcadmin;



create sequence test_seq;
select test_seq.nextval from dual;
select test_seq.currval from dual;

create table admin(
id varchar2(20),
password varchar2(20),
nickname varchar2(20)
);

select * from note;

insert into admin values('admin','qwer1234!@#$','������');

//ȸ�����̺�
create table member(
num number primary key,
email varchar2(50) unique,
password varchar2(12),
nickname varchar2(10) unique,
senddate date
);

create sequence member_num
start with 1
increment by 1;

//���������� ���̺�(ȸ����ȣ)
create table member_info(
num number,
favorite varchar2(300),
age number,
gender number,
foreign key(num) references member(num)
);



create sequence member_info_num
start with 1
increment by 1;

//�о߿� ���� ���� ���̺�



//�α���Ƚ�� Ȯ�� ���̺�
create table visit_info(
num number,
senddate date
);

create sequence visit_info_num
start with 1
increment by 1;

//�׷����̺�
create table wikigroup(
num number primary key,
name varchar2(50) unique,
content varchar2(1000)
);

create sequence wikigroup_num
start with 1
increment by 1;

//�׷쿡 �߰��� ��� ���̺�
create table group_person(
group_num number REFERENCES wikigroup(num),
nickname varchar(20)
);

//Ŭ���� ���̺�(�Ҽӱ׷��ȣ, �ۼ��ڹ�ȣ, ������, Ŭ�����̸�, �о�, �̹��� ���, Ŭ���� ����, �ۼ���¥)
create table wikiclass(
group_num number REFERENCES wikigroup(num),
mem_num number REFERENCES member(num),
num number primary key,
name varchar2(50),
favorite varchar2(100),
imgPath varchar2(200),
classPath varchar2(4000),
senddate date
);

create sequence wikiclass_num
start with 1
increment by 1;

//���� ���̺�
create table class_grant(
class_num number REFERENCES wikiclass(num),
mem_num number REFERENCES member(num)
);

//��Ʈ ���̺�(Ŭ������ȣ, ��ȣ, �̸�, ���, �ۼ���, �ۼ���¥)
create table note(
class_num number not null REFERENCES wikiclass (num),
num number primary key,
name varchar2(50),
path varchar2(200),
author varchar2(20),
senddate date
);

create sequence note_num
start with 1
increment by 1;

//������ �޸� �߰�
create table admin_memo(memo_1 number, memo_2 number, memo_3 number, content varchar(300));

