#Creating Users
taimur = User.create(name: "taimur", username: "dontaimur", password: "grapes")
jesus = User.create(name: "jesus", username: "donjesus", password: "123")
#Creating dreams
a = Dream.create(content: "Cats chasing me at evening")
b = Dream.create(content: "A big white dog was in the school today")
c = Dream.create(content: "Fighting with my best friend")
d = Dream.create(content: "Listening to music")
#Shoving dreams to users
jesus.dreams << a
jesus.dreams << b
taimur.dreams << c
taimur.dreams << d
#Shoving dreams into interpretation
get_seed_data(a)
get_seed_data(b)
get_seed_data(c)
get_seed_data(d)
