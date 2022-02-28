create table recruit (
	rt_no number(5) primary key,
	rt_u_id varchar2(30 char) not null,
	rt_title varchar2(50 char) not null,
	rt_start_date Date not null,
	rt_end_date Date not null,
	rt_start_time varchar2(50 char) not null,
	rt_end_time varchar2(50 char) not null,
	rt_date Date not null,
	rt_content varchar2(200 char) not null,
	rt_views number(10) not null
);

create sequence recruit_seq start with 1 increment by 1;

insert into RECRUIT values(recruit_seq.nextval, 'admin', '파리바게트', sysdate, sysdate, '13:00:00', '20:00:00', sysdate, '카운터좀 봐주세요', 0);

select * from RECRUIT;