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

def list_category():
    try:
        db = conn()
        cursor = db.cursor(DictCursor)

        sql = 'select name as "car_name" from category order by no desc'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러: {e}')

def add_category():
    results = list_category()

    for index, result in enumerate(results):
        print(f'{index + 1}\\{result["car_name"]}')