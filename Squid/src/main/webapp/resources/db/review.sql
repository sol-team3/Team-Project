create table review (
	rv_no number(5) primary key,
	rv_u_id varchar2(30 char) not null,
	rv_title varchar2(50 char) not null,
	rv_rest_name varchar2(50 char) not null,
	rv_rest_img varchar2(200 char) not null,
	rv_rest_addr varchar2(50 char) not null,
	rv_content varchar2(200 char) not null,
	rv_score number(2,1) not null,
	rv_views number(10) not null
);

create sequence review_seq start with 1 increment by 1;

insert into review values(review_seq.nextval, 'admin', 'sqiud12', 'name', 'img', 'addr', 'content', 1.5, 1);

select * from review;

drop table review cascade constraint purge;
drop seqeunce review_seq;