//���� ������ �����ֱ�
create user wcadmin identified by wcadmin;
grant connect, resource to wcadmin;


create table admin(
id varchar2(20),
password varchar2(20),
nickname varchar2(20)
)

insert into admin values('admin','qwer1234!@#$','������');


//ȸ�����̺�
create table member(
num number primary key,
email varchar2(20) unique,
password varchar2(12),
nickname varchar2(10) unique
)
//ȸ�����̺� date����
alter table member add(senddate date)

//���������� ���̺�
create table member_info(
num number,
company varchar2(20),
favorite varchar2(30),
age number,
gender number,
foreign key(num) references member(num)
)

//��Ʈ ���̺�
create table note(
num number,
name varchar2(50),
favorite varchar2(30)
)

//�湮�� Ȯ�� ���̺�
create table visit_info(
num number,
senddate date 
)

create sequence member_num
start with 1
increment by 1

create sequence member_info_num
start with 1
increment by 1

create sequence note_num
start with 1
increment by 1

create sequence visit_info_num
start with 1
increment by 1


insert into web_message values(message_num.nextval,'smart','smart@naver.com','HI',sysdate)


select * from member
delete from member



