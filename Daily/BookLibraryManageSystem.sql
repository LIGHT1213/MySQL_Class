DROP DATABASE IF EXISTS LibraryManageSystem;
CREATE DATABASE LibraryManageSystem;
USE LibraryManageSystem;

CREATE TABLE SysManager
(
	ManagerID VARCHAR(20) PRIMARY KEY,
	ManagerPWD VARCHAR(10) NOT NULL
);

INSERT INTO SysManager VALUES("admin","12345");
CREATE TABLE ReaderType
(
	ReaderTypeData VARCHAR(10) PRIMARY KEY,
	BookDay INT UNSIGNED NOT NULL,
	BookNum INT UNSIGNED NOT NULL,
	OneDayFine DECIMAL(5,2) NOT NULL
);
INSERT INTO ReaderType VALUES("01",10,60,0.1);
INSERT INTO ReaderType VALUES("02",20,90,0.1);
INSERT INTO ReaderType VALUES("03",30,150,0.2);
CREATE TABLE ReaderInfo
(
	ReaderID VARCHAR(10) PRIMARY KEY,
	ReaderPWD VARCHAR(10) NOT NULL,
	ReaderName VARCHAR(40) NOT NULL,
	ReaderGender VARCHAR(5) NOT NULL,
	ReaderTypeData VARCHAR(10) NOT NULL,
	ReaderCompany VARCHAR(20) NOT NULL, 
	ReaderStartDay DATE NOT NULL,
	ReaderEndDay DATE NOT NULL,
	ReaderPhone VARCHAR(20) ,
	CONSTRAINT Fk_ReaderInfo_ReaderType FOREIGN KEY(ReaderTypeData) REFERENCES ReaderType(ReaderTypeData)
	
);
INSERT INTO ReaderInfo VALUE("2015010001","PassPwd","刘国平","男","01","外国语",20150901,20190901,"12323332333");
INSERT INTO ReaderInfo VALUE("2015120002","PassPwd2","赵一宁","女","02","古生物",20150901,201231,"12326662333");
INSERT INTO ReaderInfo VALUE("2001340008","PassPwd1","丁小峰","男","03","计算机",20010305,20360419,"12323332666");
INSERT INTO ReaderInfo VALUE("20170004","PassPwd3","张三","女","02","浙江大学城市学院",20200101,20221231,NULL);
INSERT INTO ReaderInfo VALUE("20170005","PassPwd3","张三1","女","02","浙江大学城市学院",20200101,20200422,"");
CREATE TABLE BookInfo
(
	ISBN VARCHAR(20) PRIMARY KEY,
	BookName VARCHAR(30) NOT NULL,
	BookAuthor VARCHAR(50) NOT NULL,
	BookTranslator VARCHAR(50),
	BookPublisher VARCHAR(40) NOT NULL,
	PublishDate DATE NOT NULL,
	BookPage INT UNSIGNED NOT NULL,
	BookPrice DECIMAL(6,2) NOT NULL
	
);
INSERT INTO BookInfo VALUE("978-7-111-56699-1","MySQL数据库基础与实践","夏辉 白萍 李晋 屈巍","无","机械工业出版社",20170608,303,55);
INSERT INTO BookInfo VALUE("978-7-111-56699-2","MySQL数据库基础与实践(再版)","夏辉 白萍 李晋 屈巍","无","机械工业出版社",20190608,350,65);
INSERT INTO BookInfo VALUE("978-7-121-25707-0","腾讯UED 体验设计之旅","任婕","夏辉","电子工业出版社",20150402,362,99.02);
INSERT INTO BookInfo VALUE("978-7-121-25707-1","腾讯UED 体验设计之旅","任婕","无","电子工业出版社",20150402,362,99.02);
INSERT INTO BookInfo VALUE("978-7-5086-3593-4","星巴克体验","【美】约瑟夫 米歇利","氨婷婷 夏辉","中信出版社",20121201,195,42);
CREATE TABLE CollectionBookInfo
(
	BookBarCode	VARCHAR(13) PRIMARY KEY,
	ISBN VARCHAR(19) NOT NULL,
	BStatus VARCHAR(5) NOT NULL,
	CONSTRAINT Fk_CollectionBookInfo_BookInfo FOREIGN KEY(ISBN) REFERENCES BookInfo(ISBN)
);
INSERT INTO CollectionBookInfo VALUE ("11","978-7-111-56699-1","可借");
INSERT INTO CollectionBookInfo VALUE ("22","978-7-121-25707-0","可借");
INSERT INTO CollectionBookInfo VALUE ("33","978-7-5086-3593-4","不可借");
CREATE TABLE BorrowingBookInfo
(
	BorrowID BIGINT AUTO_INCREMENT PRIMARY KEY,
	BookBarCode VARCHAR(13) NOT NULL,
	ReaderID VARCHAR(10) NOT NULL,
	BorrowDate DATE NOT NULL,
	DueDate DATE NOT NULL,
	ReturnDate DATE,
	OverDueDate INT UNSIGNED,
	BookFine DECIMAL(5,2),
	CONSTRAINT Fk_BorrowingBookInfo_CollectionBookInfo FOREIGN KEY(BookBarCode) REFERENCES CollectionBookInfo(BookBarCode),
	CONSTRAINT Fk_BorrowingBookInfo_ReaderInfo FOREIGN KEY(ReaderID) REFERENCES ReaderInfo(ReaderID)
);
INSERT INTO BorrowingBookInfo VALUE ("1","11","2015010001",20170922,20180922,20170527,0,0);
INSERT INTO BorrowingBookInfo VALUE ("2","22","2015120002",20170622,20180608,20170327,0,0);
INSERT INTO BorrowingBookInfo VALUE ("3","22","2001340008",20180622,20180608,20170327,0,0);
INSERT INTO BorrowingBookInfo VALUE ("4","33","2015120002",20190622,20180608,20170327,0,0);
INSERT INTO BorrowingBookInfo VALUE ("5","11","2015120002",20190622,20180608,20170327,0,0);
INSERT INTO BorrowingBookInfo VALUE ("6","22","2015010001",20190622,20180608,20170327,0,0);
INSERT INTO BorrowingBookInfo VALUE ("7","22","2001340008",20180622,20180608,20991231,0,0);
