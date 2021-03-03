create table match_join(
	matchJoin_num number(10) primary key,
	match_num number(10) not null,
	id varchar2(30) not null,
	club_num number(10) not null,
	join_position varchar2(10) not null,
	join_count number(2) not null,
	join_cost number(10) not null,
	join_detail varchar2(100), 
	join_att varchar2(200),
	constraint matchJoin_fk foreign key (match_num) references match(match_num),
	constraint matchJoin_fk2 foreign key (club_num) references club(club_num)
);
crate table club_rating (
	clubRating_num number(10) primary key,
	match_num number(10) not null,
	id number(30) not null,
	club_num number(10) not null,
	perform number(2) not null,
	manner number(2) not null,
	rating_detail varchar2(100) not null,
	constraint clubRating_fk foreign key (match_num) references match(match_num),
	constraint clubRating_fk2 foreign key (club_num) references club(club_num)
);
create sequence club_seq;
create sequence recruit_seq;
create sequence match_seq;
create sequence matchJoin_seq;
create sequence clubRating_seq;





