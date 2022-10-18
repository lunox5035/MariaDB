from bookmall.models.model_order_book import add_order_book
from bookmall.models.model_cart import add_cart
from bookmall.models.model_book import add_book
from bookmall.models.model_caregory import add_category
from bookmall.models.model_member import  add_member
from bookmall.models.model_order import add_orders

print('1. 회원 리스트')
add_member()
print("=========================")


print('2. 카테고리 리스트')
add_category()
print("=========================")


print('3. 도서리스트')
add_book()
print("=========================")


print('4.카트 리스트')
add_cart()
print("=========================")


print('5. 주문 리스트')
add_orders()
print("=========================")


print('6. 주문 도서 리스트')
add_order_book()
print("=========================")