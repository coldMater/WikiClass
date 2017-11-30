//유저 생성과 권한주기
create user wcadmin identified by wcadmin;
grant connect, resource to wcadmin;


create table admin(
id varchar2(20),
password varchar2(20),
nickname varchar2(20)
);
insert into admin values('admin','qwer1234!@#$','관리자');
drop table member
//회원테이블
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

//마이페이지 테이블
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

//로그인횟수 확인 테이블
create table visit_info(
num number,
senddate date
);

select count(*) from visit_info where to_char(senddate,'YYYY/MM/DD') = '2017/11/29'


insert into visit_info values(1,sysdate)
insert into visit_info values(2,sysdate)
insert into visit_info values(3,sysdate)

select * from VISIT_INFO

//요일구분
select senddate,to_char(senddate,'D') from visit_info 




create table admin_memo(memo_1 number, memo_2 number, memo_3 number, content varchar(300));




create sequence adm_memo
start with 1
increment by 1;

select * from adm_memo


create sequence visit_info_num
start with 1
increment by 1;


//그룹테이블
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

//그룹에 추가된 사람 테이블
create table group_person(
group_num number REFERENCES wikigroup(num),
nickname varchar(20)
)

select * from wikiclass
insert into wikiclass values(1,4,3,'안녕','분야','이미지주소','클래스주소',sysdate)
insert into wikiclass values(2,44,23,'346안녕','분2222야','2356이미지주소','클래346스주소',sysdate)
insert into wikiclass values(3,34,35,'안346녕','분1111야','이미지346주소','346클래스주소',sysdate)

drop table wikiclass

//클래스 테이블
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

insert into note values(123,12,1,'꿀qwe밤각','호wqe빵맨','qweq','klkljh',sysdate)
insert into note values(234,21,2,'dfg','dfgdfg','gd',sysdate)
insert into note values(53,34,3,'d4t','ret','qweq',sysdate)



create sequence wikiclass_num
start with 1
increment by 1;

//권한 테이블
create table class_grant(
class_num number REFERENCES wikiclass(num),
mem_num number REFERENCES member(num)
);

drop table note

//노트 테이블(클래스번호, 번호, 이름, 경로, 작성자, 작성날짜)
create table note(
class_num number not null,
num number primary key,
name varchar2(50),
path varchar2(200),
author varchar2(20),
senddate date
);



insert into note values(1,12,'hi','꿀밤각','호빵맨',sysdate)
insert into note values(2,16,'hii','꿀밤각각','우리의호빵맨',sysdate)
insert into note values(3,15,'hiii','꿀밤밤각','헐크',sysdate)

select * from note

select * from note where name = '?';

create sequence note_num
start with 1
increment by 1;





