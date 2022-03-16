create table chat(
	c_no number(38) primary key,
	c_oppn varchar2(50 char) not null,
	c_uId varchar2(50 char) not null,
	c_toId varchar2(50 char) not null,
	c_fromId varchar2(50 char) not null,
	c_content varchar2(200 char) not null,
	c_date date not null
);

create sequence chat_seq;

insert into chat values(chat_seq.nextval, 'admin', 'junseok', 'admin', 'junseok', '바보 ㅋ', sysdate);
insert into chat values(chat_seq.nextval, 'admin', 'junseok', 'junseok', 'admin', '야 ㅋㅋ', sysdate);
insert into chat values(chat_seq.nextval, 'solri', 'junseok', 'junseok', 'solri', '야 ㅋㅋ', sysdate);
insert into chat values(chat_seq.nextval, 'solri', 'junseok', 'solri', 'junseok', '야 ㅋㅋ', sysdate);

delete chat where c_no >= 3;

select * from chat;

drop table chat cascade constraint purge;
drop sequence chat_seq;


select distinct c_oppn, c_uId from chat where c_toId = 'junseok' or c_fromId = 'junseok';

select c_content from chat where ((c_fromId = 'solri' and c_toId = 'junseok') OR (c_fromId = 'junseok' and c_toId = 'solri')) order by c_date;
select distinct c_oppn from chat where ((c_fromId = 'admin' and c_toId = 'junseok') OR (c_fromId = 'junseok' and c_toId = 'admin'));
