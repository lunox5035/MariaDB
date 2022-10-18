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


    # 2.
    cursor = db.cursor()

    # 3. sql()
    sql= "delete from pet"
    count = cursor.execute(sql)

    # 4. commit
    db.commit()


    # 5. 자원 정리
    cursor.close()
    db.close()


    # 결과 확인
    if count >= 1:
        print(f'실행 결과 : 성공')
    eles:
        print(f'실행 결과 : 실패')


    # 에러 처리
except OperationalError as e:
    print(f'에러ㅣ{e}')