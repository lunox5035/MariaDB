from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

#연결
def conn():
    db=connect(
        user='bookmall',
        password='bookmall',
        host='127.0.0.1',
        port=3306,
        db='bookmall',
        charset='utf8')
    return db

def list_이름():
    try:
        db =conn()
        cursor = db.cursor(DictCursor)
        ind = (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = "이름")
        sql = f'select {ind[1:]} from 이름 order by no desc'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러: {e}')


def add_이름():
    results = list_이름()

    for index, result in enumerate(results):
        print(f'{index + 1}\\{result["이름"]}')

