create table chat(
	c_no number(38) primary key,
	c_toId varchar2(50 char) not null,
	c_fromId varchar2(50 char) not null,
	c_content varchar2(200 char) not null,
	c_date date not null
);

create sequence chat_seq;

insert into chat values(chat_seq.nextval, 'admin', 'junseok', '바보 ㅋ', sysdate);
insert into chat values(chat_seq.nextval, 'junseok', 'admin', '야 ㅋㅋ', sysdate);
insert into chat values(chat_seq.nextval, 'admin', 'solri', '야 ㅋㅋ', sysdate);
insert into chat values(chat_seq.nextval, 'solri', 'admin', '야 ㅋㅋ', sysdate);
insert into chat values(chat_seq.nextval, 'junseok', 'solri', '야 ㅋㅋ', sysdate);
insert into chat values(chat_seq.nextval, 'solri', 'junseok', '야 ㅋㅋ', sysdate);

delete chat;

select * from chat;

drop table chat cascade constraint purge;
drop sequence chat_seq;

select * from chat where ((c_toId = 'junseok' and c_fromId = 'admin') or (c_fromId = 'junseok' and c_toId = 'admin'));
select * from chat where (c_toId = 'junseok' and c_fromId = 'admin');
select * from chat where (c_toId = 'admin' and c_fromId = 'junseok');

select distinct c_toId, c_fromId from chat where c_toId = 'junseok' or c_fromId = 'junseok';
select distinct c_fromId from chat where c_toId = 'junseok';
select distinct c_toId from chat where c_fromId = 'junseok';

select c_fromId, c_toId, c_content from chat where ((c_fromId = 'admin' and c_toId = 'junseok') OR (c_fromId = 'junseok' and c_toId = 'admin')) order by c_date;
select distinct c_toId, c_fromId from chat where ((c_fromId = 'admin' and c_toId = 'junseok') OR (c_fromId = 'junseok' and c_toId = 'admin'));
