USE librarymanagesystem;
SELECT * FROM CollectionBookInfo INNER JOIN BookInfo ON CollectionBookInfo.ISBN=BookInfo.ISBN WHERE BStatus="可借";
SELECT ReaderInfo.ReaderName FROM ReaderInfo INNER JOIN BorrowingBookInfo ON ReaderInfo.ReaderID =BorrowingBookInfo.ReaderID GROUP BY ReaderInfo.ReaderName ORDER BY COUNT(ReaderInfo.ReaderName) DESC LIMIT 10;
SELECT BookInfo.BookName FROM BorrowingBookInfo INNER JOIN CollectionBookInfo ON BorrowingBookInfo.BookBarCode = CollectionBookInfo.BookBarCode
				       INNER JOIN BookInfo ON CollectionBookInfo.ISBN =BookInfo.ISBN WHERE BorrowingBookInfo.BorrowDate>20180101 AND BorrowingBookInfo.BorrowDate<20181231
				       GROUP BY BookInfo.BookName 
				       ORDER BY COUNT(BookInfo.BookName) DESC LIMIT 10;
				       
				       
SELECT ReaderInfo.ReaderName FROM ReaderInfo WHERE ReaderInfo.ReaderID NOT IN
(SELECT BorrowingBookInfo.ReaderID FROM ReaderInfo INNER JOIN BorrowingBookInfo ON ReaderInfo.ReaderID = BorrowingBookInfo.ReaderID 
					     GROUP BY(BorrowingBookInfo.ReaderID ));
					    			     
SELECT BorrowingBookInfo.BookBarCode FROM BorrowingBookInfo INNER JOIN ReaderInfo ON ReaderInfo.ReaderID = BorrowingBookInfo.ReaderID 
							    WHERE ReaderInfo.ReaderName="丁小峰";
SELECT BorrowingBookInfo.BookBarCode FROM BorrowingBookInfo INNER JOIN ReaderInfo ON ReaderInfo.ReaderID = BorrowingBookInfo.ReaderID 
							    WHERE ReaderInfo.ReaderName="丁小峰" AND BorrowingBookInfo.ReturnDate>=NOW();
SELECT BookInfo.BookName FROM BorrowingBookInfo INNER JOIN ReaderInfo ON ReaderInfo.ReaderID = BorrowingBookInfo.ReaderID 
							    INNER JOIN CollectionBookInfo ON CollectionBookInfo.BookBarCode=BorrowingBookInfo.BookBarCode
							    INNER JOIN BookInfo ON CollectionBookInfo.ISBN=BookInfo.ISBN
							    WHERE ReaderInfo.ReaderName="丁小峰";					    