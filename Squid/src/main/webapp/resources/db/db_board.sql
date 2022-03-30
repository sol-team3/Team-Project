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

delete board;

drop table board cascade constraint purge;
drop sequence board_seq;

insert into board values (board_seq.nextval, 'solri', '개인', sysdate, '오징어 페이지 어떠세요 다들?', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'leetaerim', '개인', sysdate, '솔직히 아르바이트 단기 너무 좋다', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'junseok', '개인', sysdate, '아 배고프다', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'solri', '개인', sysdate, '최저시급 이상으로 잘 받는 꿀팁', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'junseok', '개인', sysdate, '알바 할때 꿀팁', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'solri', '개인', sysdate, '알바 연락오면 이렇게 하세요 다들!!', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '요즘 아르바이트 구하기 어렵네요..', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '원하는 지역에 알바가 많이 없네요 ㅜㅜㅜ', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '최저시급 왜이렇게 많이 오르죠...????', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '단기 아르바이트 사용할 땐 역시 오징어지!!', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values(board_seq.nextval, 'leetae', '사업자', sysdate, '여러분 단기 알바하면 어떠세요??', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'leetaerim', '개인', sysdate, '내일 알바가요 ㅠㅠ', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'hongildong', '개인', sysdate, '이제 이 알바를 마지막으로 취업합니다!', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'hongildong', '개인', sysdate, '알바생 공감짤 ㅋㅋ', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'leetaerim', '개인', sysdate, '진상 대처법..', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);
insert into board values (board_seq.nextval, 'leetaerim', '개인', sysdate, '오징어 잉여 알바', '전 진짜 너무 좋은것같습니다 ㅎㅎㅎ' , 0);

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

delete BOARD_COMMENT;

alter table board_comment drop constraint b_c;




-------------------------

