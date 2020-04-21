USE LibraryManageSystem;
#复习部分
SELECT * FROM BorrowingBookInfo INNER JOIN ReaderInfo ON BorrowingBookInfo.ReaderID=ReaderInfo.ReaderID;
#左连接
SELECT * FROM ReaderInfo LEFT JOIN BorrowingBookInfo ON BorrowingBookInfo.ReaderID=ReaderInfo.ReaderID;
SELECT * FROM ReaderInfo LEFT JOIN BorrowingBookInfo ON BorrowingBookInfo.ReaderID=ReaderInfo.ReaderID WHERE BorrowingBookInfo.BorrowID IS NULL;