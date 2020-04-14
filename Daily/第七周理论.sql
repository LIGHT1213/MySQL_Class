USE LibraryManageSystem;
#1、查询馆藏的“电子工业出版社”出版的书籍数量（书名相同的统计为1本）。
SELECT BookPublisher,COUNT(DISTINCT BookName) AS 书籍数量 FROM BookInfo  GROUP BY  BookPublisher HAVING BookPublisher="电子工业出版社" ;
#2、查询馆藏的每一个出版社的书籍数量，查询结果显示出版社，馆藏数量。
SELECT BookPublisher,COUNT(*) AS 书籍数量 FROM BookInfo GROUP BY  BookPublisher ;
#3、查询馆藏书籍拥有量超过2本的出版社清单，查询结果显示出版社，馆藏数量。
SELECT BookPublisher,COUNT(*) AS 书籍数量 FROM BookInfo GROUP BY  BookPublisher HAVING 书籍数量>=2;
#4、2019年度最受欢迎的的三本书，查询结果显示图书条形码（bookCode）。
SELECT BookBarCode  FROM BorrowingBookInfo WHERE BorrowDate>=20190101 AND BorrowDate<=20191231 GROUP BY  BookBarCode ORDER BY COUNT(*) LIMIT 3;
#5、查询2018年度读书最多的人，查询结果显示读者编号。
SELECT ReaderID,COUNT(*) AS 借书数量 FROM BorrowingBookInfo WHERE BorrowDate>=20180101 AND BorrowDate<=20181231 GROUP BY  ReaderID ;