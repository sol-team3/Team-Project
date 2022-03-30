
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

insert into review values(review_seq.nextval, 'junseok', '오늘 하루도 끝...', sysdate, '남다른 감자탕', '인천광역시 서구 가정동 618-5', '감자탕 손질하다가 내뼈가 나갈뻔했어요..', 3, 0);
insert into review values(review_seq.nextval, 'leetaerim', '첫 단기 알바 했어요!!', sysdate, 'KFC', '서울특별시 관악구 은천동 남부순환로 1735', '이제 대기업들도 단기알바를 하는 시대가 왔네요..!!!!', 5, 0);
insert into review values(review_seq.nextval, 'solri', '애버랜드에서 판다랑 놀다왔어요', sysdate, '애버랜드', '경기도 용인시 처인구 포곡읍 에버랜드로 199', '동물들 너무 귀여워...', 4, 0);
insert into review values(review_seq.nextval, 'hongildong', '공차는 역시 밀크티', sysdate, '공차', '서울특별시 중구 명동 퇴계로 109', '공차에서 처음 밀크티 만들어봤어요! 내가 마늘었찌만 너무 맛있어요', 4, 0);
insert into review values(review_seq.nextval, 'junseok', '홀서빙은 역시 너무 힘들어', sysdate, '누리마을감자탕', '서울특별시 구로구 구로동 1124-1', '사람이 왜이리 많은지 참..', 2, 0);
insert into review values(review_seq.nextval, 'leetaerim', '이제 알바 안한다', sysdate, '스시로', '부산광역시 부산진구 중앙대로 672', '살면서 이렇게 힘든 알바 첨해봤어요', 1, 0);
insert into review values(review_seq.nextval, 'solri', '단기 알바의 비애..', sysdate, 'CU편의점', '서울특별시 중구 필동3가 서애로 21', '매장만 봐달래놓고 재고조사까지 부탁하네요', 1, 0);
insert into review values(review_seq.nextval, 'junseok', '오랜만에 단기알바!!', sysdate, 'GS편의점', '서울특별시 중구 소공동 24', '오랜만에 알바하고 왔는데 요즘 진짜 좋아졌네요 단기로 알바도 할 수 있꼬??', 5, 0);
insert into review values(review_seq.nextval, 'junseok', '이틀 연속 달렸습ㄴ디ㅏ..', sysdate, 'GS편의점', '서울특별시 중구 소공동 24', '와 ㅋㅋ... <br> 진짜 힘드네 이거', 3, 0);
insert into review values(review_seq.nextval, 'leetaerim', '어제 알바하다가...', sysdate, 'ABC마트', '서울특별시 동작구 노량진동 112-5', '정신나간사람이 신발 시착해보더니 매장에서 도망감 ㅋㅋㅋㅋ', 5, 0);
insert into review values(review_seq.nextval, 'hongildong', '감자탕 이제 그만..', sysdate, '남다른 감자탕', '인천광역시 서구 가정동 618-5', '더 이상 감자탕은 안먹습니다', 2, 0);
  
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

delete REVIEW_COMMENT;