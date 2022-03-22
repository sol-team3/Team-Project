
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

insert into review values(review_seq.nextval, 'junseok', '감자마을', '2022-02-27 16:13:44.2', '감자마을', '충남 당진시 합덕읍 감자마을1길 12', '감자 굿', 5, 0)
  
select * from review order by rv_no;

drop table review cascade constraint purge;
drop sequence review_seq;

delete review;

SELECT * FROM (select rv_no, rv_u_id, rv_title, rv_date, rv_rest_name from review order by rv_no desc) WHERE rownum between 30 and 100;

select *
from (
	select rownum as rn, rv_no, rv_u_id, rv_title, rv_date, rv_rest_name, rv_rest_addr, rv_content, rv_score, rv_views
	from (
		select * from user_info, review
		where rv_u_id = u_id
		order by u_id desc
	)
)
where rn >= 1 and rn <= 10;

select * 
from (
		select rownum as rn, rv_no, rv_u_id, rv_title, rv_date, rv_rest_name, rv_rest_addr, rv_content, rv_score, rv_views 
		from (select * from review order by rv_no desc)
	)
where rn <= 3;

select * from review order by rv_no desc;

select * 
from (
		select rownum as rn, rv_no, rv_u_id, rv_title, rv_date, rv_rest_name, rv_rest_addr, rv_content, rv_score, rv_views 
		from (select * from review order by rv_no desc)
	)
where rn <= 5;

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