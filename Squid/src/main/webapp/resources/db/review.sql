create table review (
	rv_no number(5) primary key,
	rv_u_id varchar2(30 char) not null,
	rv_title varchar2(50 char) not null,
	rv_date Date not null,
	rv_rest_name varchar2(50 char) not null,
	rv_rest_img varchar2(200 char) not null,
	rv_rest_addr varchar2(50 char) not null,
	rv_content varchar2(200 char) not null,
	rv_score number(2,1) not null,
	rv_views number(10) not null
);

create sequence review_seq start with 1 increment by 1;

insert into review values(review_seq.nextval, 'admin', 'sqiud1', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud2', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud3', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud4', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud5', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud6', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud7', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud8', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud9', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud10', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud11', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud12', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud13', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud14', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud15', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud16', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud17', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud18', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud19', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud20', sysdate, 'name', 'img', 'addr', 'content', 1, 1);
insert into review values(review_seq.nextval, 'admin', 'sqiud21', sysdate, 'name', 'img', 'addr', 'content', 1, 1);

select * from review;

select * from review where rv_rest_name like '%ㅁㄴㅇ%';

drop table review cascade constraint purge;
drop seqeunce review_seq;

delete review;