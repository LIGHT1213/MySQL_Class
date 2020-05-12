USE LibraryManageSystem;
#新增一本馆藏书籍信息（delete保证多次查询不出错）
DELETE FROM CollectionBookInfo WHERE BookBarCode ="44";
INSERT INTO CollectionBookInfo (BookBarCode,ISBN,BStatus) VALUES ("44","978-7-121-25707-1","可借");
SELECT * FROM CollectionBookInfo;
#由于以上的语句只能在不delete情况下只能运行运行一次所以使用replace代替,同时修改BookBarCode以便于观察
REPLACE INTO CollectionBookInfo (BookBarCode,ISBN,BStatus) VALUES ("77","978-7-121-25707-1","可借");
SELECT * FROM CollectionBookInfo;
#创建一个与ReaderType表结构的名为tmp的临时表格在后面备用
DROP TABLE tmp;
CREATE TABLE tmp
(
	ReaderTypeData VARCHAR(10) PRIMARY KEY,
	BookDay INT UNSIGNED NOT NULL,
	BookNum INT UNSIGNED NOT NULL,
	OneDayFine DECIMAL(5,2) NOT NULL
); 
INSERT INTO tmp (ReaderTypeData,BookDay,BookNum,OneDayFine) VALUES ((SELECT ReaderTypeData FROM ReaderType WHERE ReaderTypeData='03'),
								    (SELECT BookDay FROM ReaderType WHERE ReaderTypeData='03'),
								    (SELECT BookNum FROM ReaderType WHERE ReaderTypeData='03'),
								    (SELECT OneDayFine FROM ReaderType WHERE ReaderTypeData='03'));
#删除掉ReaderInfo中name为张三1的信息
DELETE FROM ReaderInfo WHERE ReaderName="张三1";
#以下这句话保证其多次查询时不出错
REPLACE INTO ReaderInfo VALUE("20170005","PassPwd3","张三1","女","02","浙江大学城市学院",20200101,20200422,"");
SELECT *FROM ReaderInfo;
#删除ISBN号码为978-7-5086-3593-4的被借记录
INSERT INTO BorrowingBookInfo VALUE ("4","33","2015120002",20190622,20180608,20170327,0,0); #保证可以多次查询
DELETE FROM BorrowingBookInfo WHERE BookBarCode=(SELECT BookBarCode FROM CollectionBookInfo WHERE ISBN='978-7-5086-3593-4');
SELECT *FROM BorrowingBookInfo;
#使用truncate清空表tmp
TRUNCATE tmp;
SELECT * FROM tmp;
#将isbn号码为978-7-121-25707-1的书籍名更新为腾讯UED 体验设计之旅（续）
UPDATE BookInfo SET BookName="腾讯UED 体验设计之旅（续）" WHERE ISBN='978-7-121-25707-1';
#将赵一宁的BorrowDate改为20200101
UPDATE BorrowingBookInfo SET BorrowDate=20200101 WHERE ReaderID=(SELECT ReaderID FROM ReaderInfo WHERE ReaderName='赵一宁');