USE LibraryManageSystem;
SELECT * FROM BookInfo AS a1, BookInfo AS a2 WHERE a1.BookPage=a2.BookPage;
SELECT BookName FROM BorrowingBookInfo a INNER JOIN CollectionBookInfo b ON a.BookBarCode=b.BookBarCode 
					 INNER JOIN BookInfo c ON b.ISBN=c.ISBN GROUP BY BookName ORDER BY COUNT(*) DESC LIMIT 3;
SELECT AVG(readbookavg) AS 人均 FROM (SELECT COUNT(BookBarCode) AS readbookavg FROM BorrowingBookInfo GROUP BY ReaderID) a;

SELECT COUNT(BookBarCode) FROM ReaderInfo LEFT JOIN  BorrowingBookInfo ON ReaderInfo.ReaderID=BorrowingBookInfo.ReaderID GROUP BY BorrowingBookInfo.ReaderID ;


SELECT AVG(readbookavg) AS 人均 FROM (SELECT COUNT(BookBarCode) AS readbookavg FROM ReaderInfo LEFT JOIN  BorrowingBookInfo ON ReaderInfo.ReaderID=BorrowingBookInfo.ReaderID GROUP BY BorrowingBookInfo.ReaderID) a;