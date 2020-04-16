from tkinter import *
import pymysql
FManagerIDPword = "SELECT ManagerID,ManagerPWD FROM SysManager"
db = pymysql.connect("49.234.137.149","root","980807PCH","XXXXSystem")
def UserLogin():
    global UserLoginOK
    cursor = db.cursor()
    cursor.execute(FManagerIDPword)
    try:
        results = cursor.fetchall()
        for row in results:
            ManagerID = row[0]
            ManagerPWD =row[1]
        print("ManagerID=%s,ManagerPWD=%s"%(ManagerID,ManagerPWD))
    except:
        print ("网络中断或者服务器ip改变，请杀一个程序员祭天")
    InputID = str(inp1.get())
    InputPWD = str(inp2.get())
    if ManagerID==InputID and ManagerPWD==InputPWD:
        UserLoginOK=Tk()
        UserLoginOK.title('%s Login success'%(ManagerID))
        UserLoginOK.geometry('640x480')
        btn2.place(x=250, y=200, relwidth=0.2, relheight=0.1)
        btn2 = Button(UserLoginOK, text='OK', command=UserLoginEndProcess)
        #db.close()
        print("登陆成功")
        return 2
    else:
        print("用户名或密码错误")
        inp1.delete(0, END)  # 清空输入
        inp2.delete(0, END)  # 清空输入
    #db.close()
def UserLoginEndProcess():
    UserLoginUI.destroy
    UserLoginOK.destroy
    print("窗口关闭")
def UserLoginMain():
    global inp1,inp2,UserLoginUI
    UserLoginUI= Tk()
    UserLoginUI.title('xxxxx的登录界面')
    UserLoginUI.geometry('1024x768') # 这里的乘号不是 * ，而是小写英文字母 x
    lb1 = Label(UserLoginUI, text='UserName',font=("黑体",30))
    lb1.place(x=-300,y=200, relwidth=0.8, relheight=0.1)
    lb1 = Label(UserLoginUI, text='PassWord',font=("黑体",30))
    lb1.place(x=-300,y=400, relwidth=0.8, relheight=0.1)
    inp1 = Entry(UserLoginUI,font=("黑体",30))
    inp1.place(x=300, y=200, relwidth=0.5, relheight=0.1)
    inp2 = Entry(UserLoginUI,show='*',font=("黑体",30))
    inp2.place(x=300, y=400, relwidth=0.5, relheight=0.1)
    btn2 = Button(UserLoginUI, text='Login', command=UserLogin)
    btn2.place(x=362, y=600, relwidth=0.3, relheight=0.1)

    UserLoginUI.mainloop()