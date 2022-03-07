create table recruit (
	rt_no number(5) primary key,
	rt_u_id varchar2(30 char) not null,
	rt_rest_name varchar2(50 char) not null,
	rt_start_date Date not null,
	rt_end_date Date not null,
	rt_start_time varchar2(50 char) not null,
	rt_end_time varchar2(50 char) not null,
	rt_date Date not null,
	rt_content varchar2(200 char) not null,
	rt_pay number(10) not null,
	rt_pic varchar2(200 char) not null,
	rt_view number(5) not null
);

create sequence recruit_seq start with 1 increment by 1;

insert into RECRUIT values(recruit_seq.nextval, 'admin', '파리바게트', sysdate, sysdate, '13:00:00', '20:00:00', sysdate, '카운터좀 봐주세요', 9160, 'a.jpg',0);

select * from RECRUIT order by rt_no;

select rt_no, rt_u_id, rt_rest_name, rt_start_date, rt_end_date,
	rt_start_time, rt_end_time, rt_date, rt_content, rt_pay, rt_pay, u_address, u_address2
from recruit, user_info where rt_u_id = u_id;

delete recruit;

drop table recruit cascade constraint purge;
drop sequence recruit_seq;

alter table recruit add number(5) not null;
