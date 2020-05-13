from tkinter import *
import pymysql
def RecordAndSearchMain():
    RecordAndSearchUI= Tk()
    RecordAndSearchUI.title('xxxx的综合管理界面')
    RecordAndSearchUI.geometry('300x400')
    btn1 = Button(RecordAndSearchUI, text='Record', command=Record)
    btn1.place(x=105, y=78, relwidth=0.3, relheight=0.1)
    btn2 = Button(RecordAndSearchUI, text='Search', command=Search)
    btn2.place(x=105, y=234, relwidth=0.3, relheight=0.1)
    RecordAndSearchUI.mainloop()
def Record():
    a=a+1
def Search():
    db = pymysql.connect("127.0.0.1","root","12345","XXXXSystem")
    SearchUI= Tk()
    SearchUI.title('xxxx的查询界面')
    SearchUI.geometry('1024x768')
    GetRecord = "SELECT InOrOut,NumOfMoney,InOrOutCauseDate FROM MoneyRecord;"
    cursor = db.cursor()
    cursor.execute(GetRecord)
    try:
        results = cursor.fetchall()
        for row in results:
            InOrOut = row[0]
            NumOfMoney =row[1]
            InOrOutCauseDate=row[2]
        print("InOrOut=%s,NumOfMoney=%s,InOrOutCauseDate=%s"%(InOrOut,NumOfMoney,InOrOutCauseDate))
    except:
        print ("没有获取到相关的数据")
    txt=Text(SearchUI)
    txt.pack()
    ResultOfSearch="InOrOut=%s,NumOfMoney=%s,InOrOutCauseDate=%s"
    val=(InOrOut,NumOfMoney,InOrOutCauseDate)
    s=str(ResultOfSearch,val)+'\n'
    txt.insert(END,s)
    SearchUI.mainloop()

