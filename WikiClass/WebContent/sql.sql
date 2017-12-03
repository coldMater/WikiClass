/*유저 생성과 권한주기*/
create user wcadmin identified by wcadmin;
grant connect, resource to wcadmin;


select note_id from class_tree_info where class_id = '41';

select * from note_history;

select * from note where num = (select note_id from class_tree_info where class_id = '41');


create table admin(
id varchar2(20),
password varchar2(20),
nickname varchar2(20)
);

insert into admin values('ADMIN','QWER1234!@#$','관리자');

/*회원테이블*/
create table member(
num number primary key,
email varchar2(20) unique,
password varchar2(12),
nickname varchar2(10) unique,
senddate date
);
alter table member modify(email varchar2(50));
create sequence member_num
start with 1
increment by 1;

/*마이페이지 테이블(회원번호)*/
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

/*로그인횟수 확인 테이블*/
create table visit_info(
num number,
senddate date
);

create sequence visit_info_num
start with 1
increment by 1;

/*그룹테이블*/
create table wikigroup(
num number primary key,
name varchar2(50) unique,
content varchar2(1000)
);

select * from wikigroup

create sequence wikigroup_num
start with 1
increment by 1;

/*그룹에 추가된 사람 테이블*/
create table group_person(
group_num number REFERENCES wikigroup(num),
nickname varchar(20)
);

/*클래스 테이블(소속그룹번호, 작성자번호, 시퀀스, 클래스이름, 분야, 이미지 경로, 클래스 내용, 작성날짜)*/
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

select * from wikiclass where group_num=85;

create sequence wikiclass_num
start with 1
increment by 1;

/*권한 테이블*/
create table class_grant(
class_num number REFERENCES wikiclass(num),
mem_num number REFERENCES member(num)
);

/*노트 테이블(클래스번호, 번호, 이름, 경로, 작성자, 작성날짜)*/
create table note("NUM" NUMBER primary key, 
   "NAME" VARCHAR2(100 BYTE), 
   "PATH" VARCHAR2(200 BYTE), 
   "SENDDATE" DATE, 
   "AUTHOR" NUMBER);

CREATE TABLE CLASS_TREE_INFO
   (   "NOTE_ID" NUMBER primary key, 
   "PARENT_ID" NUMBER, 
   "SIBLING_ID" NUMBER, 
   "CLASS_ID" NUMBER)   

/* 노트의 노드 정보(노트들 간의 관계 정의) */
create table class_tree_info(
note_id number primary key,
parent_id number,
sibling_id number,
class_id number
);



create sequence note_num
start with 1
increment by 1;

/*관리자 메모 추가*/
create table admin_memo(memo_1 number, memo_2 number, memo_3 number, content varchar(300));

select * from member;

select * from group_person where nickname=(select nickname from member where email='1')