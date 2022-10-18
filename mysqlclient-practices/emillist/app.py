import model

def run_list():
    results = model.findall()

    for index, result in enumerate(results):
        print(f'{index + 1}:{result["first_name"]}{result["last_name"]}:{result["email"]}')

def run_add():
    firstname = input('first_name:')
    lastname = input('last_name:')
    email = input('email:')

    model.insert(firstname, lastname, email)

    print("---------")
    run_list()

def main():
    while True:
         cmd = input("(l)ist, (a)dd, (d)elete (q)uit")
         if cmd=='q':
            break

         elif cmd=='l':
            run_list()

         elif cmd=='a':
            run_add()

         elif cmd=='d':
             email=input('email:')
             model.delete_by_email(email)
            run_del()

         else:
            print('존재하지 않는 명령어입니다. 다시 입력해주세요.')

if __name__ == '__main__':
    main()

