/*쇼핑몰구현*/
/*use mysql*/
use webjava;

/*데이터베이스 생성
create database webjava default character set utf8;
*/

/* 데이터베이스 오픈 
show databases;
use webjava;
*/

/*유저 생성 및 암호 지정
grant all privileges on webjava.* to javauser@localhost identified by 'webjava';
*/

/* tblboard 테이블 */
create table tblboard (
 b_num int not null primary key AUTO_INCREMENT,
 b_subject varchar(100) not null,
 b_contents varchar(2000) not null,
 b_name varchar(50) not null,
 b_date datetime not null default sysdate()
);

select * from tblboard;
INSERT INTO tblboard (b_subject, b_name, b_contents) VALUES ('제목이다','홍길동','jsp프로그래밍');

/* tblboard2 테이블 */
create table tblboard2 (
 b_num int not null primary key AUTO_INCREMENT,
 b_subject varchar(100) not null,
 b_contents varchar(2000) not null,
 b_file varchar(200), 
 b_name varchar(50) not null,
 b_rdate datetime not null default sysdate(),
 b_udate timestamp default current_timestamp on update current_timestamp
);

select * from tblboard2;
delete from tblboard2;
drop table tblboard2;

/* tblnotice 테이블 */
create table tblnotice (
 n_num int not null primary key AUTO_INCREMENT,
 n_subject varchar(100) not null,
 n_contents varchar(2000) not null,
 n_file varchar(200), 
 n_name varchar(50) not null,
 n_rdate datetime not null default sysdate(),
 n_udate timestamp default current_timestamp on update current_timestamp
);

select * from tblnotice order by n_num desc
		limit 1 offset 0;
select * from tblnotice;
delete from tblnotice;
drop table tblnotice;

INSERT INTO tblnotice (n_subject, n_name, n_contents) VALUES ('제목이다','홍길동','jsp프로그래밍');


/* 관리자테이블*/
create table tbladmin (
	a_id varchar(50) not null primary key, -- 아이디 
	a_passwd varchar(500) not null, -- 비밀번호
	a_name varchar(50) not null, -- 성명
	a_rdate datetime not null default sysdate(),
	a_udate datetime not null default sysdate()
);

select * from tbladmin; 

/* 16진수로 암호화된 비번과 같이 데이터 추가 */
insert into tbladmin (a_id, a_passwd, a_name) 
	values('admin', hex(aes_encrypt('1234', sha2('123987!', 512))), '관리자');
insert into tbladmin (a_id, a_passwd, a_name) 
	values('subadmin', hex(aes_encrypt('12345', sha2('123987!', 512))), '보조관리자');
/* a_id와 암호화된 a_passwd와 매치되는 데이터 확인하기*/	
select * from tbladmin where 
	a_id = 'subadmin' and
	a_passwd = hex(aes_encrypt('12345', sha2('123987!', 512)));

/* 16진수로 암호화 복호화 연습 */
select hex(aes_encrypt('tiger', sha2('123!', 512)));
select aes_decrypt(unhex('FAEE86A08A044E2B3CCAADDECD3B272A'), sha2('123!', 512));	
	
select * from tbladmin;
drop table tbladmin;


/* 고객테이블*/
create table tblmember (
	m_id varchar(50) not null primary key, -- 아이디 
	m_passwd varchar(256) not null, -- 비밀번호
	m_fname varchar(50) not null,
	m_lname varchar(50) not null,
	m_name varchar(101) generated always as (concat(m_fname,' ',m_lname)), -- full name
	m_email varchar(100) not null, -- 이메일
	m_rdate datetime not null default sysdate(),
	m_udate timestamp default current_timestamp on update current_timestamp
);

drop table tblmember;
select * from tblmember;
delete from tblmember;

/* 16진수로 암호화된 비번과 같이 데이터 추가 */
insert into tblmember (m_id, m_passwd, m_fname, m_lname, m_email) 
	values('otter', hex(aes_encrypt('1234', sha2('123!', 512))), 'Sudal', 'Lee', 'abc@abc.com');


