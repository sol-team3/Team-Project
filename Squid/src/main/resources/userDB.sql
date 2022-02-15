create table user_info(
u_id varchar2 (20 char) primary key,
u_pw varchar2 (20 char) not null,
u_name varchar2 (10 char) not null,
u_address varchar2 (100 char) not null,
u_birth date not null,
u_type varchar2 (10 char) not null,
u_intro varchar2 (300 char) not null,
u_gender varchar2 (10 char) not null,
u_profile varchar2 (50 char) not null
)

select * from user_info;
