create table user_info(
u_id varchar2 (20 char) primary key,
u_pw varchar2 (20 char) not null,
u_name varchar2 (10 char) not null,
u_address varchar2 (100 char) not null,
u_address2 varchar2 (10 char) not null,
u_birth date not null,
u_type varchar2 (10 char) not null,
u_intro varchar2 (300 char) not null,
u_gender varchar2 (10 char) not null,
u_profile varchar2 (50 char) not null
)

insert into user_info values ('sr','1234','sr','부산','부전동','2021-01-01','개인','반갑습니다','여','알바해봤음');

select * from user_info;

drop table user_info;
