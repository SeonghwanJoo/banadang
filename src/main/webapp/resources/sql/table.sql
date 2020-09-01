create table member(
	id varchar2(30) not null,
	auth number(1) default 2 not null,/*0 탈퇴회원, 1 정지회원, 2일반회원, 3운영진, 4관리자*/
	constraint member_pk primary key (id)
);
create table member_detail(
	id varchar2(30) not null,
	nickname varchar2(30) not null,
	profile_image varchar2(100) not null,
	thumbnail_image varchar2(100) not null,
	email varchar2(50) not null,
	age_range varchar2(10) not null,
	birthday varchar2(15) not null,
	phone_number varchar2(15),
	birthyear varchar2(10),
	shipping_address varchar2(50),
	constraint member_detail_pk primary key (id),
	constraint member_detail_fk foreign key (id) references member (id)
);
create table club(
	club_num number(10) primary key,
	id varchar2(30) foreign key references member_detail(id)
	club_loc varchar2(60) not null,
	club_name varchar2(60) not null,
	club_detail clob,
	club_img blob
);
create table club_join(
	club_num number(10) not null,
	id varchar2(30) not null,
	attendance_rate number,
	constraint club_join_detail_fk foreign key (club_num) references club (club_num),
	constraint club_join_detail_fk2 foreign key (id) references member_detail (id)
);
create table club_recruit(
	recruit_num number(10) primary key,
	club_num number(10) not null,
	id varchar2(30) not null,
	month_cost varchar2(20),
	register_cost varchar2(20),
	act_time varchar2(20),
	constraint club_recruit_fk foreign key (club_num) references club (club_num),
	constraint club_recruit_fk2 foreign key (id) references member_detail (id)
);
create table match(
	match_num number(10) primary key,
	id number(30) not null,
	type number(1) not null,
	home number(10) not null,
	away number(10) not null,
	start_time date not null,
	end_time date not null,
	address varchar2(50) not null,
	match_detail varchar2(100), 
	constraint match_fk foreign key (home) references club (club_num),
	constraint match_fk2 foreign key (away) references club (club_num)
);
create table match_join(
	matchJoin_num
);

























