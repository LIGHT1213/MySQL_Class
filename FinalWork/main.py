from tkinter import *
import pymysql
import Login
import RecordAndSearch
global db
#db = pymysql.connect("127.0.0.1","root","12345","XXXXSystem")
print("db connect!")
Login.UserLoginMain()
RecordAndSearch.RecordAndSearchMain()
