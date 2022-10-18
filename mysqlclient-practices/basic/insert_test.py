# from MySQLdb import connect, OperationalError
#
# try:
#     # 1. 연결
#     db=connect(
#         user='webdb',
#         host='127.0.0.1',
#         port= 3306,
#         db= 'webdb',
#         charset= 'utf8')
#
#     # 2.
#     cursor = db.cursor()
#
#     # 3. sql()
#     sql= "insert into pet values('소금이','여혜린','cat','m','2014-04-20',null)"
#     count = cursor.execute(sql)
#
#     # 4. commit
#     db.commit()
#
#
#     # 5. 자원 정리
#     cursor.close()
#     db.close()
#
#
#     # 결과 확인
#     print(f '실행 결과: {"성공" if count == 1 else "실패"}')
#
#     # 에러 처리
# except OperationalError as e:
#     print(f '에러:{e}')

from MySQLdb import connect, OperationalError

try:
    # 1. 연결
    db = connect(
        user='webdb',
        password='webdb',
        host='127.0.0.1',
        port=3306,
        db='webdb',
        charset='utf8')

    # 2. cursor 생성
    cursor = db.cursor()

    # 3. sql(insert 문) 실행
    sql = "insert into pet values('소금이','여혜린','cat','m','2014-04-20',null)"
    count = cursor.execute(sql)

    # 4. commit
    db.commit()

    # 5. 자원 정리
    cursor.close()
    db.close()

    # 결과 확인
    print(f'실행 결과: {"성공" if count == 1 else "실패"}')

except OperationalError as e:
    # 에러 처리
    print(f'에러: {e}')


