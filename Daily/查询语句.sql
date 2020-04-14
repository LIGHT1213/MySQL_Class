###################################################第六周###############################################################
USE LibraryManageSystem;
#选择语句
SELECT * FROM ReaderType WHERE OneDayFine=0.1;
#投影语句
SELECT ReaderCompany FROM ReaderInfo; #无重复
SELECT  OneDayFine FROM ReaderType; #表内重复全显示
SELECT DISTINCT OneDayFine FROM ReaderType; #表内重复显示不重复

#选择部分列
SELECT ReaderName FROM ReaderInfo WHERE ReaderTypeData="01";
#显示字段
SELECT ReaderTypeData AS 用户类型,OneDayFine AS 调整前,OneDayFine*2 AS 调整后 FROM ReaderType;
#最高 最低 平均值
SELECT *,MAX(BookNum) AS 最久借书天数, MIN(OneDayFine) AS 最低罚款金额,AVG(OneDayFine) AS 平均罚款金额 FROM ReaderType;
#数数
SELECT COUNT(ReaderTypeData="01") AS 法外狂徒人数 FROM ReaderInfo;
#排序
SELECT ReaderTypeData AS 用户类型,OneDayFine AS 调整前,OneDayFine*2 AS 调整后 FROM ReaderType ORDER BY 调整后 DESC;
########################################################################################################################
###################################################第七周###############################################################
#LIMIT
SELECT *FROM ReaderType LIMIT 2;
SELECT ReaderTypeData AS 用户类型,OneDayFine AS 调整前,OneDayFine*2 AS 调整后 FROM ReaderType ORDER BY 调整后 DESC LIMIT 2;
#select 用户类型,调整前,调整后 from ReaderType order by 调整后 desc limit 1   只有在同一个语句忠as后才能直接使用。

SELECT ReaderTypeData AS 用户类型,OneDayFine AS 调整前,OneDayFine*2 AS 调整后 FROM ReaderType ORDER BY 调整后 DESC LIMIT 1; #取出调整后单日罚金最高的

#多字段排序
SELECT * FROM ReaderType ORDER BY BookDay ,BookNum DESC;
#汉字排序
SELECT * FROM ReaderInfo ORDER BY CONVERT(ReaderName USING gbk);

#模糊查询
SELECT * FROM ReaderInfo WHERE ReaderName LIKE "法外狂徒%";
SELECT * FROM ReaderInfo WHERE ReaderName LIKE "%三%";
SELECT * FROM ReaderInfo WHERE ReaderName LIKE "三_";
# %可以为空，_不可为空


#between.....and  in  
SELECT * FROM ReaderType WHERE BookNum BETWEEN 20 AND 100;
SELECT * FROM ReaderType WHERE BookNum IN(20,100);

