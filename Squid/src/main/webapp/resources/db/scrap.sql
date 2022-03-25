-- 개인유저 스크랩
create table scrap(
	s_no number(5) primary key,
	s_u_id varchar2 (20 char) not null,
	s_rt_no number(5) not null
);

create sequence scrap_seq start with 1 increment by 1;

drop table scrap cascade constraint purge;
drop sequence scrap_seq;

select * from scrap;

delete scrap;

insert into scrap values(scrap_seq.nextval, 'admin', 1, 3);
insert into scrap values(scrap_seq.nextval, 'admin', 2, 4);
insert into scrap values(scrap_seq.nextval, 'admin', 3);

--------------------------------------------------------------------------

-- 사업자유저 스크랩
create table scrap_c(
	s_no number(5) primary key,
	s_u_id varchar2(20 char) not null,
	s_j_no number(5) not null
);

create sequence scrap_c_seq start with 1 increment by 1;

insert into scrap values(scrap_seq.nextval, 'admin', 3);

delete SCRAP_C;

select * from SCRAP_C;