create table job (
	j_no number(5) primary key,
	j_title varchar2(50 char) not null,
	j_u_id varchar2(30 char) not null,
	j_rest_name varchar2(50 char) not null,
	j_start_date Date not null,
	j_end_date Date not null,
	j_start_time varchar2(50 char) not null,
	j_end_time varchar2(50 char) not null,
	j_date Date not null,
	j_content varchar2(200 char) not null,
	j_pay number(10) not null,
	j_pic varchar2(200 char) not null,
	j_view number(5) not null
);

create sequence job_seq start with 1 increment by 1;

insert into job values(job_seq.nextval,'[맥도날드 서울역점] 배달알바' ,'leetae', '맥도날드', sysdate, sysdate, '13:00:00', '20:00:00', sysdate, '배달 부탁드려요 ', 9160,'a.jpg' ,0);

select * from job;

select * from job order by j_no;

select j_no, j_title, j_u_id, j_rest_name, j_start_date, j_end_date,
	j_start_time, j_end_time, j_date, j_content, j_pay,  u_address, u_address2
from job, user_info where j_u_id = u_id;

delete job;

drop table job cascade constraint purge;
drop sequence job_seq;
