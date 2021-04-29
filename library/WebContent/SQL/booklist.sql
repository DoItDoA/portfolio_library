drop table booklist;

CREATE TABLE IF NOT EXISTS booklist(
	b_name VARCHAR(200) NOT NULL,
	b_vol INT NOT NULL,
	b_serial CHAR(13) NOT NULL,
	b_author VARCHAR(50) NOT NULL,
	b_publisher VARCHAR(50) NOT NULL,
	b_location VARCHAR(40) NOT NULL,
	b_state VARCHAR(20),
	b_image VARCHAR(200),
	b_description text,
	b_registday VARCHAR(30) NOT NULL,
	b_hit INT NOT NULL,
	PRIMARY KEY (b_serial)
)default character set utf8 collate utf8_general_ci;


select * from booklist;
