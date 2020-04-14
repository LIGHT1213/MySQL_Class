from tkinter import *
import pymysql
FManagerID = "SELECT ManagerID FROM SysManager"
FManagerPWD ="SELECT ManagerPWD FROM SysManager"
def UserLogin():
    db = pymysql.connect("49.234.137.149","root","980807PCH","XXXXSystem")
    cursor = db.cursor()
    cursor.execute(sql)
    try:
        results = cursor.fetchall()
        for row in results:
            ManagerID = row[0]
            ManagerPWD =row[1]
    except:
        print ("网络中断，或者服务器ip改变，请杀一个程序员祭天")
    
    db.close()
root= Tk()
root.title('xxxxx的登录界面')
root.geometry('1024x768') # 这里的乘号不是 * ，而是小写英文字母 x
lb1 = Label(root, text='UserName',font=("黑体",30))
lb1.place(x=-300,y=200, relwidth=0.8, relheight=0.1)
lb1 = Label(root, text='PassWord',font=("黑体",30))
lb1.place(x=-300,y=400, relwidth=0.8, relheight=0.1)
inp1 = Entry(root)
inp1.place(x=300, y=200, relwidth=0.5, relheight=0.1)
inp2 = Entry(root)
inp2.place(x=300, y=400, relwidth=0.5, relheight=0.1)
btn2 = Button(root, text='Login', command=UserLogin)
btn2.place(x=362, y=600, relwidth=0.3, relheight=0.1)

root.mainloop()