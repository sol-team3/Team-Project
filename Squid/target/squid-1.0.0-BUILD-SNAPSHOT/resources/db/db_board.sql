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

select count(*) from board;

drop table board;

drop sequence board_seq;

---------------------
-- 게시판 댓글
create table board_comment(
	bc_no number(5) primary key, 	
	bc_b_no number(5) not null,		
	bc_owner varchar2(10 char) not null, 
	bc_content varchar2(100 char) not null,
	bc_date date not null
);


--	constraint b_c
--		foreign key(bc_b_no) -- 댓글 번호
--		references board(b_no) -- 게시판 번호
--		on delete cascade	-- 지우는 옵션



-- select * from board_comment where bc_b_no = #{b_no};

select * from board_comment;

create sequence board_comment_seq;

insert into board_comment values (1, 22, 'id', '댓글 내용 등록하기', sysdate );

drop table board_comment;

drop sequence board_comment_seq;

alter table board_comment drop constraint b_c;




-------------------------

