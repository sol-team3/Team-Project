create table chat(
	c_no number(38) primary key,
	c_toUserId varchar2(50 char) not null,
	c_fromUserId varchar2(50 char) not null,
	c_content varchar2(200 char) not null,
	c_date date not null
);

create sequence chat_seq;

insert into chat values(chat_seq.nextval, 'admin', 'junseok', 'Hello', sysdate);

select * from chat;

drop table chat cascade constraint purge;