/* 상품테이블*/
create table tblproduct(
	p_code int not null primary key auto_increment,
	p_name varchar(100) not null, 
	p_price int not null,
	p_stock int not null,
	p_soldout tinyint(1) not null default 0,
	p_rdate TIMESTAMP default current_timestamp,
	p_udate TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- p_status tinyint default1
--p_status char(1) not null default 'A', A활성 B비활성
alter table tblproduct auto_increment=1001; 
-- 출력되는 경우 영수증 번호 자리수를 유지하기 위해 (4자리)
-- 단, 부족하지 않게. 쇼핑몰 매출 규모에 맞게 (8자리 이상 등)
select * from tblproduct;
delete from tblproduct;
drop table tblproduct;

/* 장바구니 main */
-- 실제 정보는 장바구니sub로 분리
create table tblcartmain (
	cm_code int not null primary key auto_increment,
	m_id varchar(50) not null, -- FK
	-- 총금액을 적어놨다가 불일치 될수 있으니까 총금액 필드만들지 않고
	-- 항상 실제 상품을 조회해서 가져오는것이 더 데이터를 안전하게 사용할수 있다. 이건 장바구니sub에서
	cm_rdate datetime not null default sysdate(),
	cm_udate datetime not null default sysdate(),
	constraint foreign key (m_id) references tblmember(m_id) -- constraint 붙이고 안붙이고 상관없음 이름 주려면 필요
);

alter table tblcartmain auto_increment=1001;
-- select * from tblcartmain;

/* 장바구니 sub */
create table tblcartsub(
	cs_code int not null primary key auto_increment,
	cm_code int not null, -- FK 
	p_code int not null, -- FK
	cs_cnt int not null, -- 수량
	cs_rdate datetime not null default sysdate(),
	cs_udate datetime not null default sysdate(),
	foreign key (cm_code) references tblcartmain(cm_code),
	foreign key (p_code) references tblproduct(p_code)
);

alter table tblcartsub auto_increment=1001;
select * from tblcartsub;

/* 주문 main */
create table tblordermain (
	om_code int not null primary key auto_increment,
	m_id varchar(50) not null, -- FK 
	-- 장바구니는 버려도 되는 데이터이니까 foreign key로 연결해주면 안됨, 특정순간만 필요 
	om_rdate datetime not null default sysdate(),
	om_udate datetime not null default sysdate(),
	foreign key (m_id) references tblmember(m_id) 
);

alter table tblordermain auto_increment=1001;
-- select * from tblordermain;

/* 주문 sub */
create table tblordersub(
	os_code int not null primary key auto_increment,
	om_code int not null, -- FK 
	p_code int not null, -- FK
	os_cnt int not null, -- 수량
	os_rdate datetime not null default sysdate(),
	os_udate datetime not null default sysdate(),
	foreign key (om_code) references tblordermain(om_code),
	foreign key (p_code) references tblproduct(p_code)
);

alter table tblordersub auto_increment=1001;
-- select * from tblordersub;

/* 전체 테이블 삭제 코드 미리 만들어 놓기
foreign key가 먼저 있는 것 부터
drop table tblordersub;
drop table tblordermain;
drop table tblcartsub;
drop table tblcartmain;
drop table tblproduct;
drop table tblmember;
*/

insert into tblmember (m_id, m_name, m_passwd) values ('tiger', '홍길동', '1234');
insert into tblmember (m_id, m_name, m_passwd) values ('lion', '김삿갓', '1234');
select * from tblmember;

insert into tblproduct (p_name, p_price) values ('삼성냉장고200리터', 1000000);
insert into tblproduct (p_name, p_price) values ('엘지세탁기10리터', 800000);
insert into tblproduct (p_name, p_price) values ('농심새우깡', 2000);
insert into tblproduct (p_name, p_price) values ('롯데콘칩', 1000);
select * from tblproduct;

insert into tblcartmain (m_id) values ('tiger'); -- tiger 장바구니코드발생
insert into tblcartmain (m_id) values ('lion'); -- lion 장바구니코드발생
select * from tblcartmain;

insert into tblcartsub(cm_code, p_code, cs_cnt) values (1003, 1001, 1);
insert into tblcartsub(cm_code, p_code, cs_cnt) values (1003, 1003, 5);
insert into tblcartsub(cm_code, p_code, cs_cnt) values (1004, 1002, 1);
insert into tblcartsub(cm_code, p_code, cs_cnt) values (1004, 1004, 3);
select * from tblcartsub;

-- 시뮬레이션 시작 --

/* tiger의 장바구니 내역조회 */ 
select cm.cm_code, cm.m_id, m.m_name, cs.p_code, p.p_name, p.p_price, cs.cs_cnt, 
		p.p_price * cs.cs_cnt
	from tblcartmain cm, tblcartsub cs, tblproduct p, tblmember m
	where cm.cm_code = cs.cm_code 
	-- cm.cm_code : primary key
	-- cs.cm_code : foreign key
		and p.p_code = cs.p_code
		and m.m_id = cm.m_id
		and cm.m_id = 'tiger';
		
/* tiger 의 장바구니 합계 */
-- select sum(p_price) from tblproduct; sum연산자사용
/* select cm.cm_code, cm.m_id, cs.p_code, p.p_name, p.p_price, cs.cs_cnt, 
		p.p_price * cs.cs_cnt
	from tblcartmain cm, tblcartsub cs, tblproduct p
	where cm.cm_code = cs.cm_code 
		and p.p_code = cs.p_code
		and cm.m_id = 'tiger';
*/
/* select p.p_price * cs.cs_cnt
	from tblcartmain cm, tblcartsub cs, tblproduct p
	where cm.cm_code = cs.cm_code 
		and p.p_code = cs.p_code
		and cm.m_id = 'tiger';
*/
select sum(p.p_price * cs.cs_cnt)
	from tblcartmain cm, tblcartsub cs, tblproduct p
	where cm.cm_code = cs.cm_code 
		and p.p_code = cs.p_code
		and cm.m_id = 'tiger';		

-- 구매진행하는순간 장바구니 비우기
/* 장바구니의 tiger가 저장한 모든 내용을 구매 */
insert into tblordermain (m_id) values ('tiger');
select * from tblordermain;
insert into tblordersub (om_code, p_code, os_cnt) 
	select 1001, p_code, cs_cnt from tblcartsub 
	where cm_code = (select cm_code from tblcartmain where m_id = 'tiger');
-- sub query, 부질의 : 미리 추려내서 성능이 더 좋다 

-- delete from tblordersub;
	
/* tiger가 가장 최근에 구매한 내역 */
-- 가장 최근에 tiger가 주문한 주문번호 : subquery로 들어갈 질의문
/* select om_code from tblordermain where m_id = 'tiger' 
	order by om_code desc limit 1; */
select om.om_code, om.m_id, os.p_code, os.os_cnt,
	p.p_price * os.os_cnt 
	from tblordermain om, tblordersub os, tblproduct p 
	where om.om_code = os.om_code
		and p.p_code = os.p_code
		and om.om_code = 
		(select om_code from tblordermain where m_id = 'tiger' 
		order by om_code desc limit 1);
		
/* tiger가 가장 최근에 구매한 금액 총합계 조회 */
select sum(p.p_price * os.os_cnt)
from tblordermain om, tblordersub os, tblproduct p 
	where om.om_code = os.om_code
		and p.p_code = os.p_code
		and om.om_code = 
		(select om_code from tblordermain where m_id = 'tiger' 
		order by om_code desc limit 1);

/* lion의 장바구니 내역조회 */ 
select cm.cm_code, cm.m_id, m.m_name, cs.p_code, p.p_name, p.p_price,
		cs.cs_cnt, p.p_price * cs.cs_cnt 
	from tblcartmain cm, tblcartsub cs, tblproduct p, tblmember m
	where cm.cm_code = cs.cm_code
		and p.p_code = cs.p_code
		and m.m_id = cm.m_id
		and m.m_id = 'lion';

/* lion의 장바구니 합계 */
select sum(p.p_price * cs.cs_cnt)
	from tblcartmain cm, tblcartsub cs, tblproduct p
	where cm.cm_code = cs.cm_code
	 	and p.p_code = cs.p_code 
	 	and cm.m_id = 'lion';

/* 장바구니의 lion 이 저장한 모든 내용을 구매 */
insert into tblordermain(m_id) values ('lion');
select * from tblordermain;
insert into tblordersub(om_code, p_code, os_cnt)
	select 1002, p_code, cs_cnt from tblcartsub
	where cm_code = (select cm_code from tblcartmain where m_id = 'lion');

/* lion이 가장 최근에 구매한내역 */
select om.om_code, om.m_id, os.p_code, os.os_cnt, 
	p.p_price * os.os_cnt
	from tblordermain om, tblordersub os, tblproduct p
	where p.p_code = os.p_code
	and om.om_code = os.om_code
	and om.om_code = (select om_code from tblordermain where m_id = 'lion'
		order by om_code desc limit 1);
		
/* lion이 가장 최근에 구매한 금액 총합계 조회 */
select sum(p.p_price * os.os_cnt)
from tblordermain om, tblordersub os, tblproduct p
	where p.p_code = os.p_code
	and om.om_code = os.om_code
	and om.om_code = (select om_code from tblordermain where m_id = 'lion'
		order by om_code desc limit 1);
		
desc tblmember;
select * from tblmember;

--이 순서대로
delete from tblproduct;
delete from tblordersub;
delete from tblordermain;
delete from tblcartsub;
delete from tblcartmain;

delete from tblordermain;
delete from tblordersub;
	
desc tblcartsub;
desc tblcartmain;
select * from tblcartmain;
select * from tblcartsub;

select * from tblordermain;
select * from tblordersub;
		
-- Pagination을 위한 쿼리

--	재귀쿼리
insert into tblboard (b_subject, b_contents, b_name)
	select b_subject, b_contents, b_name from tblboard; 

select count(*) from tblboard;

select * from tblboard order by b_num desc limit 10 offset 10;
select * from tblboard limit 5;

---------
select count(*) from tblmember;
---------

select * from tblnotice;
--	재귀쿼리
insert into tblnotice (n_subject, n_contents, n_name)
	select n_subject, n_contents, n_name from tblnotice; 
	
select count(*) from tblnotice;
