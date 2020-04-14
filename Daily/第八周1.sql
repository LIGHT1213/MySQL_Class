USE LibraryManageSystem;
#查询赵一宁的读者类型
SELECT ReaderType.ReaderTypeData FROM ReaderType INNER JOIN ReaderInfo ON ReaderType.ReaderTypeData=ReaderInfo.ReaderTypeData WHERE ReaderInfo.ReaderName="赵一宁";
#查询在2019年6月22日借书的人的姓名
SELECT ReaderName FROM BorrowingBookInfo INNER JOIN ReaderInfo ON BorrowingBookInfo.ReaderID=ReaderInfo.ReaderID WHERE BorrowingBookInfo.BorrowDate=20190622;
#查询借阅的“电子工业出版社”的书籍的人的姓名。
SELECT ReaderName FROM BorrowingBookInfo INNER JOIN CollectionBookInfo ON BorrowingBookInfo.BookBarCode=CollectionBookInfo.BookBarCode
				         INNER JOIN BookInfo ON BookInfo.ISBN=CollectionBookInfo.ISBN
				         INNER JOIN ReaderInfo ON ReaderInfo.ReaderID=BorrowingBookInfo.ReaderID
				         WHERE BookInfo.BookPublisher="电子工业出版社";
#单纯试一下一张表能不能和自己连接
#SELECT BookName from BookInfo,BookInfo ;    目前来看好像不能这么玩233

#借阅作者或者译者包含夏辉的读者类型
SELECT ReaderType.ReaderTypeData FROM ReaderType INNER JOIN ReaderInfo ON ReaderType.ReaderTypeData=ReaderInfo.ReaderTypeData
						 INNER JOIN BorrowingBookInfo ON ReaderInfo.ReaderID=BorrowingBookInfo.ReaderID
						 INNER JOIN CollectionBookInfo ON  CollectionBookInfo.BookBarCode=BorrowingBookInfo.BookBarCode
						 INNER JOIN BookInfo ON CollectionBookInfo.ISBN=BookInfo.ISBN
						 WHERE BookInfo.BookAuthor LIKE "%夏辉%" OR BookInfo.BookTranslator LIKE "%夏辉%";
#以下为区分using和on的差异

SELECT * FROM ReaderType INNER JOIN ReaderInfo ON ReaderType.ReaderTypeData=ReaderInfo.ReaderTypeData;
SELECT * FROM ReaderType INNER JOIN ReaderInfo USING (ReaderTypeData);

#自然连接
SELECT * FROM ReaderType NATURAL JOIN ReaderInfo ;
#ps 这个语法在部分数据库中不支持

				      



