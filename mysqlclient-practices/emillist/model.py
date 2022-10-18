from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

def findall():
    try:
        print('list 처리')

        db = conn()

        cursor = db.cursor(DictCursor)

        sql = "select first_name,last_name, email from emaillist order by no desc"
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러ㅣ{e}')




def insert(firstname,lastname,email):
    try:
        db = conn()

        cursor = db.cursor()

        sql= "insert into emaillist values(null,'%s,'%s','%s')"
        cursor.execute(sql,(firstname,lastname,email))

        db.commit()

        cursor.close()
        db.close()

        return count == 1
    except OperationalError as e:
        print(f'에러: {e}')

def run_del():
    try:
        db = conn()

        cursor = db.cursor()

        sql= "delete from	emaillist where emaill =%s"
        cursor.execute(sql,(firstname,lastname,email))

        db.commit()

        cursor.close()
        db.close()

    except OperationalError as e:
        print(f'에러: {e}')

def delete_by_email():
    print ('delete 처리')

def conn():
    connect(
        user='webdb',
        password='webdb',
        host='127.0.0.1',
        port=3306,
        db='webdb',
        charset='utf8')

