USE LibraryManageSystem;
#查询在2019年6月22日借书的人的姓名
#SELECT ReaderName FROM BorrowingBookInfo INNER JOIN ReaderInfo ON BorrowingBookInfo.ReaderID=ReaderInfo.ReaderID WHERE BorrowingBookInfo.BorrowDate=20190622;

SELECT ReaderName FROM ReaderInfo WHERE ReaderID IN(SELECT ReaderID FROM BorrowingBookInfo WHERE BorrowDate=20190622);
#查询借阅的“电子工业出版社”的书籍的人的姓名。
#SELECT ReaderName FROM BorrowingBookInfo INNER JOIN CollectionBookInfo ON BorrowingBookInfo.BookBarCode=CollectionBookInfo.BookBarCode
#				         INNER JOIN BookInfo ON BookInfo.ISBN=CollectionBookInfo.ISBN
#				         INNER JOIN ReaderInfo ON ReaderInfo.ReaderID=BorrowingBookInfo.ReaderID
#				         WHERE BookInfo.BookPublisher="电子工业出版社";

SELECT ReaderName FROM ReaderInfo WHERE ReaderID IN(SELECT ReaderID FROM BorrowingBookInfo WHERE BookBarCode IN (SELECT BookBarCode FROM CollectionBookInfo WHERE ISBN IN (SELECT ISBN FROM BookInfo WHERE BookPublisher ='电子工业出版社')));
#借阅作者或者译者包含夏辉的读者类型
#SELECT ReaderType.ReaderTypeData FROM ReaderType INNER JOIN ReaderInfo ON ReaderType.ReaderTypeData=ReaderInfo.ReaderTypeData
#						  INNER JOIN BorrowingBookInfo ON ReaderInfo.ReaderID=BorrowingBookInfo.ReaderID
#						  INNER JOIN CollectionBookInfo ON  CollectionBookInfo.BookBarCode=BorrowingBookInfo.BookBarCode
#						  INNER JOIN BookInfo ON CollectionBookInfo.ISBN=BookInfo.ISBN
#						  WHERE BookInfo.BookAuthor LIKE "%夏辉%" OR BookInfo.BookTranslator LIKE "%夏辉%";
SELECT ReaderName FROM ReaderInfo WHERE ReaderID IN(SELECT ReaderID FROM BorrowingBookInfo WHERE BookBarCode IN (SELECT BookBarCode FROM CollectionBookInfo WHERE ISBN IN (SELECT ISBN FROM BookInfo WHERE BookAuthor LIKE "%夏辉%" OR BookTranslator LIKE "%夏辉%")));

