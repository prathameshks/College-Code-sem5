"""Write a program to implement MongoDB database connectivity with 
PHP/python/Java Implement Database navigation CRUD operations 
(add, delete, edit etc.)"""

from pymongo import MongoClient

client = MongoClient('localhost', 27017)

db = client['test']
collection = db['employee']

collection.insert_one({"name": "John", "address": "Highway 21"})

print(collection.find_one({"name": "John"}))

collection.update_one({"name": "John"}, {"$set": {"address": "Canyon 123"}})

print(collection.find_one({"name": "John"}))

collection.delete_one({"name": "John"})

print(collection.find_one({"name": "John"}))

client.close()
