create table user_info(
u_id varchar2 (20 char) primary key,
u_pw varchar2 (20 char) not null,
u_name varchar2 (10 char) not null,
u_address varchar2 (100 char) not null,
u_address2 varchar2 (10 char) not null,
u_birth varchar2 (15 char) not null,
u_type varchar2 (10 char) not null,
u_intro varchar2 (300 char) not null,
u_gender varchar2 (10 char) not null,
u_profile varchar2 (200 char) not null,
u_phonNumber varchar2 (15 char) not null
);

 admin   admin js     13480_경기 성남시 분당구 대왕판교로 477_판교   판교동        2022-02-02 개인     어드민아이디  남        %EC%84%9C%ED%95%91%EC%82%AC%EC%A7%844.jpg 010-1111-1111

insert into USER_INFO values('admin', 'admin', 'admin', '13480_경기 성남시 분당구 대왕판교로 477_판교', '판교동', sysdate, 'admin', 'admin', 'admin', '../img/squid.png', '010-0000-0000')
 
select * from user_info;

delete from user_info; 

drop table user_info cascade constraint purge;
