USE LibraryManageSystem;

#自然连接
SELECT * FROM ReaderType NATURAL JOIN ReaderInfo ;
#ps 这个语法在部分数据库中不支持

#查询读者类型01的人的姓名
SELECT ReaderName FROM ReaderType NATURAL JOIN ReaderInfo WHERE ReaderTypeData='01';
#查询可借阅书籍的书名
SELECT BookName FROM BookInfo NATURAL JOIN CollectionBookInfo WHERE BStatus="可借";
#查询在2019年6月22日借书的书名
SELECT BookName FROM BookInfo NATURAL JOIN CollectionBookInfo
			      NATURAL JOIN BorrowingBookInfo
			      WHERE BorrowDate=20190622;
#查询赵一宁的单日罚金
SELECT OneDayFine FROM ReaderType NATURAL JOIN ReaderInfo WHERE ReaderName="赵一宁";