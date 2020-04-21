from tkinter import *
import pymysql
FManagerIDPword = "SELECT ManagerID,ManagerPWD FROM SysManager;"
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
        UserLoginOK.geometry('320x120')
        lb3 = Label(UserLoginOK, text='登陆成功',font=("黑体",10))
        lb3.place(x=125, y=10, relwidth=0.2, relheight=0.1)
        btn3 = Button(UserLoginOK, text='OK', command=UserLoginEndProcess)
        btn3.place(x=125, y=50, relwidth=0.2, relheight=0.15)
        
        #db.close()
        print("登陆成功")
    else:
        lb3 = Label(UserLoginUI, text='用户名或密码错误',font=("黑体",30))
        lb3.place(x=300, y=50, relwidth=0.5, relheight=0.1)
        print("用户名或密码错误")
        inp1.delete(0, END)  # 清空输入
        inp2.delete(0, END)  # 清空输入
    #db.close()
def UserSignUp():
    global inp7,inp8,inp9,UserReg
    UserReg=Tk()
    UserReg.title('User Sign Up')
    UserReg.geometry('640x480')
    lb1 = Label(UserReg, text='Your UserName',font=("黑体",15))
    lb1.place(x=20,y=100, relwidth=0.3, relheight=0.1)
    lb1 = Label(UserReg, text='your PassWord',font=("黑体",15))
    lb1.place(x=20,y=200, relwidth=0.3, relheight=0.1)
    lb1 = Label(UserReg, text='comfirm your PassWord',font=("黑体",15))
    lb1.place(x=-3,y=300, relwidth=0.5, relheight=0.1)
    inp7 = Entry(UserReg,font=("黑体",15))
    inp7.place(x=300, y=100, relwidth=0.5, relheight=0.1)
    inp8 = Entry(UserReg,show='*',font=("黑体",15))
    inp8.place(x=300, y=200, relwidth=0.5, relheight=0.1)
    inp9 = Entry(UserReg,show='*',font=("黑体",15))
    inp9.place(x=300, y=300, relwidth=0.5, relheight=0.1)
    btn4 = Button(UserReg, text='Ok', command=ProcessSignUP)
    btn4.place(x=250, y=400, relwidth=0.2, relheight=0.1)
def ProcessSignUP():
    SignUpID = str(inp7.get())
    SignUpPWD = str(inp8.get())
    ComfirmSignUpPWD = str(inp9.get())
    if SignUpPWD==ComfirmSignUpPWD and SignUpPWD!='' and SignUpID!='':
        sql = """INSERT INTO SysUser (SysUserID,SysUserPWD) VALUES('%s','%s'):"%(SignUpID,SignUpPWD)"""
        try:
            cursor.execute(sql)
            db.commit()
            print("insert ok!")
        except:
            db.rollback()
            print("insert false!")

        db.close()
    else:
        lb1 = Label(UserReg, text='Entered passwords differ!Or it is none',font=("黑体",15))
        lb1.place(x=100,y=0, relwidth=0.8, relheight=0.1)
def UserLoginEndProcess():
    UserLoginUI.destroy()
    UserLoginOK.destroy()
    print("窗口关闭")
def UserLoginMain():
    global inp1,inp2,UserLoginUI,cursor,db
    db = pymysql.connect("192.168.1.243","root","jBQDrHp8qgdmy","XXXXSystem")
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
    btn2 = Button(UserLoginUI, text='Sign in', command=UserLogin)
    btn2.place(x=562, y=600, relwidth=0.3, relheight=0.1)
    btn4 = Button(UserLoginUI, text='Sign Up', command=UserSignUp)
    btn4.place(x=162, y=600, relwidth=0.3, relheight=0.1)
    UserLoginUI.mainloop()