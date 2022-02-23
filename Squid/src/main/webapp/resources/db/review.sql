
--------------------- Review Board DB -----------------------
create table review (
	rv_no number(5) primary key,
	rv_u_id varchar2(30 char) not null,
	rv_title varchar2(50 char) not null,
	rv_date Date not null,
	rv_rest_name varchar2(50 char) not null,
	rv_rest_addr varchar2(50 char) not null,
	rv_content varchar2(200 char) not null,
	rv_score number(2,1) not null,
	rv_views number(10) not null
);

create sequence review_seq start with 1 increment by 1;

select * from review;

drop table review cascade constraint purge;
drop seqeunce review_seq;

--------------------- Review Comment DB ----------------------
create table review_comment (
	rc_no number(5) primary key, -- 댓글 번호
	rc_rv_no number(5) not null, -- 게시글 번호
	rc_u_id varchar2(30 char) not null, -- 댓글 작성자
	rc_date Date not null, -- 댓글 등록일
	rc_content varchar2(200 char) not null -- 댓글 내용
);

create sequence review_commnet_seq start with 1 increment by 1; 

insert into review_comment values(review_commnet_seq.nextval, 1, 'admin', sysdate, '댓글 만들어봅시다~');

select * from review_comment;