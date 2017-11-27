//���� ������ �����ֱ�
create user wcadmin identified by wcadmin;
grant connect, resource to wcadmin;


create table admin(
id varchar2(20),
password varchar2(20),
nickname varchar2(20)
);

insert into admin values('admin','qwer1234!@#$','������');

//ȸ�����̺�
create table member(
num number primary key,
email varchar2(20) unique,
password varchar2(12),
nickname varchar2(10) unique
);

//���������� ���̺�
create table member_info(
num number,
company varchar2(20),
favorite varchar2(30),
age number,
gender number,
foreign key(num) references member(num)
);

//Ŭ���� ���̺�
create table wikiclass(
num number primary key,
name varchar2(50),
favorite varchar2(30)
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


//�湮�� Ȯ�� ���̺�
create table visit_info(
num number,
senddate date 
);

create sequence member_num
start with 1
increment by 1

create sequence member_info_num
start with 1
increment by 1;

create sequence wikiclass_num
start with 1
increment by 1;

create sequence note_num
start with 1
increment by 1;

create sequence visit_info_num
start with 1
increment by 1;





select * from member;
delete from member;


