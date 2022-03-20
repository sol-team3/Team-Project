create table board(
	b_no number(5) primary key,
	b_owner varchar2(20 char) not null,
	b_u_type varchar2(20 char) not null,
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

insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '오징어', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '오징어1', '오징어 잉여 알바', 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '오징어1', '오징어 잉여 알바', 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '하나로마트', '오징어 잉여 알바', 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '고깃집', '오징어 잉여 알바', 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '햄버거', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '오징어2', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '잉여알바', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '잉여', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '알바', '오징어 잉여 알바', 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '피자', '오징어 잉여 알바', 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '커피 머신 사기', '오징어 잉여 알바', 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '서울 알바', '오징어 잉여 알바', 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '경기 알바', '오징어 잉여 알바', 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '인천 알바', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '알바 모하지', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '스벅 알바', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '맥날 알바', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '버거킹 알바', '오징어 잉여 알바', 0);
insert into board values (board_seq.nextval, 'tae', '개인', sysdate, '롯데리아 알바', '오징어 잉여 알바', 0);

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

