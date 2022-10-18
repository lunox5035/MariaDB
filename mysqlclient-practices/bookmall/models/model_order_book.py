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

def list_order_book():
    try:
        db =conn()
        cursor = db.cursor(DictCursor)

        sql = 'select book_no, cart_no from order_book order by no desc'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러: {e}')


def add_order_book():
    results = list_order_book()

    for index, result in enumerate(results):
        print(f'{index + 1}\\{result["book_no"]}\\{result["cart_no"]}')


