# from MySQLdb import connect, OperationalError
#
# try:
# #연결
#     db=connect(
#         user='webdb',
#         host='142.251.42.196',
#         port= 3306,db= 'webdb',
#         charset= 'utf8')
#     print ('success')
#
#
# print('연결성공')
# except OperationalError as e:
#     print(f'에러ㅣ{e}')
#
#
#
#
#
#
# print('end!')
#
#
# #crsor
# cursor = db.cursoer()
#
#
# print(errpe+m*e)
# except OperationalError as a:
# print('error!!!')


#--------------------------
from MySQLdb import connect, OperationalError

try:
    # 연결
    db = connect(
        user='webdb',
        password='webdb',
        host='127.0.0.1',
        port=3306,
        db='webdb',
        charset='utf8')

    print('success')
except OperationalError as e:
    print('error!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')

print('end!!!!')
# cursor
# cursor = db.cursor()




