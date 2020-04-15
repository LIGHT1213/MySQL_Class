from tkinter import *
import pymysql
import Login
global db
db = pymysql.connect("49.234.137.149","root","980807PCH","XXXXSystem")
print("db connect!")
while Login.UserLoginMain()!= 2:
    {}