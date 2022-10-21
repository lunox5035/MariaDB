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

def list_orders():
    try:
        db =conn()
        cursor = db.cursor(DictCursor)
        sql = 'select name,email ,(price*stack)as price, address ' \
              'from orders a ,cart b,member c ,book d ' \
              'where a.cart_no=b.no and a.member_no=c.no and b.no=d.cart_no'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러: {e}')


def add_orders():
    results = list_orders()

    for index, result in enumerate(results):
        print(f'{index + 1}\\{result["name"]}\\{result["email"]}\\{result["price"]}\\{result["address"]}')


