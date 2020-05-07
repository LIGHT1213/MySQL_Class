USE LibraryManageSystem;
#查询可借书籍时间比01型读者长的的读者们的姓名

SELECT ReaderName FROM ReaderInfo WHERE EXISTS (SELECT * FROM ReaderType WHERE ReaderType.ReaderTypeData=ReaderInfo.ReaderTypeData AND BookDay>10);
#查询在2019年6月22日借书的人的姓名
#SELECT ReaderName FROM ReaderInfo WHERE ReaderID IN(SELECT ReaderID FROM BorrowingBookInfo WHERE BorrowDate=20190622);
SELECT ReaderName FROM ReaderInfo WHERE EXISTS (SELECT * FROM BorrowingBookInfo WHERE ReaderInfo.ReaderID=BorrowingBookInfo.ReaderID AND BorrowDate=20190622);
#2018年没有借过图书的读者名单
SELECT ReaderName FROM ReaderInfo WHERE NOT EXISTS(SELECT * FROM ReaderInfo NATURAL JOIN BorrowingBookInfo 
		                		   WHERE ReaderInfo.ReaderID = BorrowingBookInfo.ReaderID AND 
		                		  (BorrowDate>=20180101 AND BorrowDate<=20181231));
#没有借过书号为11的读者姓名
SELECT ReaderName FROM ReaderInfo WHERE EXISTS (SELECT * FROM BorrowingBookInfo WHERE ReaderInfo.ReaderID = BorrowingBookInfo.ReaderID AND BookBarCode='11');
#没有借过数据库相关书的读者姓名
SELECT ReaderName FROM ReaderInfo WHERE NOT EXISTS(SELECT * FROM BorrowingBookInfo NATURAL JOIN CollectionBookInfo
										   NATURAL JOIN BookInfo
										   WHERE BookName LIKE '%数据库%'
										   AND ReaderInfo.ReaderID = BorrowingBookInfo.ReaderID);
