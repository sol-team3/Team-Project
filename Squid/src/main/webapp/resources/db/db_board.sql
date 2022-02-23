create table board(
	b_no number(5) primary key,
	b_owner varchar2(20 char) not null,
	b_date date not null,
	b_title varchar2(50 char)  not null,
	b_content varchar2(300 char) not null,
	b_views number(5) not null
);


create sequence board_seq;

select * from board;

drop table board cascade constraint purge;
drop seqeunce board_seq;

---------------------
-- 게시판 댓글
create table board_comment(
	bc_no number(5) primary key, 	
	bc_b_no number(5) not null,		
	bc_owner varchar2(10 char) not null, 
	bc_content varchar2(100 char) not null,
	bc_date date not null,

	constraint b_c
		foreign key(bc_b_no) -- 댓글 번호
		references board(b_no) -- 게시판 번호
		on delete cascade	-- 지우는 옵션
);


select * from board_comment where bc_b_no = #{b_no};

create sequence board_comment_seq;

-------------------------

