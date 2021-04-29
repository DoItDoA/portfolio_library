drop table memberlist;

CREATE TABLE IF NOT EXISTS memberlist(
	m_name VARCHAR(100) NOT NULL,
	m_id VARCHAR(100) NOT NULL,
	m_gender varchar(100),
	m_password VARCHAR(100) NOT NULL,
	m_tel varchar(100),
	m_phone varchar(100) NOT NULL,
	m_mail VARCHAR(100),
	m_mail_id VARCHAR(100),
	m_mail_address VARCHAR(100),
	PRIMARY KEY (m_id)
) DEFAULT CHARSET = UTF8;


select * from memberlist;

