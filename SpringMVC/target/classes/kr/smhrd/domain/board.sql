select * from tbl_board;
create table tbl_board(
   idx int not null auto_increment,   -- 자동증가컬럼(1,2,3.....)
   title varchar(100) not null,
   contents varchar(4000) not null,
   writer varchar(50) not null,
   count int default 0,
   indate datetime not null default now(),
   primary key(idx)
);

truncate tbl_board;

create table min_board(
   id varchar (30) not null,
   pw varchar (30) not null,
   name varchar (30) not null,
   age varchar (30) not null,
   primary key(id)
);
insert into min_board(id,pw,name,age) values("min","1234","coco","12");
select * from min_board;