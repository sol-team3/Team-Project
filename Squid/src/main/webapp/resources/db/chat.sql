create table chat(
	c_no number(38) primary key,
	c_toId varchar2(50 char) not null,
	c_fromId varchar2(50 char) not null,
	c_content varchar2(200 char) not null,
	c_date date not null
);

create sequence chat_seq;

insert into chat values(chat_seq.nextval, 'admin', 'junseok', 'Hello', sysdate);

select * from chat;

drop table chat cascade constraint purge;
drop sequence chat_seq;

select * from chat where ((c_fromUserId = 'admin' and c_toUserId = 'junseok') OR (c_fromUserId = 'junseok' and c_toUserId = 'admin') and c_no > 3) order by c_date;