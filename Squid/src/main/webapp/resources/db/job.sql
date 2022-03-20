create table job (
	j_no number(5) primary key,
	j_title varchar2(50 char) not null, -- 제목
	j_u_id varchar2(30 char) not null, -- 아이디
	j_u_name varchar2(50 char) not null, -- 이름  
	j_age number (5) not null, -- 나이 delete
	j_start_date Date not null,
	j_end_date Date not null,
	j_start_time varchar2(50 char) not null,
	j_end_time varchar2(50 char) not null,
	j_area varchar2(100 char) not null, -- 희망지역
	j_date Date not null, -- 등록일
	j_intro varchar2(200 char) not null, -- 자기소개
	j_pic varchar2(200 char) not null,
	j_view number(5) not null -- 조회수
);

create sequence job_seq start with 1 increment by 1;

insert into job values(job_seq.nextval,'이번주 알바가능 ' ,'admin', 'admin', 20 ,sysdate, sysdate, '13:00:00', '20:00:00', '서울',sysdate, '잘 부탁드립니다.','a.jpg' ,0);

insert into job values(job_seq.nextval,'17일 알바가능 ' ,'admin', 'admin', sysdate, sysdate, '15:00', '20:00', '서울 대구 부산',sysdate, '잘 부탁드립니다.','a.jpg' ,0);
insert into job values(job_seq.nextval,'18일 알바가능 ' ,'admin', 'admin', sysdate, sysdate, '15:00', '20:00', '서울 경기 인천 부산',sysdate, '잘 부탁드립니다.','a.jpg' ,0);
insert into job values(job_seq.nextval,'19일 알바가능 ' ,'admin', 'admin', sysdate, sysdate, '15:00', '20:00', '서울 경기  부산',sysdate, '잘 부탁드립니다.','a.jpg' ,0);
insert into job values(job_seq.nextval,'20일 알바가능 ' ,'admin', 'admin', sysdate, sysdate, '15:00', '20:00', '서울 부산 제주',sysdate, '잘 부탁드립니다.','a.jpg' ,0);
insert into job values(job_seq.nextval,'21일 알바가능 ' ,'admin', 'admin', sysdate, sysdate, '15:00', '20:00', '경기 인천',sysdate, '잘 부탁드립니다.','a.jpg' ,0);
insert into job values(job_seq.nextval,'22일 알바가능 ' ,'admin', 'admin', sysdate, sysdate, '15:00', '20:00', '경기 인천',sysdate, '잘 부탁드립니다.','a.jpg' ,0);
insert into job values(job_seq.nextval,'22시 구직' ,'tae', 'tae', sysdate, sysdate, '15:00', '22:00', '전국',sysdate, '잘 부탁드립니다.','a.jpg' ,0);
insert into job values(job_seq.nextval,'21시 구직' ,'tae', 'tae', sysdate, sysdate, '15:00', '21:00', '전국',sysdate, '잘 부탁드립니다.','a.jpg' ,0);
insert into job values(job_seq.nextval,'20시 구직' ,'tae', 'tae', sysdate, sysdate, '15:00', '20:00', '전국',sysdate, '잘 부탁드립니다.','a.jpg' ,0);
insert into job values(job_seq.nextval,'19시 구직' ,'tae', 'tae', sysdate, sysdate, '15:00', '19:00', '전국',sysdate, '잘 부탁드립니다.','a.jpg' ,0);



select * from job;

select * from job order by j_no;

select j_no, j_title, j_u_id, j_u_name, j_age ,j_start_date, j_end_date,
	j_start_time, j_end_time, j_area , j_date, j_intro, u_address, u_address2
from job, user_info where j_u_id = u_id;

delete job;

drop table job cascade constraint purge;
drop sequence job_seq;

ALTER TABLE job DROP COLUMN j_age;
