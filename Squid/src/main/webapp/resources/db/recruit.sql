create table recruit (
	rt_no number(5) primary key,
	rt_u_id varchar2(30 char) not null,
	rt_title varchar2(30 char) not null,
	rt_rest_name varchar2(50 char) not null,
	rt_rest_img varchar2(200 char) not null,
	rt_rest_type varchar2(50 char) not null,
	rt_rest_addr1 varchar2(200 char) not null,
	rt_rest_addr2 varchar2(200 char) not null,
	rt_con_type varchar2(100 char) not null,
	rt_con_age varchar2(50 char) not null,
	rt_con_gender varchar2(20 char) not null,
	rt_start_date Date not null,
	rt_end_date Date not null,
	rt_total_date varchar2(50 char) not null,
	rt_Dday varchar2(50 char) not null,
	rt_start_time varchar2(50 char) not null,
	rt_end_time varchar2(50 char) not null,
	rt_total_time varchar2(50 char) not null,
	rt_date Date not null,
	rt_content varchar2(200 char) not null,
	rt_pay number(10) not null,
	rt_calcPayTime number(30) not null,
	rt_view number(5) not null
);

create sequence recruit_seq start with 1 increment by 1;

insert into RECRUIT values(recruit_seq.nextval, 'admin', '[쇼핑몰] 급구합니다~', '(주)파리바게트', 'resources/img/squid.jpg', '농업', '감자마을 101', '감자동', '단기알바', '10대', '남자만', sysdate, sysdate, '7', '31', '13:00', '20:00', '17', sysdate, '카운터좀 봐주세요.. 제발 ㅠㅠ', 9160, 160000, 0);

select * from RECRUIT order by rt_no;

select rt_no, rt_u_id, rt_rest_name, rt_start_date, rt_end_date,
	rt_start_time, rt_end_time, rt_date, rt_content, rt_pay, rt_pay, u_address, u_address2
from recruit, user_info where rt_u_id = u_id;

delete recruit;

drop table recruit cascade constraint purge;
drop sequence recruit_seq;

alter table recruit alter rt_con_age varchar2(50 char) not null;

select * 
from (
	select * from user_info, recruit
	where rt_u_id = u_id
	order by rt_no desc
) 
where rt_no = 24
