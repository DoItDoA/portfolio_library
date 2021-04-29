show tables;
drop table wishbook;
CREATE TABLE wishbook (
       num int not null auto_increment,
       id varchar(40) not null,
       name varchar(100) not null,
       author varchar(100) not null,
       publisher varchar(50) not null,
       location varchar(50) not null,
       description text,
       year varchar(30),
       phone varchar(20),
       sms varchar(10),
       ip varchar(20),
       price varchar(20),
       PRIMARY KEY (num)
)default CHARSET=utf8;
select * from wishbook;